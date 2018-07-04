#include <BA1533RX.h>
#include <ctype.h>
#include "PIC18F45K22_registers.h"

#define VERSION "BA1533RX V1.0"
#define VERSION_V "V1.0"

//--------- frequency constants -----------------------------------------------
#define FREQ_P_MULT            32L
#define FREQ_BASE         2095000L       // in KHz
#define FREQ_STEP              100L       // in KHz
#define FREQ_OSC            10000L       // in KHz
#define FREQ_MUL              100L
#define FREQ_MOD              ((FREQ_OSC / FREQ_STEP))

#define FRQ_LO_BOT 5150
#define FRQ_LO_TOP 5250
#define FRQ_HI_BOT 5650
#define FRQ_HI_TOP 5850

//========== power ============================================================
UINT  power_level, power_control;

#define A2D_POWER   8    //28v
#define A2D_PREV    5    //rssi
#define A2D_TEMP    6
#define A2D_PWR_IN  7
#define A2D_Vdd     0

#define PWR_IN_TRESHOLD 100
#define PASS_FAIL_TRESHOLD 60

#define DAC_POS_VOLT 0
#define DAC_NEG_VOLT 1

#define FREQ_LOW_THRESH   22570
#define FREQ_HIGH_THRESH  23290

#define DEADBAND 6


//========== timer ============================================================
UCHAR  TMR_1mS_Flags;
UCHAR  TMR_1mS_Count;
UCHAR  TMR_1mS_Cnt;
UCHAR  TMR_10mS_Count;
UCHAR  TMR_10mS_Flags;
UCHAR  TMR_10mS_Cnt;
UCHAR  TMR_100mS_Flags;
UCHAR  TMR_100mS_Cnt;
UCHAR  TMR_1sec_Flags;
UCHAR  TMR_1sec_cnt;

#bit TMR_1MS_KEYPAD     = TMR_1mS_Flags.0
#bit TMR_1MS_DELAY      = TMR_1mS_Flags.1

#bit TMR_100mS_BLINK    = TMR_100mS_Flags.0
#bit TMR_100MS_COMM_TO  = TMR_100mS_Flags.1
#bit TMR_100MS_LEDS     = TMR_100mS_Flags.2
#bit TMR_100MS_POWER    = TMR_100mS_Flags.3

#bit TMR_1sec_DISP_STAT =  TMR_1sec_Flags.0
#bit TMR_1sec_RSSI      =  TMR_1sec_Flags.1
#bit TMR_1Sec_TEMP      =  TMR_1sec_Flags.2
#bit TMR_1Sec_BIT_EN    =  TMR_1sec_Flags.3

#define sense_28v  PIN_B2
#define MET_EN     PIN_B3
#define LED1      PIN_B4
#define LED2      PIN_B5

#define RREV     PIN_A5 // sAN4
#define FFWR     PIN_E0 // sAN5 rssi
#define TMP      PIN_E1 // sAN6 temperature
#define PWR_IN   PIN_E2 // sAN7

#define PLL_LD   PIN_C0
#define PLL_DAT  PIN_C3
#define PLL_LAT  PIN_C1
#define PLL_CLK  PIN_C2

#define VC1		 PIN_D0
#define VC2		 PIN_D1
 
#define LNA_EN   PIN_D2			

#define BIT_MODE_EN  PIN_D3

#define VGMON_THRESHOLD 650 // 2.1V

#define METER_OUTPUT1  1   // 1
#define METER_OUTPUT2  5   // 11
#define METER_OUTPUT3  48   // 111 
#define METER_OUTPUT4  481  // 1111

UINT power_avg[4], pavgx = 0;
int16 pass_count = 0;
//========== COM1 variables ===================================================
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

//======= misc ================================================================

//----------- setup -----------------------------------------------------------
struct {
       UCHAR power_amp;
       UINT  frequency;
       UINT  power_level;
       UINT  negative_voltage[3];
       UINT  power_in[4];
       UINT  reverse;
       UCHAR meter_backlight;
       UINT  year;
       UCHAR week;
       UINT  unit_ID;
       UINT  rssi_table[9][2];

} setup;

UINT allow_write = 0;

//========== function prototypes ==============================================
void read_setup(void);
void write_setup(void);
void update_all(void);

//========== include source files =============================================
#include "AD5312.c"
#include "ADF4350.c"
#include "BA1533RX_intr.c"
#include "BA1533RX_serial.c"


//========== functions ========================================================

