library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Keyboard is
       port (  clk: in std_logic;
					reset: in std_logic;
					ps_clk: in std_logic;
					busy: in boolean; 							 -- признак занятости контроллера
					DIN: in std_logic;
					KeyboardSignal: in std_logic;
					KeyboardClk: in std_logic;
					DOUT: out std_logic_vector (7 downto 0);
					Ready: out std_logic
            );
end Keyboard;
architecture reader of Keyboard is
begin
        
end reader;