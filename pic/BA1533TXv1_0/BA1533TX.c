
#include <BA1533TX.h>
#include <ctype.h>
#include "PIC18F45K22_registers.h"

#define VERSION "BA1533TX V1.0"
#define VERSION_V "V1.0"

//--------- frequency constants -----------------------------------------------
#define FREQ_P_MULT            64L
#define FREQ_BASE         2575000L       // in KHz
#define FREQ_STEP              10L       // in KHz
#define FREQ_OSC            10000L       // in KHz
#define FREQ_MUL              100L
#define FREQ_MOD              ((FREQ_OSC / FREQ_STEP))

#define FRQ_LO_BOT 5150
#define FRQ_LO_TOP 5250
#define FRQ_HI_BOT 5675
#define FRQ_HI_TOP 5685

//========== power ============================================================
UINT  power_level, power_control;

#define A2D_POWER 5		//FFWR
#define A2D_PREV  4
#define A2D_TEMP  25
//#define A2D_VGMON 7
//#define FFWR	  5
#define A2D_FFWR2 6
#define A2D_Vdd   0
#define A2D_28v   9

#define DAC_POS_VOLT 0
#define DAC_NEG_VOLT 1

#define FREQ_LOW_THRESH   22570
#define FREQ_HIGH_THRESH  23290

#define DEADBAND 6

// UINT  manual_pos = 0xFFFF;

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

//============= I/O PIN assignments ===========================================

#define PLL1_LAT  PIN_C2
#define PLL1_CLK  PIN_C3
#define PLL1_DAT  PIN_D0
#define PLL1_LD   PIN_D1
#define PLL1_CE   PIN_C1

#define BIT_MODE_EN  PIN_C4  		// FPGA BIT_EN

//#define POWER_CTL PIN_C5		//PREAMP2_EN
//#define PA_ON     POWER_CTL

#define PREAMP_EN  PIN_D2		//PS = 1 ? 1 : 0
#define PREAMP2_EN PIN_C5		//PS = 1 ? 1 : 0
#define TX_RX_INIT PIN_D3		//PS = 1 ? 1 : 0

#define CPLD_RX	  PIN_D6
#define CPLD_TX	  PIN_D7

#define LED1      PIN_C0
#define LED2      PIN_B4

////////////////#define HILO     PIN_D2   yehuda
//#define STANDBY  PIN_B0		//was D7 changed to B0 TXRX_MCU
#define TXRX_MCU   PIN_B0

#define MET_EN   PIN_B2
#define SENS_28V PIN_B3	//sAN9   connected to ADC

#define RREV     PIN_A5 // sAN4  connected to ADC
#define FFWR1    PIN_E1 // sAN6  connected to ADC
#define FFWR2    PIN_E0 // sAN5  connected to ADC
#define MCU_3P3	 PIN_A0	// sAN0	 connected to ADC

#define TMP      PIN_D5 // sAN25 temperature connected to ADC
//#define VG_MON   PIN_E2 // sAN7
#define RF_INDENT   PIN_E2 // sAN7

#define VGMON_THRESHOLD 650 // 2.1V

#define METER_OUTPUT1  100    // 1
#define METER_OUTPUT2  16   // 11
#define METER_OUTPUT3  98   // 111 
#define METER_OUTPUT4  784  // 1111

UINT power_avg[4], pavgx = 0;

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


//========== COM2 variables ===================================================
#define COM2_RX_LEN 32

UCHAR COM2_rcnt;
UCHAR COM2_rxi;
UCHAR COM2_rxo;
UCHAR COM2_rbuf[COM2_RX_LEN];

#define COMM2_INIT       0
#define COMM2_WAIT_DLR   1
#define COMM2_WAIT_CR    2
#define COMM2_DELAY      3

#define WAIT_ACK2_TO 20 // 200mS wait for ack

UCHAR comm2_state;
UCHAR comm2_ridx;
UCHAR comm2_buf[80];
UINT  comm2_timeout;


//======= misc ================================================================

//----------- setup -----------------------------------------------------------
struct {
       UCHAR power_amp;
       UINT  frequency;
       UINT  power_level;
       UINT  negative_voltage[3];
       UINT  power_in[4];
       UINT  fwd_table[11][2];
       UINT  reverse;
       UCHAR meter_backlight;
       UINT  year;
       UCHAR week;
       UINT  unit_ID;
} setup;