//=============================================================================
void init_io_ports(void)
  {
  output_a(0);
  output_b(0);
  output_c(0);
  output_d(0);
  output_e(0);
  set_tris_a(0b11000001);
  set_tris_b(0b11000100);
  set_tris_c(0b10000001);
  set_tris_d(0b10000000);
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

//==============================================================================
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

//-----------------------------------------------------------------------------
#separate
void power_output(void)
  {
  UINT power;

//  if (input(STANDBY))
//    {
//    if (pwr_command)
//      output_high(POWER_EN);
//    else
//      output_low(POWER_EN);
	if(pa_command)
	{
		output_high(LNA_EN);
	}
	else
	{
		output_low(LNA_EN);
	}
    //set_adc_channel(A2D_VGMON); // select forward power input
//	set_adc_channel(PWR_IN); // select forward power input
//    delay_us(20);
//    power = read_adc();
//    if (power > VGMON_THRESHOLD)
//      output_low(PA_ON);
//    else if (pa_command)
//      output_high(PA_ON);
//    else
//      output_low(PA_ON);
//   }
//  else
//    {
//    output_low(POWER_EN);
//    output_low(PA_ON);
//    }

  if (setup.power_level)
    {
    set_AD5312(DAC_NEG_VOLT, setup.negative_voltage[1]);
    }
  else
    {
    set_AD5312(DAC_NEG_VOLT, setup.negative_voltage[0]);
    }

  	set_adc_channel(A2D_PWR_IN); // select PWR_IN power input
    delay_us(20);
    power = read_adc();
	if(power > PWR_IN_TRESHOLD)
		{
		output_high(VC1);
		output_low(VC2);
		}
		else
		{
		output_low(VC1);
		output_high(VC2);
		}

	if(auto_power)
	{
		if(power > PWR_IN_TRESHOLD)
			setup.power_level = 1;
		else
			setup.power_level = 0;
	}

 
  if (TMR_100MS_POWER)
    {
    TMR_100MS_POWER = 0;
    set_adc_channel(A2D_PREV); // select RSSI power input
    delay_us(20);
    power = read_adc();
    power_avg[pavgx] = power;
    if (++pavgx > 3)
      pavgx = 0;
    power = (power_avg[0] + power_avg[1] + power_avg[2] + power_avg[3]) / 4;
    if (power < setup.rssi_table[0][0])
      set_AD5312(DAC_POS_VOLT, METER_OUTPUT1);
    else if (power < setup.rssi_table[4][0])
      set_AD5312(DAC_POS_VOLT, METER_OUTPUT2);
    else if (power < setup.rssi_table[8][0])
      set_AD5312(DAC_POS_VOLT, METER_OUTPUT3);
    else
      set_AD5312(DAC_POS_VOLT, METER_OUTPUT4);
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

  //setup_ccp5(CCP_OFF);
//				  3p3  RSSI TMP  PWR_IN 28v
  setup_adc_ports(sAN0|sAN5|sAN6|sAN7|sAN8);
  setup_adc(ADC_CLOCK_DIV_16|ADC_TAD_MUL_8);

  setup_comparator(NC_NC_NC_NC);

  COM1_init();
  disable_interrupts(INT_RDA2); 
  enable_interrupts(INT_TIMER2);
  enable_interrupts(GLOBAL);
  }


//=============================================================================
void update_all(void)
  {
  UINT freq;
  freq = setup.frequency;
  PLL_compute_freq_parameters(freq * 10);
  PLL_update();
  power_control = 1000;
  }

//=============================================================================

void check_bit_mode(void)
  {

	if(TMR_1Sec_BIT_EN)
		{
			TMR_1Sec_BIT_EN = 0;
			count_1sec++;
			if(count_1sec >= 11)
			{	
				count_1sec = 0;
				output_low(BIT_MODE_EN);
  				bit_mode = 0;
				
			}
		}
  }

//=============================================================================
void main(void)
  {
  int16 vouta =1000, five = 1;
  init_system();
  
  read_setup();

  power_level = setup.power_in[setup.power_level];
  power_control = 10;

  PLL_initialize();

  update_all();

  COM1_send_str("\r\n");
  COM1_send_str(VERSION);
  COM1_send_str("\r\n");

  set_AD5312(DAC_POS_VOLT, vouta);
  delay_ms(10);
  output_low(BIT_MODE_EN);
  bit_mode = 0;
  output_high(VC1);
  output_low(VC2);
  output_high(LNA_EN);

#ignore_warnings 203
  while (1)
    {
    if (TMR_100mS_BLINK)
      {
      TMR_100mS_BLINK = 0;
	  if(five)
	  {
	  five = 0;
	  update_all();
      }
      if (setup.power_level)		//$p power mode high
        output_high(LED1);
      else
        output_toggle(LED1);		//$p power mode low
      delay_us(1);
      }

	if(bit_mode == 1)
		check_bit_mode();

    power_output();
    comm_handler();
    }

  vouta = 1;
  }



