
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity LCD_GAN_DULIEU_1SO_TO is
    Port ( LCD_MA_DONVI,LCD_MA_CHUC,CH,DV  : in  STD_LOGIC_VECTOR (47 downto 0);
           LCD_HANG_1 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_2 : out  STD_LOGIC_VECTOR (159 downto 0);
			  LCD_HANG_3 : out  STD_LOGIC_VECTOR (159 downto 0);
			  ODD,SEL        : in std_logic;
           LCD_HANG_4 : out  STD_LOGIC_VECTOR (159 downto 0));
end LCD_GAN_DULIEU_1SO_TO;

architecture Behavioral of LCD_GAN_DULIEU_1SO_TO is

begin
	-- HANG1
	LCD_HANG_1(7 DOWNTO 0) 		<= LCD_MA_CHUC (47 DOWNTO 40) when ODD = '1' ELSE CH(47 DOWNTO 40);
	LCD_HANG_1(15 DOWNTO 8) 	<= LCD_MA_CHUC (39 DOWNTO 32) WHEN ODD = '1' ELSE CH(39 DOWNTO 32);
	LCD_HANG_1(23 DOWNTO 16) 	<= LCD_MA_CHUC (31 DOWNTO 24) when ODD = '1' ELSE CH(31 DOWNTO 24);
	LCD_HANG_1(31 DOWNTO 24) 	<= LCD_MA_DONVI(47 DOWNTO 40) WHEN ODD = '1' ELSE DV (47 DOWNTO 40);
	LCD_HANG_1(39 DOWNTO 32) 	<=  LCD_MA_DONVI(39 DOWNTO 32) WHEN ODD = '1' ELSE DV (39 DOWNTO 32);
	LCD_HANG_1(47 DOWNTO 40) 	<= LCD_MA_DONVI(31 DOWNTO 24) WHEN ODD = '1' ELSE DV (31 DOWNTO 24);
	LCD_HANG_1(55 DOWNTO 48) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(63 DOWNTO 56) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8) WHEN SEL = '0' ELSE X"20";
	LCD_HANG_1(71 DOWNTO 64) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8) WHEN SEL = '0' ELSE X"20";
	LCD_HANG_1(79 DOWNTO 72) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8) WHEN SEL = '0' ELSE X"31";
	LCD_HANG_1(87 DOWNTO 80) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8) WHEN SEL = '0' ELSE X"35";
	LCD_HANG_1(95 DOWNTO 88)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE X"31";
	LCD_HANG_1(103 DOWNTO 96)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('Q'),8) WHEN SEL = '0' ELSE X"34";
	
	LCD_HANG_1(111 DOWNTO 104) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('U'),8) WHEN SEL = '0' ELSE X"31";
	LCD_HANG_1(119 DOWNTO 112) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8) WHEN SEL = '0' ELSE X"31";
	LCD_HANG_1(127 DOWNTO 120) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('C'),8) WHEN SEL = '0' ELSE X"30";
	LCD_HANG_1(135 DOWNTO 128) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE X"31";
	
	LCD_HANG_1(143 DOWNTO 136) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('B'),8) WHEN SEL = '0' ELSE X"20";
	LCD_HANG_1(151 DOWNTO 144) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8) WHEN SEL = '0' ELSE X"20";
	LCD_HANG_1(159 DOWNTO 152) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8) WHEN SEL = '0' ELSE X"20";
	-- HANG2
	LCD_HANG_2(7 DOWNTO 0) 		<= LCD_MA_CHUC (23 DOWNTO 16) when ODD = '1' ELSE CH(23 DOWNTO 16);	
	LCD_HANG_2(15 DOWNTO 8) 	<= LCD_MA_CHUC (15 DOWNTO 8) when ODD = '1' ELSE CH (15 DOWNTO 8);
	LCD_HANG_2(23 DOWNTO 16) 	<= LCD_MA_CHUC (7 DOWNTO 0) when ODD = '1' ELSE  CH(7 DOWNTO 0);
	LCD_HANG_2(31 DOWNTO 24) 	<= LCD_MA_DONVI(23 DOWNTO 16) when ODD = '1' ELSE DV(23 DOWNTO 16);	
	LCD_HANG_2(39 DOWNTO 32) 	<= LCD_MA_DONVI (15 DOWNTO 8) when ODD = '1' ELSE DV (15 DOWNTO 8);
	LCD_HANG_2(47 DOWNTO 40) 	<= LCD_MA_DONVI (7 DOWNTO 0) when ODD = '1' ELSE DV (7 DOWNTO 0);
	LCD_HANG_2(55 DOWNTO 48) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(63 DOWNTO 56) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8);
	LCD_HANG_2(71 DOWNTO 64) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	LCD_HANG_2(79 DOWNTO 72) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('5'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	
	LCD_HANG_2(87 DOWNTO 80) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8);
	LCD_HANG_2(95 DOWNTO 88) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('4'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(103 DOWNTO 96) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('Q'),8);
	
	LCD_HANG_2(111 DOWNTO 104) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('U'),8);
	LCD_HANG_2(119 DOWNTO 112) <=CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	LCD_HANG_2(127 DOWNTO 120) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('C'),8);

	LCD_HANG_2(135 DOWNTO 128) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(143 DOWNTO 136) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('B'),8);
	LCD_HANG_2(151 DOWNTO 144) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	LCD_HANG_2(159 DOWNTO 152) <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8) WHEN SEL = '0' ELSE CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	
	
	-- HANG3
	LCD_HANG_3( 7 DOWNTO 0) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 0 -----
	LCD_HANG_3( 15 DOWNTO 8) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 1 -----
	LCD_HANG_3( 23 DOWNTO 16) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 2 -----
	LCD_HANG_3( 31 DOWNTO 24) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 3 -----
	LCD_HANG_3( 39 DOWNTO 32) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 4 -----
	LCD_HANG_3( 47 DOWNTO 40) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 5 -----
	LCD_HANG_3( 55 DOWNTO 48) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 6 -----
	LCD_HANG_3( 63 DOWNTO 56) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 7 -----
	LCD_HANG_3( 71 DOWNTO 64) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 8 -----
	LCD_HANG_3( 79 DOWNTO 72) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 9 -----
	LCD_HANG_3( 87 DOWNTO 80) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 10 -----
	LCD_HANG_3( 95 DOWNTO 88) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 11 -----
	LCD_HANG_3( 103 DOWNTO 96)	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 12 -----
	LCD_HANG_3( 111 DOWNTO 104) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 13 -----
	LCD_HANG_3( 119 DOWNTO 112) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 14 -----
	LCD_HANG_3( 127 DOWNTO 120) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 15 -----
	LCD_HANG_3( 135 DOWNTO 128) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 16 -----
	LCD_HANG_3( 143 DOWNTO 136) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 17 -----
	LCD_HANG_3( 151 DOWNTO 144) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 18 -----
	LCD_HANG_3( 159 DOWNTO 152) <= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);	
	
	LCD_HANG_4(7 DOWNTO 0) 		<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 0 -----
	LCD_HANG_4(15 DOWNTO 8) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 1 -----
	LCD_HANG_4(23 DOWNTO 16) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 2 -----
	LCD_HANG_4(31 DOWNTO 24) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 3 -----
	LCD_HANG_4(39 DOWNTO 32) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 4 -----
	LCD_HANG_4(47 DOWNTO 40) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 5 -----
	LCD_HANG_4(55 DOWNTO 48) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 6 -----
	LCD_HANG_4(63 DOWNTO 56) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 7 -----
	LCD_HANG_4(71 DOWNTO 64) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 8 -----
	LCD_HANG_4(79 DOWNTO 72) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 9 -----
	LCD_HANG_4(87 DOWNTO 80) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 10 -----
	LCD_HANG_4(95 DOWNTO 88) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 11 -----
	LCD_HANG_4(103 DOWNTO 96)	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 12 -----
	LCD_HANG_4(111 DOWNTO 104) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 13 -----
	LCD_HANG_4(119 DOWNTO 112) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 14 -----
	LCD_HANG_4(127 DOWNTO 120) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 15 -----
	LCD_HANG_4(135 DOWNTO 128) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 16 -----
	LCD_HANG_4(143 DOWNTO 136) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 17 -----
	LCD_HANG_4(151 DOWNTO 144) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);  ---- 18 -----
	LCD_HANG_4(159 DOWNTO 152) 	<= CONV_STD_LOGIC_VECTOR  (CHARACTER'POS(' '),8);
		
end Behavioral;


