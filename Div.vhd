library IEEE;                            			-- декларация библитек IEEE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Div is		 										-- описание внешних подключений компонента
       port (   
					clk: in std_logic;
					reset: in std_logic;
					clk_enab: in std_logic;
					Q: out std_logic
            );
end Div;
architecture frequency of Div is
	signal st : std_logic_vector(6 downto 0);		-- декларация сигнала st как 7-ми проводной шины	
begin
	process(CLK)                                 -- в списке чувствительности находится сигнал на порте CLK	
		begin
			if CLK 'event and CLK = '1' then       -- если на входе CLK появился положительный фронт сигнала (перепад из нуля в единицу), то
				if conv_integer(st) = 124 then      -- если десятичное значение сигнала st равно 124, то тогда
					st <= conv_std_logic_vector(0,7);-- нужно присвоить сигналу st десятичное значение 0, преобразованное в двоичный вид и выраженное семью разрядами (т.е. семь нулей, что соответствует количеству линий в шине st)
					else st <= st + 1;               -- иначе (т.е если десятичное значение сигнала st ещё не равно 124) сигналу st нужно присвоить значение st + 1 (т.е. счетчик должен продолжать счет)
				end if;                             
			end if;                                
		end process;

Q <= '1' when conv_integer(st) = 124 else '0';  -- присвоение сигналу порту Q значения ‘1’ либо ‘0’	
end frequency;