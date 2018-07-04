
UCHAR comm_ptr;
UCHAR  pwr_command = 0, pa_command = setup.power_amp, on_command = 1, bit_mode = 0;

//UINT meter1 = 0, meter2 = 0;
//-----------------------------------------------------------------------------
UCHAR COM1_get_chr(void)
  {
  UCHAR x;
  x = COM1_rbuf[COM1_rxo];
  if (++COM1_rxo >= COM1_RX_LEN)
    COM1_rxo = 0;
  if (COM1_rcnt)
    COM1_rcnt--;
  return x;
  }

//-----------------------------------------------------------------------------

UCHAR COM2_get_chr(void)		//uart CPLD
  {
  UCHAR x;
  x = COM2_rbuf[COM2_rxo];
  if (++COM2_rxo >= COM2_RX_LEN)
    COM2_rxo = 0;
  if (COM2_rcnt)
    COM2_rcnt--;
  return x;
  }

//-----------------------------------------------------------------------------
void COM1_send_str(UCHAR *str)
  {
  UCHAR x, pos, tab_stop;
  disable_interrupts(int_RDA);
  pos = 0;
  while (*str)
    {
    x = *str++;
    if (x != '\t')
      {
      TXREG1 = x;
      pos++;
      delay_us(300);
      x = RCREG1;
      }
    else
      {
      tab_stop = 32;
      if (pos >= tab_stop)
        tab_stop = pos + 2;
      while (pos < tab_stop)
        {
        TXREG1 = ' ';
        pos++;
        delay_us(300);
        x = RCREG1;
        }
      }
    }
  x = RCREG1;
  enable_interrupts(int_RDA);
  }

//-----------------------------------------------------------------------------
void COM2_send_str(UCHAR *str)		//uart CPLD
  {
  UCHAR x, pos, tab_stop;
  disable_interrupts(int_RDA2);
  pos = 0;
  while (*str)
    {
    x = *str++;
    if (x != '\t')
      {
      TXREG2 = x;
      pos++;
      delay_us(300);
      x = RCREG2;
      }
    else
      {
      tab_stop = 32;
      if (pos >= tab_stop)
        tab_stop = pos + 2;
      while (pos < tab_stop)
        {
        TXREG2 = ' ';
        pos++;
        delay_us(300);
        x = RCREG2;
        }
      }
    }
  x = RCREG2;
  enable_interrupts(int_RDA2);
  }

//-----------------------------------------------------------------------------
void COM1_init(void)			//UART HOST
  {
  COM1_rxi = COM1_rxo = COM1_rcnt = 0;
  comm_state = COMM_INIT;
  enable_interrupts(int_RDA);
  }

void COM2_init(void)			//uart CPLD
  {
  COM2_rxi = COM2_rxo = COM2_rcnt = 0;
  comm2_state = COMM2_INIT;
  enable_interrupts(int_RDA2);
  }

//----------------------------------------------------------------------------
#separate
UINT get_char(void)
  {
  return comm_buf[comm_ptr++];
  }

//----------------------------------------------------------------------------
#separate
UINT peek_char(void)
  {
//  skip_spc();
  return comm_buf[comm_ptr];
  }

//----------------------------------------------------------------------------
#separate
void skip_spc(void)
  {
  while (comm_buf[comm_ptr] && (comm_buf[comm_ptr] == ',' || comm_buf[comm_ptr] == ' '))
    comm_ptr++;
  }

//----------------------------------------------------------------------------
#separate
SINT get_int(void)
  {
  SINT num, sign = 1;
  skip_spc();
  if (comm_buf[comm_ptr])
    {
    num = 0;
    if (peek_char() == '-')
      {
      sign = -1;
      get_char();
      }
    while (isdigit(comm_buf[comm_ptr]))
      num = (num * 10) + (comm_buf[comm_ptr++] - '0');
    }
//  skip_spc();
  return num * sign;
  }

//----------------------------------------------------------------------------
#separate
ULONG str_to_long(void)
  {
  ULONG num;
  skip_spc();
  if (comm_buf[comm_ptr])   
    {
    num = 0;
    while (isdigit(comm_buf[comm_ptr]))
      num = (num * 10) + (comm_buf[comm_ptr++] - '0');
    }
//  skip_spc();
  return num;
  }

//----------------------------------------------------------------------------
#separate
ULONG get_hex(void)
  {
  ULONG num;
  UCHAR chr;
  skip_spc();
  if (peek_char())
    {
    num = 0;
    while (isxdigit(peek_char()))
      {
      chr = get_char();
      chr = toupper(chr);
      if (chr <= '9')
        chr -= '0';
      else
        chr = chr - ('A' - 10);
      num = num * 16 + (ULONG)chr;
      }
    }
  return num;
  }

