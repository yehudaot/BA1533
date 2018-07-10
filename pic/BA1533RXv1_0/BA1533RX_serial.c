
UCHAR comm_ptr; 
UCHAR  pa_command = setup.power_amp, on_command = 1, bit_mode = 0, auto_power = 0;
//UINT count_1sec = 0;

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

//-----------------------------------------------------------------------------
void COM1_init(void)
  {
  COM1_rxi = COM1_rxo = COM1_rcnt = 0;
  comm_state = COMM_INIT;
  enable_interrupts(int_RDA);
  }

//-----------------------------------------------------------------------------
#separate
UINT get_char(void)
  {
  return comm_buf[comm_ptr++];
  }


//-----------------------------------------------------------------------------
#separate
void skip_spc(void)
  {
  while (comm_buf[comm_ptr] && (comm_buf[comm_ptr] == ',' || comm_buf[comm_ptr] == ' '))
    comm_ptr++;
  }

//-----------------------------------------------------------------------------
#separate
UINT peek_char(void)
  {
  skip_spc();
  return comm_buf[comm_ptr];
  }

//-----------------------------------------------------------------------------

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

//-----------------------------------------------------------------------------
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
  skip_spc();
  return num;
  }

//-----------------------------------------------------------------------------
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


//-----------------------------------------------------------------------------
UINT get_frequency(void)
  {
  UINT freq;
  freq = get_int();
  return freq;
  }

//-----------------------------------------------------------------------------
void list_help(void)
  {
  COM1_send_str("\r\n");
  COM1_send_str("$F <frequency><cr>  \tSet frequency in 1MHz increments (i.e.5173 is 5.173GHz)\r\n");
  COM1_send_str("$ON <onoff><cr>  \tSet PLL RF OUT on(1) or off(0)\r\n");
  COM1_send_str("$PS <power><cr>  \tSet amp power on(1) or off(0)\r\n");
  COM1_send_str("$P <level><cr>  \tSet power level high(1) or low(0)\r\n");
  COM1_send_str("$LD <fwd><cr>  \tSet Fwd power measurement on(1) or off(0)\r\n");
  COM1_send_str("$Q<cr>  \tRequest status\r\n");
  COM1_send_str("$BM<cr>  \tBIT Mode ON(1) OFF(0)\r\n");
  COM1_send_str("$TR<cr>  \tTRANSIVER(T) RECIVER(R)");
  //COM1_send_str("\r\n");
  }


//-----------------------------------------------------------------------------
void send_raw_status(void)
  {
	UCHAR buf[64] ;
	UINT iv3p3, iv28;
	float v3p3, v28;
	set_adc_channel(A2D_Vdd); // select 3.3v power input
  	delay_us(20);
  	iv3p3 = read_adc();

	set_adc_channel(A2D_POWER); // select 28v power input
  	delay_us(20);
  	iv28 = read_adc();

	v3p3 = (float)iv3p3 / 1024.0 * 3.3;
	v28 = (float)iv28 / 1024.0 * 36.3;  //36.3 = 3.3 * 11 
	sprintf(buf, "\r\n3.3v power in=%2.1f(v) 28v power in=%2.1f(v)",v3p3, v28);
	COM1_send_str(buf);

	set_adc_channel(A2D_PREV); // select RSSI power input
    delay_us(20);
    
	sprintf(buf, "\r\nRSSI=%lu", read_adc());
	COM1_send_str(buf);
  }




