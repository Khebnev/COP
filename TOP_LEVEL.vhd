library IEEE;
use IEEE.std_logic_1164.all;
--------------------------------------------------------------------------------
entity TOP_LEVEL is
	port(
		buttons				: in std_logic_vector (0 to 1);
		clk               : in  std_logic;
		clk_enab_keyboard : in  std_logic;
		clk_enab_PS2      : in  std_logic;
		led               : out std_logic
	);
end TOP_LEVEL;
--------------------------------------------------------------------------------
architecture communication of TOP_LEVEL is
	component ControlBlock is
		port(clk_enab : out std_logic;
			 clk      : out std_logic;
			 reset    : out std_logic
		);
	end component;
	----------------
	component Keyboard is
		port(clk            : in  std_logic;
			 reset          : in  std_logic;
			 ps_clk         : in  std_logic;
			 busy           : in  boolean;
			 DIN            : in  std_logic;
			 KeyboardSignal : in  std_logic;
			 KeyboardClk    : in  std_logic;
			 DOUT           : out std_logic_vector(7 downto 0);
			 Ready          : out std_logic
		);
	end component;
	----------------
	component Div is               
		port(
			clk      : in  std_logic;
			reset    : in  std_logic;
			clk_enab : in  std_logic;
			Q        : out std_logic);
	end component;
	----------------
	component Print is
		generic(
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 12
		);
		port(clk      : in  std_logic;
			 clk_enab : in  std_logic;
			 reset    : in  std_logic;
			 raddr    : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			 q        : out std_logic_vector((DATA_WIDTH - 1) downto 0)
		);
	end component;
	----------------
	component Buffer_1 is
		generic(
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 12
		);

		port(
			rclk  : in  std_logic;
			wclk  : in  std_logic;
			raddr : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			waddr : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			data  : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
			we    : in  std_logic := '1';
			q     : out std_logic_vector((DATA_WIDTH - 1) downto 0)
		);

	end component;
	----------------
	component Buffer_2 is
		generic(
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 6
		);

		port(
			clk    : in  std_logic;
			addr_a : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			addr_b : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			q_a    : out std_logic_vector((DATA_WIDTH - 1) downto 0);
			q_b    : out std_logic_vector((DATA_WIDTH - 1) downto 0)
		);

	end component;
	----------------
	component Buffer_3 is
		generic(
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 15
		);

		port(
			rclk  : in  std_logic;
			wclk  : in  std_logic;
			raddr : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			waddr : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			data  : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
			we    : in  std_logic := '1';
			q     : out std_logic_vector((DATA_WIDTH - 1) downto 0)
		);

	end component;
	----------------
	component Buffer_4 is
		generic(
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 5
		);

		port(
			rclk  : in  std_logic;
			wclk  : in  std_logic;
			raddr : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			waddr : in  natural range 0 to 2 ** ADDR_WIDTH - 1;
			data  : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
			we    : in  std_logic := '1';
			q     : out std_logic_vector((DATA_WIDTH - 1) downto 0)
		);

	end component;
	----------------
	component Decoder is
		port(
			enab : in  bit;
			Row  : in  std_logic_vector(4 downto 0);
			Rows : out std_logic_vector(31 downto 0)
		);
	end component;

	component Counter is
		port(
			main_clk, res, enab : in  bit;
			counter_out         : out integer range 0 to 4
		);
	end component;

begin -------------------------------------------------------------------------
	RGB : ControlBlock port map(
			clk_enab => clk,
			clk      => clk_enab_keyboard,
			ps_clk   => clk_enab_PS2,
			led      => enab
		);

end communication;
--------------------------------------------------------------------------------