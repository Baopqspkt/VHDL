library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LCD_GAN_DULIEU_HIENTHI is
    Port ( LCD_HANG_1 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_2 : out  STD_LOGIC_VECTOR (159 downto 0);
			  LCD_HANG_3 : out  STD_LOGIC_VECTOR (159 downto 0);
			  ENA2HZ,RST,CKHT : IN STD_LOGIC;
			  LCD_HANG_4 : out  STD_LOGIC_VECTOR (159 downto 0)
			  );
end LCD_GAN_DULIEU_HIENTHI;

architecture Behavioral of LCD_GAN_DULIEU_HIENTHI is
SIGNAL I_REG,I_NEXT: INTEGER RANGE 0 TO 41;
TYPE LCD_MSSV_MANG IS ARRAY(INTEGER RANGE 0 TO 39) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT HIEN_THI: LCD_MSSV_MANG:= ( 
X"31", --0
X"35",
X"31",
X"34",
X"31",
X"32",
X"38",
X"34",  --7
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8),--8
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8), 
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8), 
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8), 
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8),
CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8)); -- 22

begin
	--HANG 1
	LCD_HANG_1(7 DOWNTO 0) 			<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(15 DOWNTO 8) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(23 DOWNTO 16) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(31 DOWNTO 24) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(39 DOWNTO 32) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(47 DOWNTO 40) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(55 DOWNTO 48) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(63 DOWNTO 56) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(71 DOWNTO 64) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(79 DOWNTO 72) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(87 DOWNTO 80) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(95 DOWNTO 88) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(103 DOWNTO 96) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(111 DOWNTO 104) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(119 DOWNTO 112) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(127 DOWNTO 120) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(135 DOWNTO 128) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(143 DOWNTO 136) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(151 DOWNTO 144) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_1(159 DOWNTO 152) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	--HANG 2
	LCD_HANG_2(7 DOWNTO 0) 			<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(15 DOWNTO 8) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(23 DOWNTO 16) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(31 DOWNTO 24) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(39 DOWNTO 32) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(47 DOWNTO 40) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(55 DOWNTO 48) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(63 DOWNTO 56) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(71 DOWNTO 64) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(79 DOWNTO 72) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(87 DOWNTO 80) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(95 DOWNTO 88) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(103 DOWNTO 96) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(111 DOWNTO 104) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(119 DOWNTO 112) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(127 DOWNTO 120) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(135 DOWNTO 128) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(143 DOWNTO 136) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(151 DOWNTO 144) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_2(159 DOWNTO 152) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	---hang3
	LCD_HANG_3(7 DOWNTO 0) 			<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(15 DOWNTO 8) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(23 DOWNTO 16) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(31 DOWNTO 24) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(39 DOWNTO 32) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(47 DOWNTO 40) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(55 DOWNTO 48) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(63 DOWNTO 56) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(71 DOWNTO 64) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(79 DOWNTO 72) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(87 DOWNTO 80) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(95 DOWNTO 88) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(103 DOWNTO 96) 		<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(111 DOWNTO 104) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(119 DOWNTO 112) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(127 DOWNTO 120) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(135 DOWNTO 128) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(143 DOWNTO 136) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(151 DOWNTO 144) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	LCD_HANG_3(159 DOWNTO 152) 	<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	--hang4
	LCD_HANG_4(7 DOWNTO 0) 			<= x"20" WHEN I_REG < 20 ELSE HIEN_THI(I_REG - 20);
	LCD_HANG_4(15 DOWNTO 8) 		<= x"20" WHEN I_REG < 19 ELSE HIEN_THI(I_REG - 19);
	LCD_HANG_4(23 DOWNTO 16) 		<= x"20" WHEN I_REG < 18 ELSE HIEN_THI(I_REG - 18);
	LCD_HANG_4(31 DOWNTO 24) 		<= x"20" WHEN I_REG < 17 ELSE HIEN_THI(I_REG - 17);
	LCD_HANG_4(39 DOWNTO 32) 		<= x"20" WHEN I_REG < 16 ELSE HIEN_THI(I_REG - 16);
	LCD_HANG_4(47 DOWNTO 40) 		<= x"20" WHEN I_REG < 15 ELSE HIEN_THI(I_REG - 15);
	LCD_HANG_4(55 DOWNTO 48) 		<= x"20" WHEN I_REG < 14 ELSE HIEN_THI(I_REG - 14);
	LCD_HANG_4(63 DOWNTO 56) 		<= x"20" WHEN I_REG < 13 ELSE HIEN_THI(I_REG - 13);
	LCD_HANG_4(71 DOWNTO 64) 		<= x"20" WHEN I_REG < 10 ELSE HIEN_THI(I_REG - 12);
	LCD_HANG_4(79 DOWNTO 72) 		<= x"20" WHEN I_REG < 11 ELSE HIEN_THI(I_REG - 11);
	LCD_HANG_4(87 DOWNTO 80) 		<= x"20" WHEN I_REG < 10 ELSE HIEN_THI(I_REG - 10);
	LCD_HANG_4(95 DOWNTO 88) 		<= x"20" WHEN I_REG < 9 ELSE HIEN_THI(I_REG - 9);
	LCD_HANG_4(103 DOWNTO 96) 		<= x"20" WHEN I_REG < 8 ELSE HIEN_THI(I_REG - 8);
	LCD_HANG_4(111 DOWNTO 104) 	<= x"20" WHEN I_REG < 7 ELSE HIEN_THI(I_REG - 7);
	LCD_HANG_4(119 DOWNTO 112) 	<= x"20" WHEN I_REG < 6 ELSE HIEN_THI(I_REG - 6);
	LCD_HANG_4(127 DOWNTO 120) 	<= x"20" WHEN I_REG < 5 ELSE HIEN_THI(I_REG - 5);
	LCD_HANG_4(135 DOWNTO 128) 	<= x"20" WHEN I_REG < 4 ELSE HIEN_THI(I_REG - 4);
	LCD_HANG_4(143 DOWNTO 136) 	<= x"20" WHEN I_REG < 3 ELSE HIEN_THI(I_REG - 3);
	LCD_HANG_4(151 DOWNTO 144) 	<= x"20" WHEN I_REG < 2 ELSE HIEN_THI(I_REG - 2);
	LCD_HANG_4(159 DOWNTO 152) 	<= x"20" WHEN I_REG < 1 ELSE HIEN_THI(I_REG - 1);
	
	
	PROCESS(I_REG,CKHT,RST)
	BEGIN
		IF RST = '1' THEN  I_REG <=0;
		ELSIF FALLING_EDGE(CKHT) THEN I_REG <= I_NEXT;
		END IF;
	END PROCESS;
	
		I_NEXT <= 0 WHEN I_REG = 39 AND ENA2HZ = '1' ELSE
					I_REG + 1 WHEN ENA2HZ = '1' ELSE 					
					I_REG;
end Behavioral;