//-----------------------------------------------------------------------------
void send_status(void)
  {
  UINT  itemp, idx, rssi;
  UCHAR buf[64] ;
  float temp ;
 
//  UINT fwdp, revp, muxout;

  set_adc_channel(A2D_PREV); // select RSSI power input
  delay_us(20);
  rssi = read_adc();
 
  float32 numerator=1,denumerator=1,k_rssi=0;
    int n = 11,i,j;


	for(i=0; i<n; i++)
        {
            numerator=1;
            denumerator=1;
            for(j=0; j<n; j++)
            {
                if(j!=i)
                {
 					numerator = numerator * (rssi - (float32)setup.rssi_table[j][0]);
                    denumerator = denumerator * ((float32)setup.rssi_table[i][0] - (float32)setup.rssi_table[j][0]);
                }
            }
            k_rssi=k_rssi+((numerator / denumerator) * (float32)setup.rssi_table[i][1]);
        }
  if(setup.power_level)
	k_rssi+=10;
  	
  
  set_adc_channel(A2D_TEMP); // select tmperature  input
  delay_us(20);
  itemp = read_adc();

  temp = (float)itemp / 1024.0 * 3.3;
  temp -= 0.75;
  temp *= 100;
  temp += 25.0;

  sprintf(buf, "\r\nFREQ=%lu, RSSI=%0.2fdBM, TEMP=%5.1f(c), ID=%lu, DC=%02lu%02u, VER %ls, ",
		  setup.frequency, k_rssi, temp, setup.unit_ID, setup.year, setup.week, VERSION_V);
  COM1_send_str(buf);

  if(setup.meter_backlight == 1)
  sprintf(buf, "LIGHT=ON, ");
  else 
  sprintf(buf, "LIGHT=OFF, ");
  COM1_send_str(buf);
 
  if(pass_count > PASS_FAIL_TRESHOLD)
  	sprintf(buf, "PASS Bit=%ld, ",pass_count);
  else 
  	sprintf(buf, "FAIL Bit=%ld, ",pass_count);
  COM1_send_str(buf);


  if(input(PLL_LD))
	sprintf(buf, "SYNTH LOCK=LOCK, ");
  else
    sprintf(buf, "SYNTH LOCK=NOT LOCK, ");
  COM1_send_str(buf);

  if(bit_mode == 1)
  	sprintf(buf, "BIT MODE=START, ");
  else if(bit_mode == 0)
  	sprintf(buf, "BIT MODE=STOP, ");
  COM1_send_str(buf);

  if(setup.power_level == 1)
	sprintf(buf, "POWER MODE=HIGH, ");
  else
    sprintf(buf, "POWER MODE=LOW, ");
  COM1_send_str(buf);

  if(auto_power)						//sample power_in and compare to PWR_IN_TRESHOLD, change setup.power_level ($P)
	sprintf(buf, "AUTO_POWER=1, ");
  else
	sprintf(buf, "AUTO_POWER=0, ");
  COM1_send_str(buf);

	sprintf(buf, "MODULE TYPE=RX, ");
  COM1_send_str(buf);
  }

//-----------------------------------------------------------------------------
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

