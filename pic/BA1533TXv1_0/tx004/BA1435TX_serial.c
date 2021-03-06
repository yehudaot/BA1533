
UCHAR comm_ptr;
UCHAR rp_command = 1, pwr_command = 1;

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
void COM1_init(void)
  {
  COM1_rxi = COM1_rxo = COM1_rcnt = 0;
  comm_state = COMM_INIT;
  enable_interrupts(int_RDA);
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
void list_help(void)
  {
  COM1_send_str("\r\n");
  COM1_send_str("$F <frequency><cr>  \tSet frequency in 1MHz increments (i.e.2250 is 2.250GHz)\r\n");
  COM1_send_str("$ON <onoff><cr>  \tSet full operation on(1) or off(0)\r\n");
  COM1_send_str("$PS <power><cr>  \tSet amp power on(1) or off(0)\r\n");
  COM1_send_str("$P <level><cr>  \tSet power level high(1) or low(0)\r\n");
  COM1_send_str("$LD <fwd><cr>  \tSet Fwd power measurement on(1) or off(0)\r\n");
  COM1_send_str("$Q<cr>  \tRequest status\r\n");
  COM1_send_str("\r\n");
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
  switch (toupper(get_char()))
    {
    case 'H': case '?':
      list_help();
      return 0;
    case 'F':
      freq = get_frequency();
      if ((freq >= FRQ_LO_BOT && freq <= FRQ_LO_TOP) ||
          (freq >= FRQ_HI_BOT && freq <= FRQ_HI_TOP))
         && ((freq >= 5.725 && freq <= 5.825)))
         {
        PLL1_compute_freq_parameters(freq * 10);
        PLL1_update();
        }
      break;
    case 'O':
      if (toupper(get_char()) == 'N')
        {
        idx = get_int();
        if (idx < 2)
          {
          if (idx)
            {
            output_high(POWER_EN);
            }
          else
            {
            output_low(POWER_EN);
            }
          }
        }
      break;
    case 'P':
      if (toupper(peek_char()) == 'S') // $PS command
        {
        get_char(); // get rid of 'S'
        idx = get_int();
        if (idx < 2)
          if (idx)
            pwr_command = 1;
          else
            pwr_command = 0;
        }
      else // $P command
        set_power_level();
      break;
    case 'L':
      if (toupper(get_char()) == 'D')
        {
        idx = get_int();
        if (idx < 2)
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
        }
      break;
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
          break;
        case 'P': // positive voltage
          if (addr < 2)
            {
            setup.power_in[addr] = value;
            }
          break;
        case 'V': // save parameters
          allow_write = 2975;
          write_setup();
          update_all();
          break;
        }
      break;
    case '1': // year
      setup.year = get_int();
      break;
    case '2': // week
      setup.week = get_int();
      break;
    case '3': // unit ID
      setup.unit_ID = get_int();
      break;
    default:
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
        if ((chr = COM1_get_chr()) == '$')
          {
          comm_state++;
          comm_timeout = 0;
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
            COM1_send_str("\r\nOK\r\n*");
          COM1_init();
          }
        else if (chr == 27)
          {
          COM1_send_str("\r\n\nBREAK\r\n");
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

