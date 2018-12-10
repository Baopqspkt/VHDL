----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:33:57 11/24/2018 
-- Design Name: 
-- Module Name:    LCD_KHOITAO_HIENTHI - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity LCD_KHOITAO_HIENTHI is
    Port ( LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0);
           LCD_RS : out  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RST : in  STD_LOGIC;
           LCD_CK : in  STD_LOGIC;
           LCD_HANG_1 : in  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_2 : in  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_3 : in  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_4 : in  STD_LOGIC_VECTOR (159 downto 0));
end LCD_KHOITAO_HIENTHI;

architecture Behavioral of LCD_KHOITAO_HIENTHI is
TYPE LCD_MACHINE IS (	LCD_INIT,
								LCD_ADDR_L1,
								LCD_DATA_L1,
								LCD_ADDR_L2,
								LCD_DATA_L2,
								LCD_ADDR_L3,
								LCD_DATA_L3,
								LCD_ADDR_L4,
								LCD_DATA_L4,
								LCD_STOP);
								
SIGNAL LCD_STATE: LCD_MACHINE:= LCD_INIT;

TYPE LCD_CMD_TB IS ARRAY(INTEGER RANGE 0 TO 5) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT LCD_CMD : LCD_CMD_TB:= (	0 => X"00",
												1 => X"3C",
												2 => X"0C",
												3 => X"01",
												4 => X"02",
												5 => X"06");

TYPE LCD_DIS_L1 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE LCD_DIS_L2 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE LCD_DIS_L3 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE LCD_DIS_L4 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL LCD_DIS1 : LCD_DIS_L1;
SIGNAL LCD_DIS2 : LCD_DIS_L2;
SIGNAL LCD_DIS3 : LCD_DIS_L3;
SIGNAL LCD_DIS4 : LCD_DIS_L4;

SIGNAL PTR : INTEGER RANGE 0 TO 19:=0;
SIGNAL SLX : INTEGER RANGE 0 TO 1000000:=0;

begin
PROCESS(LCD_HANG_1, LCD_HANG_2,LCD_HANG_3,LCD_HANG_4)
BEGIN
	FOR I IN 0 TO 19
	LOOP
		LCD_DIS1 (I) <= LCD_HANG_1((I*8+7) DOWNTO I*8);
		LCD_DIS2 (I) <= LCD_HANG_2((I*8+7) DOWNTO I*8);
		LCD_DIS3 (I) <= LCD_HANG_3((I*8+7) DOWNTO I*8);
		LCD_DIS4 (I) <= LCD_HANG_4((I*8+7) DOWNTO I*8);
	END LOOP;
END PROCESS;
	
PROCESS( LCD_CK, SLX, LCD_RST)
BEGIN
	IF LCD_RST = '1' THEN 	LCD_STATE <= LCD_INIT;
											SLX <= 0;
											PTR <= 0;
	ELSIF FALLING_EDGE(LCD_CK) THEN
		CASE LCD_STATE IS
			
		WHEN LCD_INIT =>				LCD_RS <= '0';
											SLX <= SLX + 1;
			IF SLX = 164000 THEN SLX <= 0;
				IF PTR = 5 THEN 	LCD_STATE <= LCD_ADDR_L1;
				ELSE					PTR <= PTR + 1;
				END IF;
				
			ELSIF SLX = 30 THEN 	LCD_E <= '0';
			ELSIF SLX = 10 THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= LCD_CMD(PTR);
			END IF;
---------------------------------------------------------------------------------------				
		WHEN LCD_ADDR_L1 =>			LCD_RS <= '0';
												SLX <= SLX + 1;
			IF SLX = 5000 THEN 	SLX <= 0;
										LCD_STATE <= LCD_DATA_L1;
										PTR <= 0;
			ELSIF SLX = 30 THEN	LCD_E <= '0';
			ELSIF SLX = 10	THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= X"80";
			END IF;