//----------------------------------------------------------------------------
UINT get_frequency(void)
  {
  UINT freq;
  freq = get_int();
  return freq;
  }
//----------------------------------------------------------------------------
/*void meter1(void)
  {
  UINT meter1;
  meter1 = get_int();
  }

//----------------------------------------------------------------------------
void meter2(void)
  {
  UINT meter2;
  meter2 = get_int();
  }
*/
//----------------------------------------------------------------------------
void list_help(void)
  {
  COM1_send_str("\r\n");
  COM1_send_str("$F <frequency><cr>  \tSet frequency in 1MHz increments (i.e.2250 is 2.250GHz)\r\n");
  COM1_send_str("$ON <onoff><cr>  \tSet full operation on(1) or off(0)\r\n");
  COM1_send_str("$PS <power><cr>  \tSet amp power on(1) or off(0)\r\n");
  COM1_send_str("$P <level><cr>  \tSet power level high(1) or low(0)\r\n");
  COM1_send_str("$LD <fwd><cr>  \tSet Fwd power measurement on(1) or off(0)\r\n");
  COM1_send_str("$Q<cr>  \tRequest status\r\n");
  COM1_send_str("$BM<cr>  \tBIT Mode ON(1) OFF(0)");
  COM1_send_str("$TR<cr>  \tTRANSIVER(T) RECIVER(R)");
  //COM1_send_str("\r\n");
  }

//----------------------------------------------------------------------------
void send_status(void)
  {
  UINT revp, fpwr, itemp, idx;
  UCHAR buf[64], revstat[11], light_stat[11], transmit_stat[11], bit_mode_stat[11], lock_stat[11], power_stat[11];
  float temp;



  set_adc_channel(A2D_PREV); // select reverse power input
  delay_us(20);
  revp = read_adc();

  set_adc_channel(A2D_TEMP); // select temperature input
  delay_us(20);
  itemp = read_adc();

  temp = (float)itemp / 1024.0 * 3.3;
  temp -= 0.75;
  temp *= 100;
  temp += 25.0;

  set_adc_channel(A2D_POWER); // select forward power input
  delay_us(20);
  fpwr = read_adc();

  for (idx = 0; idx < 12; idx++)
    if (fpwr <= setup.fwd_table[idx][0])
      break;
  fpwr = setup.fwd_table[idx][1];

  if (revp <= 530)
    strcpy(revstat, "GOOD");
  else
    strcpy(revstat, "BAD");

  if(setup.meter_backlight == 1)
  	strcpy(light_stat, "ON");
  else 
  	strcpy(light_stat, "OFF");

  if((pa_command == 1) && (on_command == 1))
  	strcpy(transmit_stat, "ON");
  else 
  	strcpy(transmit_stat, "OFF");

  if(bit_mode == 1)
  	strcpy(bit_mode_stat, "START");
  else 
  	strcpy(bit_mode_stat, "STOP");

  if(!input(PLL1_LD))
	strcpy(lock_stat, "LOCK");
  else
    strcpy(lock_stat, "NOT LOCK");


  if(setup.power_level == 1)
	strcpy(power_stat, "HIGH");
  else
    strcpy(power_stat, "LOW");
 



  sprintf(buf, "\r\nFREQ=%lu, REV=%s, LIGHT=%s, FWD=%ludBM, TEMP=%5.1f, TRANSMIT=%s, ID=%lu, DC=%02lu%02u, VER %ls, ",
          setup.frequency, revstat, light_stat, fpwr, temp, transmit_stat, setup.unit_ID, setup.year, setup.week, VERSION_V);
  COM1_send_str(buf);
  sprintf(buf, "BIT MODE=%s, SYNTH LOCK=%s, POWER=%s, ",bit_mode_stat, lock_stat, power_stat);

  COM1_send_str(buf);

  }

//----------------------------------------------------------------------------
bit set_power_level(void)
  {
  UINT idx;
  idx = get_int();
  if (idx < 2)
   {
    setup.power_level = idx;
    return 1;
    }
  return 0;
  }
