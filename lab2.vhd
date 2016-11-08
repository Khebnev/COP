LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------
ENTITY Ticker IS
	PORT (
		in_data	: IN STD_LOGIC_VECTOR (7 downto 0);
		out_data	: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END ENTITY Ticker;
--------------------------------
ARCHITECTURE ab OF Ticker IS

--	FUNCTION TickerConverter(data : in STD_LOGIC_VECTOR(7 to 0)) RETURN STD_LOGIC_VECTOR IS
--		case data is
--			when "00000000" =>
--			when "00000000" =>
--			when "00000000" =>
--			when "00000000" =>
--			when "00000000" =>
--		end case;
--	BEGIN
--	END FUNCTION;
BEGIN
	
END ARCHITECTURE;
