#include <BA1435TX.h>
//#include <stdlib.h>
#include <ctype.h>
#include "PIC18F45K22_registers.h"

#define VERSION "BA1435TX V1.1"

//--------- frequency constants --------------------------------
#define FREQ_P_MULT            64L
#define FREQ_BASE         2575000L       // in KHz
#define FREQ_STEP              10L       // in KHz
#define FREQ_OSC            10000L       // in KHz
#define FREQ_MUL              100L
#define FREQ_MOD              ((FREQ_OSC / FREQ_STEP))

#define FRQ_LO_BOT 5150
#define FRQ_LO_TOP 5250
#define FRQ_HI_BOT 5750
#define FRQ_HI_TOP 5850

//========== power =============================================
UINT low_power_level, power_level, power_control;

#define A2D_POWER 5
#define A2D_PREV  4
#define A2D_TEMP  6
#define A2D_Vdd   0

#define DAC_POS_VOLT 0
#define DAC_NEG_VOLT 1

#define FREQ_LOW_THRESH   22570
#define FREQ_HIGH_THRESH  23290

#define DEADBAND 6

UINT  manual_pos = 0xFFFF;

//========== timer =============================================
UCHAR  TMR_1mS_Flags;
UCHAR  TMR_1mS_Count;
UCHAR  TMR_1mS_Cnt;
UCHAR  TMR_10mS_Count;
UCHAR  TMR_10mS_Flags;
UCHAR  TMR_10mS_Cnt;
UCHAR  TMR_100mS_Flags;
UCHAR  TMR_100mS_Cnt;
UCHAR  TMR_1sec_Flags;

#bit TMR_1MS_KEYPAD     = TMR_1mS_Flags.0
#bit TMR_1MS_DELAY      = TMR_1mS_Flags.1

#bit TMR_100mS_BLINK    = TMR_100mS_Flags.0
#bit TMR_100MS_COMM_TO  = TMR_100mS_Flags.1
#bit TMR_100MS_LEDS     = TMR_100mS_Flags.2
#bit TMR_100MS_POWER    = TMR_100mS_Flags.3

#bit TMR_1sec_DISP_STAT =  TMR_1sec_Flags.0
#bit TMR_1sec_RSSI      =  TMR_1sec_Flags.1
#bit TMR_1Sec_TEMP      =  TMR_1sec_Flags.2

//============= I/O PIN assignments ============================

#define PLL1_LAT  PIN_C1
#define PLL1_CLK  PIN_C2
#define PLL1_DAT  PIN_C3
#define PLL1_LD   PIN_C0

#define CSN       PIN_B2  // FPGA

#define POWER_CTL PIN_B0

#define LED1      PIN_B4
#define LED2      PIN_B5


#define POWER_EN PIN_D6
#define HILO     PIN_D2
#define STANDBY  PIN_D7

#define MET_EN   PIN_B3

//========== COM1 variables ====================================
#define COM1_RX_LEN 32

UCHAR COM1_rcnt;
UCHAR COM1_rxi;
UCHAR COM1_rxo;
UCHAR COM1_rbuf[COM1_RX_LEN];

#define COMM_INIT       0
#define COMM_WAIT_DLR   1
#define COMM_WAIT_CR    2
#define COMM_DELAY      3


#define WAIT_ACK_TO 20 // 200mS wait for ack

UCHAR comm_state;
UCHAR comm_ridx;
UCHAR comm_buf[80];
UINT  comm_timeout;

//======= misc =================================================

//----------- setup ----------------------------------------
struct {
       UCHAR power_amp;
       UINT  frequency;
       UINT  power_level;
       UINT  negative_voltage[3];
       UINT  power_in[3];
       UCHAR meter_backlight;
       UINT  year;
       UCHAR week;
       UINT  unit_ID;
} setup;

UINT allow_write = 0;

//========== function prototypes ===============================
void read_setup(void);
void write_setup(void);
void update_all(void);

//========== include source files ==============================
#include "AD5312.c"
#include "ADF4113.c"
#include "BA1435TX_intr.c"
#include "BA1435TX_serial.c"


//========== functions =========================================

