library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity LCD_GIAI_MA_CHU_TO is
    Port ( SO_GIAI_MA : in  STD_LOGIC_VECTOR (3 downto 0);
           LCD_MA_TO : out  STD_LOGIC_VECTOR (47 downto 0));
end LCD_GIAI_MA_CHU_TO;

architecture Behavioral of LCD_GIAI_MA_CHU_TO is

TYPE LCD_MA7DOAN_TABLE IS ARRAY(INTEGER RANGE 0 TO 35) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

CONSTANT LCD_MA7DOAN:LCD_MA7DOAN_TABLE:= (
	X"00",X"01",X"02",X"07",X"01",X"07", --A
	X"07",X"20",X"20",X"07",X"06",X"07", --B
	X"00",X"01",X"01",X"05",X"03",X"03", --C
	X"07",X"01",X"07",X"07",X"03",X"07", --D
	X"07",X"06",X"01",X"07",X"03",X"03", --E
	X"07",X"06",X"06",X"07",X"20",X"20"  --F
);

begin
	PROCESS(SO_GIAI_MA)
	BEGIN
		IF (SO_GIAI_MA = X"A") THEN 
			LCD_MA_TO(47 DOWNTO 40) <= LCD_MA7DOAN(0);
			LCD_MA_TO(39 DOWNTO 32) <= LCD_MA7DOAN(1);
			LCD_MA_TO(31 DOWNTO 24) <= LCD_MA7DOAN(2);
			LCD_MA_TO(23 DOWNTO 16) <= LCD_MA7DOAN(3);
			LCD_MA_TO(15 DOWNTO 8) 	<= LCD_MA7DOAN(4);
			LCD_MA_TO(7 DOWNTO 0) 	<= LCD_MA7DOAN(5);
		ELSIF (SO_GIAI_MA = X"B") THEN
			LCD_MA_TO(47 DOWNTO 40) <= LCD_MA7DOAN(6);
			LCD_MA_TO(39 DOWNTO 32) <= LCD_MA7DOAN(7);
			LCD_MA_TO(31 DOWNTO 24) <= LCD_MA7DOAN(8);
			LCD_MA_TO(23 DOWNTO 16) <= LCD_MA7DOAN(9);
			LCD_MA_TO(15 DOWNTO 8) 	<= LCD_MA7DOAN(10);
			LCD_MA_TO(7 DOWNTO 0) 	<= LCD_MA7DOAN(11);
		ELSIF (SO_GIAI_MA = X"C") THEN
			LCD_MA_TO(47 DOWNTO 40) <= LCD_MA7DOAN(12);
			LCD_MA_TO(39 DOWNTO 32) <= LCD_MA7DOAN(13);
			LCD_MA_TO(31 DOWNTO 24) <= LCD_MA7DOAN(14);
			LCD_MA_TO(23 DOWNTO 16) <= LCD_MA7DOAN(15);
			LCD_MA_TO(15 DOWNTO 8) 	<= LCD_MA7DOAN(16);
			LCD_MA_TO(7 DOWNTO 0) 	<= LCD_MA7DOAN(17);
		ELSIF (SO_GIAI_MA = X"D") THEN
			LCD_MA_TO(47 DOWNTO 40) <= LCD_MA7DOAN(18);
			LCD_MA_TO(39 DOWNTO 32) <= LCD_MA7DOAN(19);
			LCD_MA_TO(31 DOWNTO 24) <= LCD_MA7DOAN(20);
			LCD_MA_TO(23 DOWNTO 16) <= LCD_MA7DOAN(21);
			LCD_MA_TO(15 DOWNTO 8) 	<= LCD_MA7DOAN(22);
			LCD_MA_TO(7 DOWNTO 0) 	<= LCD_MA7DOAN(23);
		ELSIF (SO_GIAI_MA = X"E") THEN
			LCD_MA_TO(47 DOWNTO 40) <= LCD_MA7DOAN(24);
			LCD_MA_TO(39 DOWNTO 32) <= LCD_MA7DOAN(25);
			LCD_MA_TO(31 DOWNTO 24) <= LCD_MA7DOAN(26);
			LCD_MA_TO(23 DOWNTO 16) <= LCD_MA7DOAN(27);
			LCD_MA_TO(15 DOWNTO 8) 	<= LCD_MA7DOAN(28);
			LCD_MA_TO(7 DOWNTO 0) 	<= LCD_MA7DOAN(29);
		ELSE 
			LCD_MA_TO(47 DOWNTO 40) <= LCD_MA7DOAN(30);
			LCD_MA_TO(39 DOWNTO 32) <= LCD_MA7DOAN(31);
			LCD_MA_TO(31 DOWNTO 24) <= LCD_MA7DOAN(32);
			LCD_MA_TO(23 DOWNTO 16) <= LCD_MA7DOAN(33);
			LCD_MA_TO(15 DOWNTO 8) 	<= LCD_MA7DOAN(34);
			LCD_MA_TO(7 DOWNTO 0) 	<= LCD_MA7DOAN(35);
		END IF;
	END PROCESS;

end Behavioral;