//----------------------------------------------------------------------------
/*UINT meter_out(void)
  {
  UINT meter;
  meter = get_int();
  if(meter && meter<=200)
  {
    return meter;
  }
return 0;

  }







*/
//----------------------------------------------------------------------------
// command format:
//   $<cmd> [<number>[,<number>]]<cr>
// where:
//    <cmd>       a two letter operation specifier
//    <number>    value to be used in operation
//    <cr>        0x0D character ending command string
//
UCHAR process_dollar_commands(void)
  {
  UCHAR chr, idx, addr;
  ULONG freq;
  UINT  value;// meter1, meter2;
  chr = 2;
  comm_ptr = 0;
  UINT year, week;
  int16 dac_val;
  switch (toupper(get_char()))
    {
    case 'H': case '?':
      list_help();
      return 0;
   case 'F':
      freq = get_frequency();
      if(setup.power_level)
		{
			if (freq >= FRQ_HI_BOT && freq <= FRQ_HI_TOP)
         	{
             setup.frequency = freq;
             PLL1_compute_freq_parameters(freq * 10);
             PLL1_update();             
             allow_write = 2975;
             write_setup();
             update_all();
         	}
      		else
         		COM1_send_str("\r\n$FAIL\r\n");
  		}
		else
    	{
		    if (freq >= FRQ_LO_BOT && freq <= FRQ_LO_TOP)
         	{
              setup.frequency = freq;
              PLL1_compute_freq_parameters(freq * 10);
              PLL1_update();             
            allow_write = 2975;
             write_setup();
             update_all();
         	}
      		else
         		COM1_send_str("\r\n$FAIL\r\n");
    
    	}
      break;
      
    /*  case 'M':
        idx = get_int();
        if(idx ==1)
          {
          value = get_int();
          meter1 = value;
          }
          if(idx == 2)
            {
            value = get_int();
            meter2 = value;
            }
            break;
*/
    case 'O':
      if (toupper(get_char()) == 'N')
        {
        idx = get_int();
        if (idx <2)
          {
          if (idx)
            {
			output_high(PLL1_CE);
            //pa_command  = 1;
            on_command = 1;
            }
          else
            {
			output_low(PLL1_CE);
            //pa_command  = 0;
            on_command = 0;
            }
			//allow_write = 2975;          ////yehuda save LD command into EEPROM when changed
         //	write_setup();
          }
      else
         COM1_send_str("\r\n$FAIL\r\n");
      }
   else
      COM1_send_str("\r\n$FAIL\r\n");         
      break;

	case 'T':							//command TR - return T in case of TX, return R in case of RX
	  if (toupper(get_char()) == 'R')
		COM1_send_str("\r\n$T\r\n");
	  else
		COM1_send_str("\r\n$FAIL\r\n");
		break;
		


    case 'B':
      if (toupper(get_char()) == 'M')
        {
        idx = get_int();
        if (idx <2)
          {
          if (idx)
            {
            bit_mode = 1;
			output_high(BIT_MODE_EN);
			fprintf(UART_CPLD,"$ON");
            }
          else
            {
            bit_mode = 0;
			output_low(BIT_MODE_EN);
            }
          }
      else
         COM1_send_str("\r\n$FAIL\r\n");
      }
   else
      COM1_send_str("\r\n$FAIL\r\n");         
      break;


    case 'P':
      if (toupper(peek_char()) == 'S') // $PS command
        {
        get_char(); // get rid of 'S'
        idx = get_int();
              if (idx <2)
               {
                if (idx)
                   {
                   pa_command  = 1;
				   //output_high(PLL1_CE);			//keep PLL CE constant HIGH
                   }
                 else
                    {
                 	pa_command  = 0;
				    //output_low(PLL1_CE);			//keep PLL CE constant HIGH
                    }
				
					setup.power_amp = pa_command;  //yehuda add this line too
					allow_write = 2975;          ////yehuda save LD command into EEPROM when changed
         			write_setup();
                 }
         		 else  
            		COM1_send_str("\r\n$FAIL\r\n");               
         }
         else 										// $P command, set setup.power_level
            set_power_level();
			allow_write = 2975;          			////yehuda save LD command into EEPROM when changed
         	write_setup();
         break;

    case 'L':
      if (toupper(get_char()) == 'D')
        {
        idx = get_int();
        if (idx <2)
        {
          if (idx)
            {
            setup.meter_backlight = 1;
            output_high(MET_EN);
            }
          else
            {
            setup.meter_backlight = 0;
            output_low(MET_EN);
            }
			allow_write = 2975;          ////yehuda save LD command into EEPROM when changed
         	write_setup();
         }
   else
         COM1_send_str("\r\n$FAIL\r\n");
        }
   else
      COM1_send_str("\r\n$FAIL\r\n");
      break;

/////////////////DAC DEBUG yehuda////////////////////
/*
$C0 - set all 0
$C1 xxx - set A to xxx 
$C2 xxx - set B to xxx  
$C3 xxx - set C to xxx 
$C4 xxx - set D to xxx 
$C5 - set all to 1v
$C6 - set all to 2v
$C7 - set all to 3v
*/

   case 'C':
	{
		idx = get_int();
		if(idx == 0)
		{
			set_AD5312(2, 0);
			set_AD5312(6, 0);
			set_AD5312(10, 0);
			set_AD5312(14, 0);
		}
		if(idx == 1)
		{
			dac_val = get_int();
			set_AD5312(2, dac_val);
		}
		if(idx == 2)
		{
			dac_val = get_int();
			set_AD5312(6, dac_val);
		}
		if(idx == 3)
		{
			dac_val = get_int();
			set_AD5312(10, dac_val);
		}
		if(idx == 4)
		{
			dac_val = get_int();
			set_AD5312(14, dac_val);
		}
		if(idx == 5)
		{
			set_AD5312(2, 210);
			set_AD5312(6, 210);
			set_AD5312(10, 210);
			set_AD5312(14, 210);
		}
		if(idx == 6)
		{
			set_AD5312(2, 420);
			set_AD5312(6, 420);
			set_AD5312(10, 420);
			set_AD5312(14, 420);
		}
		if(idx == 7)
		{
			set_AD5312(2, 630);
			set_AD5312(6, 630);
			set_AD5312(10, 630);
			set_AD5312(14, 630);
		}
	}






    /*  case 'M':
		addr = get_int();
			if(addr)
				{
				meter1();
				}
				else
					meter2();
            break;*/

    case 'S': // set tables
      skip_spc();
      idx = get_char(); // get table designator
      addr = get_int(); // get table index
      value = get_int(); // get value to put into table
      switch (toupper(idx))
        {
        case 'N': // negative voltage
          if (addr < 2)
         {
            setup.negative_voltage[addr] = value;
         }
            else
                 COM1_send_str("\r\n$FAIL\r\n");
          break;

        case 'P': // positive voltage
             if (addr <4)
              {
              setup.power_in[addr] = value;
              }
           else
              COM1_send_str("\r\n$FAIL\r\n");
          break;

        case 'R': // rev table
         if (toupper(get_char()) == 'R')
         {
            setup.reverse = value;
         }
         else
            COM1_send_str("\r\n$FAIL\r\n");
          break;

 


     
   case 'F': // forward table
          if (addr < 12)
            {
            setup.fwd_table[addr][0] = value;
            value = get_int();
            setup.fwd_table[addr][1] = value;
            }
             else
                 COM1_send_str("\r\n$FAIL\r\n");
          break;

        case 'V': // save parameters
          allow_write = 2975;
          write_setup();
          update_all();
          break;
        }
      break;

    case '1': // year   
      year = get_int();
       if(year > 0 && year < 100) 
         {
      setup.year = year;
      }
   else
      COM1_send_str("\r\n$FAIL\r\n");
    break;

    case '2': // week
      week = get_int();
      if(week > 0 && week < 58) 
      {
      setup.week = week;
      }  
   else
      COM1_send_str("\r\n$FAIL\r\n");
   break;
    case '3': // unit ID
      setup.unit_ID = get_int();
      break;
    case 'Q':
      send_status();
      break;
    default:
      printf("\r\n$FAIL\r\n");

      return 0;
    }
  return 0;
  }