//=============================================================================
void init_io_ports(void)
  {
  output_a(0);
  output_b(0);
  output_c(0);
  output_d(0);
  output_e(0);
  set_tris_a(0b11100001);
  set_tris_b(0b11000010);
  set_tris_c(0b11110001);
  set_tris_d(0b10111011);
  set_tris_e(0b11111111);
  }

//=============================================================================
void write_int_eeprom(UINT addr, UCHAR *data, UINT size)
  {
  while (size--)
    write_eeprom(addr++, *data++);
  }

//=============================================================================
void read_int_eeprom(UINT addr, UCHAR *data, UINT size)
  {
  while (size--)
    *data++ = read_eeprom(addr++);
  }

//=============================================================================
void write_setup(void)
  {
  if (allow_write == 2975)
    write_int_eeprom(0, &setup, sizeof(setup));
  allow_write = 0;
  }

//=============================================================================
void read_setup(void)
  {
  read_int_eeprom(0, &setup, sizeof(setup));
  if (setup.frequency == 0xFFFF || setup.power_level == 0xFF)
    memset(&setup, 0, sizeof(setup));
  }

//--------------------------------------------------------------
void power_output(void)
  {
  UINT power, level;

  if (input(STANDBY))
    {
    if (pwr_command)
      output_high(POWER_EN);
    else
      output_low(POWER_EN);
    }
  else
    output_low(POWER_EN);

  if (setup.power_level)
    {
    set_AD5312(DAC_NEG_VOLT, setup.negative_voltage[1]);
    level = setup.power_in[1];
    }
  else
    {
    set_AD5312(DAC_NEG_VOLT, setup.negative_voltage[0]);
    level = setup.power_in[0];
    }

  set_adc_channel(A2D_POWER); // select forward power input
  delay_us(20);
  power = read_adc();

  /*
  if (input(HILO))
    level = low_power_level;
  else if (rp_command == 0)
    level = low_power_level;
  else
    level = power_level;
  */

  if (power > level + DEADBAND || power < level - DEADBAND)
    {
    if (power < level)
      {
      if (power_control >= 150)
        power_control -= DEADBAND / 2;
      }
    else if (power_control <= 1010)
      {
      power_control += DEADBAND / 2;
      }
    set_AD5312(DAC_POS_VOLT, power_control);
    }
  }

//=============================================================================
#separate
void delay_mst(UINT delay)
  {
  TMR_1MS_DELAY = 0;
  while (delay)
    {
    if (TMR_1MS_DELAY)
      {
      TMR_1MS_DELAY = 0;
      delay--;
      }
    }
  }


//=============================================================================
void init_system(void)
  {

  setup_timer_2(T2_DIV_BY_4,99,10);    // 1.0 ms interrupt
  setup_timer_3(T3_DISABLED | T3_DIV_BY_1);
  setup_timer_4(T4_DIV_BY_4,99,1);     // 100 us interrupt
  setup_timer_5(T5_DISABLED | T5_DIV_BY_1);
  setup_timer_6(T6_DISABLED,0,1);

  init_io_ports();

  setup_adc_ports(sAN0|sAN4|sAN5|sAN6);
  setup_adc(ADC_CLOCK_DIV_16|ADC_TAD_MUL_8);

  setup_comparator(NC_NC_NC_NC);

  COM1_init();
  enable_interrupts(INT_TIMER2);
  enable_interrupts(GLOBAL);
  }


//=============================================================================
void update_all(void)
  {
  UINT freq;
  freq = setup.frequency;
  PLL1_compute_freq_parameters(freq);
  PLL1_update();
  power_control = 1000;
  }

//=============================================================================
void main(void)
  {
  int16 vouta = 1000;
  init_system();

  read_setup();

  power_level = setup.power_in[setup.power_level];
  power_control = 1000;
  power_output();

  PLL1_initialize();

  update_all();

  COM1_send_str("\r\n");
  COM1_send_str(VERSION);
  COM1_send_str("\r\n");

  set_AD5312(DAC_POS_VOLT, vouta);


  delay_ms(2000);
  output_high(POWER_EN);

#ignore_warnings 203
  while (1)
    {
    if (TMR_100mS_BLINK)
      {
      TMR_100mS_BLINK = 0;
      if (setup.power_level)
        output_high(LED1);
      else
        output_toggle(LED1);
      delay_us(1);
      }
    comm_handler();
    power_output();
    }
  }



