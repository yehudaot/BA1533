#include <18F45K22.h>
#device adc=10
#device pass_strings=in_ram

#FUSES NOWDT                   //No Watch Dog Timer
#FUSES WDT128                  //Watch Dog Timer uses 1:128 Postscale
#FUSES INTRC_IO                //Internal RC Osc, no CLKOUT
#FUSES NOBROWNOUT              //No brownout reset
#FUSES WDT_SW                  //No Watch Dog Timer, enabled in Software
#FUSES NOLVP                   //No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O
#FUSES NOPUT
#FUSES NOXINST                 //Extended set extension and Indexed Addressing mode disabled (Legacy mode)

#use delay(int=16000000, restart_wdt)
#use rs232(baud=38400,parity=N,xmit=PIN_C6,rcv=PIN_C7,bits=8,stream=UART_HOST)

#use rs232(baud=115200,parity=N,xmit=PIN_D7,rcv=PIN_D6,bits=8,stream=UART_CPLD)

#define UINT  unsigned int16
#define SINT  signed int16
#define UCHAR int8
#define ICHAR signed int8
#define bit   int1
#define ULONG int32
#define ILONG signed int32

#opt 9

#use fast_io(a)
#use fast_io(b)
#use fast_io(c)
#use fast_io(d)
#use fast_io(e)


