library IEEE;
use IEEE.std_logic_1164.all;


entity Counter is
       port (
				main_clk, res, enab : in bit; -- вход временной синхронизации, ас. сброс, разрешение.
				counter_out : out integer range 0 to 4
            );
end Counter;
architecture sch of Counter is
begin
        
end sch;