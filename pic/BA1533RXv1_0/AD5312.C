
#define SW_SPI

#define DA2_CLK   PIN_A3 // AD5312
#define DA2_DAT   PIN_A4
#define DA2_SYN   PIN_A2
#define DA2_LAT   PIN_A1

void set_AD5314(int8 channel, int16 level)
  {
  output_low(DA2_SYN);

  if (channel)
    output_high(DA2_DAT);    // send to VOUTB
  else
    output_low(DA2_DAT);    // send to VOUTA

#ifdef SW_SPI
  output_high(DA2_CLK);  // select VoutA/B
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_low(DA2_DAT);

  output_high(DA2_CLK);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);


  output_high(DA2_CLK);
  if (level & 0x0200)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0100)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0080)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0040)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0020)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0010)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0008)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0004)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0002)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  if (level & 0x0001)
    output_high(DA2_DAT);
  else
    output_low(DA2_DAT);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);


  output_high(DA2_CLK);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);

  output_high(DA2_CLK);
  delay_us(15);
  output_low(DA2_CLK);
  delay_us(15);
#else
   level = (level << 2) | 0x8000;
   SPI2BUF = (AD5312,make8(level,1));
   delay_us(15);
   SPI2BUF = (AD5312,make8(level,0));
   delay_us(16);
#endif

  output_high(DA2_SYN);
  delay_us(15);
  output_low(DA2_LAT);
  delay_us(15);
  output_high(DA2_LAT);
  delay_us(15);
  }