------------------------------------------------------------------------------------------------------				
		WHEN LCD_DATA_L1 =>			LCD_RS <= '1';
											SLX <= SLX +1;
			IF SLX = 5000 THEN	SLX <= 0;
			 IF PTR = 19 THEN 	LCD_STATE <= LCD_ADDR_L2;
			 ELSE					PTR <= PTR + 1;
			 END IF;
			 
			ELSIF SLX = 30 THEN 	LCD_E <= '0';
			ELSIF SLX = 10 THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= LCD_DIS1(PTR);
			END IF;
-----------------------------------------------------------------------------------------------------
		WHEN LCD_ADDR_L2 =>			LCD_RS <= '0';
											SLX <= SLX + 1;
			IF SLX = 5000 THEN 	SLX <= 0;
										LCD_STATE <= LCD_DATA_L2;
										PTR <= 0;
			ELSIF SLX = 30 THEN	LCD_E <= '0';
			ELSIF SLX = 10	THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= X"C0";
			END IF;
-----------------------------------------------------------------------------------------------
		WHEN LCD_DATA_L2 =>			LCD_RS <= '1';
											SLX <= SLX +1;
			IF SLX = 5000 THEN	SLX <= 0;
				IF PTR = 19 THEN 	LCD_STATE <= LCD_ADDR_L3;
				ELSE					PTR <= PTR + 1;
				END IF;
				
			ELSIF SLX = 30 THEN 	LCD_E <= '0';
			ELSIF SLX = 10 THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= LCD_DIS2(PTR);
			END IF;
------------------------------------------------------------------------/////====3
		WHEN LCD_ADDR_L3 =>			LCD_RS <= '0';
											SLX <= SLX + 1;
			IF SLX = 5000 THEN 	SLX <= 0;
										LCD_STATE <= LCD_DATA_L3;
										PTR <= 0;
			ELSIF SLX = 30 THEN	LCD_E <= '0';
			ELSIF SLX = 10	THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= X"94";
			END IF;
---------------------------------------------------------------------------------------------------
		WHEN LCD_DATA_L3 =>			LCD_RS <= '1';
											SLX <= SLX +1;
			IF SLX = 5000 THEN	SLX <= 0;
				IF PTR = 19 THEN 	LCD_STATE <= LCD_ADDR_L4;
				ELSE					PTR <= PTR + 1;
				END IF;
			ELSIF SLX = 30 THEN 	LCD_E <= '0';
			ELSIF SLX = 10 THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= LCD_DIS3(PTR);
			END IF;
--------------------------------------------------------------------------------------
		WHEN LCD_ADDR_L4 =>			LCD_RS <= '0';
											SLX <= SLX + 1;
			IF SLX = 5000 THEN 	SLX <= 0;
										LCD_STATE <= LCD_DATA_L4;
										PTR <= 0;
			ELSIF SLX = 30 THEN	LCD_E <= '0';
			ELSIF SLX = 10	THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= X"D4";
			END IF;
-------------------------------------------------------------------------------------------
		WHEN LCD_DATA_L4 =>			LCD_RS <= '1';
											SLX <= SLX +1;
			IF SLX = 5000 THEN	SLX <= 0;
				IF PTR = 19 THEN 	LCD_STATE <= LCD_STOP;
				ELSE					PTR <= PTR + 1;
				END IF;
			ELSIF SLX = 30 THEN 	LCD_E <= '0';
			ELSIF SLX = 10 THEN 	LCD_E <= '1';
			ELSE						LCD_DB <= LCD_DIS4(PTR);
			END IF;
-------------------------------------------------------------------------------------------
		WHEN LCD_STOP => 				SLX <= SLX + 1;
			IF SLX = 1000000 THEN 	SLX <= 0;
											LCD_STATE <= LCD_ADDR_L1;
			END IF;
			END CASE;
		END IF;
	END PROCESS;			 
end Behavioral;

