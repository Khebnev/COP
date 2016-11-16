library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Decoder is
       port (
					enab	  : in bit;
					Row     : in std_logic_vector(4 downto 0);
               Rows    : out std_logic_vector(31 downto 0)
            );
end Decoder;

architecture RTL of Decoder is

	FUNCTION select_row (data : in std_logic_vector(4 downto 0)) RETURN std_logic_vector IS
		variable Result : std_logic_vector(31 downto 0);
	BEGIN
		for i in 0 to 31 loop
			if ( To_Integer(unsigned(data)) = i ) then 
				Result(i):= '1';
			else 
				Result(i):= '0';
			return Result;
			end if;
		end loop;
	END select_row;

begin
   Rows<= select_row(row);
end RTL;