UINT allow_write = 0;

//========== function prototypes ==============================================
void read_setup(void);
void write_setup(void);
void update_all(void);
//void meter1(void);
//void meter2(void);

//========== include source files =============================================
#include "AD5312.c"
#include "ADF4113.c"
#include "BA1533TX_intr.c"
#include "BA1533TX_serial.c"


//========== functions ========================================================

//=============================================================================
void init_io_ports(void)
  {
  output_a(0);
  output_b(0);
  output_c(0);
  output_d(0);
  output_e(0);
//  set_tris_a(0b11100001);
//  set_tris_b(0b11000010);
//  set_tris_c(0b11110001);
//  set_tris_d(0b10111011);
//  set_tris_e(0b11111111);
  set_tris_a(0b11100001);
  set_tris_b(0b11001001);
  set_tris_c(0b10000001);
  set_tris_d(0b10100010);
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
		output_high(PREAMP_EN);
		output_high(PREAMP2_EN);
		output_high(TX_RX_INIT);
	}
	else
	{
		output_low(PREAMP_EN);
		output_low(PREAMP2_EN);
		output_low(TX_RX_INIT);
	}



//    set_adc_channel(A2D_VGMON); // select forward power input
//    delay_us(20);
//    power = read_adc();
//    if (power > VGMON_THRESHOLD)
//      output_low(PA_ON);
//    else if (pa_command)
//      output_high(PA_ON);
//    else
//      output_low(PA_ON);
//    }
//  else
//    {
//    output_low(POWER_EN);
//    output_low(PA_ON);
//    }





/*
  if (setup.power_level)
    {
    set_AD5312(DAC_NEG_VOLT, setup.negative_voltage[1]);
    }
  else
    {
    set_AD5312(DAC_NEG_VOLT, setup.negative_voltage[0]);
    }
*/

  if (TMR_100MS_POWER)
    {
    TMR_100MS_POWER = 0;
    set_adc_channel(A2D_POWER); // select forward power input
    delay_us(20);
    power = read_adc();
    power_avg[pavgx] = power;
    if (++pavgx > 3)
      pavgx = 0;
    power = (power_avg[0] + power_avg[1] + power_avg[2] + power_avg[3]) / 4;



/*
    if (power < setup.fwd_table[5][0])
      set_AD5312(DAC_POS_VOLT, METER_OUTPUT1);
 //   else if (power < setup.fwd_table[2][0])
 //     set_AD5312(DAC_POS_VOLT, METER_OUTPUT2);
 //   else if (power < setup.fwd_table[7][0])
  //    set_AD5312(DAC_POS_VOLT, METER_OUTPUT3);
    else
      set_AD5312(DAC_POS_VOLT, METER_OUTPUT4);

*/
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
  //setup_timer_6(T6_DIV_BY_4,99,10000);  //1.0 sec interrupt

  init_io_ports();
//  setup_ccp5(CCP_OFF);								//  0       4       5       6      9      25
													    //MCU_3P3 RREV    FFWR2   FFWR1  SENS_28V TMP
  setup_adc_ports(sAN0|sAN4|sAN5|sAN6|sAN9|sAN25);   	//PIN_A0, PIN_A5, PIN_E0, PIN_E1,PIN_B3,PIN_D5
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
  PLL1_compute_freq_parameters(freq * 10);
  PLL1_update();
  power_control = 1000;
  }

//=============================================================================
void main(void)
  {
  int16 vouta = 1000;
  int16 count_1sec = 0;
  init_system();

  read_setup();

  power_level = setup.power_in[setup.power_level];
  power_control = 1000;
//  power_output();


  PLL1_initialize();

  update_all();

  COM1_send_str("\r\n");
  COM1_send_str(VERSION);
  COM1_send_str("\r\n");

  set_AD5312(DAC_POS_VOLT, vouta);

  delay_ms(2000);
//  output_high(POWER_EN);

  output_low(BIT_MODE_EN);		//init BIT MODE EN to off
 


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
	  
	if(bit_mode == 1)
	{
		if(TMR_1Sec_BIT_EN)
		{
			TMR_1Sec_BIT_EN = 0;
			count_1sec++;
			if(count_1sec >= 10)
			{	
				count_1sec = 0;
				output_low(BIT_MODE_EN);
  				bit_mode = 0;
			}
		}
	}
    power_output();
    comm_handler();
    }

  vouta = 1;
  }



