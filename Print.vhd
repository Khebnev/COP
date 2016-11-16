library IEEE;
use IEEE.std_logic_1164.all;

entity Print is
	generic 
	(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 12
	);
	port (  clk: in std_logic;
			clk_enab: in std_logic;
			reset: in std_logic;
			raddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
			q: out std_logic_vector((DATA_WIDTH -1) downto 0)
		);
end Print;
architecture pin of Print is
begin
        
end pin;