//-----------------------------------------------------------------------------
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
  UINT  value;
  chr = 2;
  comm_ptr = 0;
  UINT year, week;
  switch (toupper(get_char()))
    {
    case 'H': 
    case '?':
      list_help();
      return 0;
 // break;

    case 'F':
      freq = get_frequency();
		if (freq >= FRQ_HI_BOT && freq <= FRQ_HI_TOP)
               {
         		setup.frequency = freq;
        	 	PLL_compute_freq_parameters(freq * 10);
         		PLL_update();             
         		allow_write = 2975;
         		write_setup();
         		update_all();
         		}
		else
         		COM1_send_str("\r\n$FAIL\r\n");
		break;
/*///////////////////in case of one software version for high and low frequence
		if(setup.power_level)
		{
      		if (freq >= FRQ_HI_BOT && freq <= FRQ_HI_TOP)
               {
         		setup.frequency = freq;
        	 	PLL_compute_freq_parameters(freq * 10);
         		PLL_update();             
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
        	 	PLL_compute_freq_parameters(freq * 10);
         		PLL_update();             
         		allow_write = 2975;
         		write_setup();
         		update_all();
         		}
      			else
         		COM1_send_str("\r\n$FAIL\r\n");
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
			on_command = 1;
			PLL_update();
            }
          else
            {
  			on_command = 0;
			PLL_mute();
            }
          }
      else
         COM1_send_str("\r\n$FAIL\r\n");
      }
   else
      COM1_send_str("\r\n$FAIL\r\n");         
      break;

	case 'T':							//command TR - return T in case of TX, return R in case of RX
	  if (toupper(get_char()) == 'R')
		{
		COM1_send_str("\r\n$R\r\n");
		}   
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
            fpga_first_val = 1;
			pass_count = 0;
			bit_mode = 1;
			output_high(BIT_MODE_EN);
			enable_interrupts(INT_RDA2); 
            }
          else
            {
            bit_mode = 0;
			output_low(BIT_MODE_EN);
			disable_interrupts(INT_RDA2); 
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
        get_char(); 				// get rid of 'S'
        idx = get_int();
              if (idx <2)
               {
                if (idx)
                 pa_command  = 1;
                else
                 pa_command  = 0;

                 setup.power_amp = pa_command;  
	    		 allow_write = 2975;          
         		 write_setup();
               }
         else  
            COM1_send_str("\r\n$FAIL\r\n");               
         }
         else 							  // $P command
           set_power_level();
		   	allow_write = 2975;          
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
			allow_write = 2975;          
         	write_setup();
         }
   else
         COM1_send_str("\r\n$FAIL\r\n");
        }
   else
      COM1_send_str("\r\n$FAIL\r\n");
      break;

	case 'A':							//command to choose automatic or manual power_level
		idx = get_int();
		if (idx <2)
        {
          if (idx)
			auto_power = 1;
		  else
		  	auto_power = 0;
		}
		else
         COM1_send_str("\r\n$FAIL\r\n");
		break;

	
    case 'S': 			// set tables
      skip_spc();
      idx = get_char(); // get table designator
      addr = get_int(); // get table index
      value = get_int(); // get value to put into table
      switch (toupper(idx))
        {
/*		10/7/18 not used
        case 'N': // negative voltage
                if (addr <2 )
                    {
                    value = value * 0.2048;					//read DAC values in mv
					setup.negative_voltage[addr] = value;
                  	}
               else
                 COM1_send_str("\r\n$FAIL\r\n");

          break;
*/
/*		10/7/18 not used
        case 'P': // positive voltage
             if (addr <2)
              {
              	value = value * 0.2048;					//read DAC values in mv
				setup.power_in[addr] = value;
              }
           else
              COM1_send_str("\r\n$FAIL\r\n");
          break;
*/
		case 'M': // 
          if (addr < 2)
         {
			
			value = value * 0.2048;				//(dacval*5v)/1024 => 1mv = 0.2048
            setup.monitor_ctrl[addr] = value;
         }
            else
                 COM1_send_str("\r\n$FAIL\r\n");
          break;

/*			10/7/18 not used
        case 'R': // rev table
         if (toupper(get_char()) == 'R')
         {
            setup.reverse = value;
         }
         else
            COM1_send_str("\r\n$FAIL\r\n");
          break;
*/
        case 'F': // rssi table
               if (addr < 12)
                 {
                 setup.rssi_table[addr][0] = value;
                 value = get_int();
                 setup.rssi_table[addr][1] = value;
                 }
             else
                 COM1_send_str("\r\n$FAIL\r\n");
            break;


        case 'A': // automatic mode address 0 - high treshold, 1 - low treshold table
               if (addr < 2)
                 {
                 	value = value * 0.3103;
					setup.auto_mode_tresh[addr] = value;
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
	case 'R':
      send_raw_status();
      break;
    default:
      printf("\r\n$FAIL\r\n");

      return 0;
    }
  return 0;     
  }

//-----------------------------------------------------------------------------
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
        if (chr == 13)				//<CR>
          {
          ret = process_dollar_commands();
          if (ret != 255)
            COM1_send_str("\r\n$OK\r\n");
          COM1_init();
          }
        else if (chr == 27)			//ESC
          {
          COM1_send_str("\r\n$BREAK\r\n");
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


//-----------------------------------------------------------------------------
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

//-----------------------------------------------------------------------------
#separate
void comm_handler(void)
  {
  clear_comm_errors();
  dollar_handler();
  }