//----------------------------------------------------------------------------
void dollar_handler(void)
  {
  UINT chr, ret;

  switch (comm_state)
    {
    case COMM_INIT:
      comm_ridx = 0;
      comm_state++;
      break;
    case COMM_WAIT_DLR:
#ignore_warnings 201
    if (COM1_rcnt)
      {
      chr = COM1_get_chr();
      if (chr)
          if (chr == '$')
             {
             comm_state++;
             comm_timeout = 0;
             }   
           else
              COM1_send_str("\r\n$FAULT\r\n");
      }
      break;
    case COMM_WAIT_CR:
      if (COM1_rcnt)
        {
        comm_timeout = 0;
        chr = COM1_get_chr();
        comm_buf[comm_ridx++] = chr;
        if (comm_ridx > 70)
          {
          comm_state = 0;
          break;
          }
        if (chr == 13)
          {
          ret = process_dollar_commands();
          if (ret != 255)
            COM1_send_str("\r\n$OK\r\n");
          COM1_init();
          }
        else if (chr == 27)
          {
          COM1_send_str("\r\nBREAK\r\n");
          comm_state = 0;
          }
        }

      if (comm_state > COMM_WAIT_DLR)
        if (TMR_100MS_COMM_TO)
          {
          TMR_100MS_COMM_TO = 0;
          if (++comm_timeout > 10000) // time out after 10 seconds from last char
            comm_state = 0;
          }
      break;
    case COMM_DELAY:
      break;
    }
  }


//----------------------------------------------------------------------------
void clear_comm_errors(void)
  {
  UCHAR chr;
  if (OERR)
    {
    OERR = 0;
    CREN = 0;
    delay_us(5);
    CREN = 1;
    }
  if (FERR)
    {
    FERR = 0;
    chr = RCREG1;
    }
  }

//----------------------------------------------------------------------------
#separate
void comm_handler(void)
  {
  clear_comm_errors();
  dollar_handler();
  }
