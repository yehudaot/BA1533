	component uart_mcu is
		port (
			from_uart_ready : in  std_logic                    := 'X';             -- ready
			from_uart_data  : out std_logic_vector(7 downto 0);                    -- data
			from_uart_error : out std_logic;                                       -- error
			from_uart_valid : out std_logic;                                       -- valid
			to_uart_data    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			to_uart_error   : in  std_logic                    := 'X';             -- error
			to_uart_valid   : in  std_logic                    := 'X';             -- valid
			to_uart_ready   : out std_logic;                                       -- ready
			clk             : in  std_logic                    := 'X';             -- clk
			UART_RXD        : in  std_logic                    := 'X';             -- RXD
			UART_TXD        : out std_logic;                                       -- TXD
			reset           : in  std_logic                    := 'X'              -- reset
		);
	end component uart_mcu;

	u0 : component uart_mcu
		port map (
			from_uart_ready => CONNECTED_TO_from_uart_ready, -- avalon_data_receive_source.ready
			from_uart_data  => CONNECTED_TO_from_uart_data,  --                           .data
			from_uart_error => CONNECTED_TO_from_uart_error, --                           .error
			from_uart_valid => CONNECTED_TO_from_uart_valid, --                           .valid
			to_uart_data    => CONNECTED_TO_to_uart_data,    --  avalon_data_transmit_sink.data
			to_uart_error   => CONNECTED_TO_to_uart_error,   --                           .error
			to_uart_valid   => CONNECTED_TO_to_uart_valid,   --                           .valid
			to_uart_ready   => CONNECTED_TO_to_uart_ready,   --                           .ready
			clk             => CONNECTED_TO_clk,             --                        clk.clk
			UART_RXD        => CONNECTED_TO_UART_RXD,        --         external_interface.RXD
			UART_TXD        => CONNECTED_TO_UART_TXD,        --                           .TXD
			reset           => CONNECTED_TO_reset            --                      reset.reset
		);

