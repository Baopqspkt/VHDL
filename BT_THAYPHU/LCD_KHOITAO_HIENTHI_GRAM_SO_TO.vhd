
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity LCD_KHOITAO_HIENTHI_CGRAM_SO_TO is
	Port ( LCD_CK,ENA : in  STD_LOGIC;
           LCD_RST : in  STD_LOGIC;
           LCD_HANG_1 : in  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_2 : in  STD_LOGIC_VECTOR (159 downto 0);
			  LCD_HANG_3 : in  STD_LOGIC_VECTOR (159 downto 0);
           LCD_HANG_4 : in  STD_LOGIC_VECTOR (159 downto 0);
           LCD_RS : out  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end LCD_KHOITAO_HIENTHI_CGRAM_SO_TO;

architecture Behavioral of LCD_KHOITAO_HIENTHI_CGRAM_SO_TO is
	TYPE LCD_MACHINE IS (
			LCD_INIT,
			LCD_CGRAM_ADDR,
			LCD_CGRAM_DATA,
			LCD_CGRAM_DATA1,
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
CONSTANT LCD_CMD : LCD_CMD_TB:= (
				0 => X"00",
				1 => X"3C",
				2 => X"0C",
				3 => X"01",
				4 => X"02",
				5 => X"06");
				
TYPE LCD_CGRAM_TB IS ARRAY (INTEGER RANGE 0 TO 63) OF STD_LOGIC_VECTOR(7 DOWNTO 0); --1HINH TO 7, 2 HINH TO 7+8, 3 HINH TO 7+8+8
CONSTANT LCD_CGRAM : LCD_CGRAM_TB:=(
						X"07",X"0F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",--DOAN F - 0
						X"1F",X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",--DOAN A - 1
						X"1C",X"1E",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",--DOAN B - 2
						X"00",X"00",X"00",X"00",X"00",X"1F",X"1F",X"1F",--DOAN D - 3
						X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1E",X"1C",--DOAN C - 4
						X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"0F",X"07",--DOAN E - 5
						X"1F",X"1F",X"1F",X"00",X"00",X"00",X"1F",X"1F",--DOAN G+D 6
						X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F"--DOAN I - 7
						);
						
TYPE LCD_CGRAM1_TB IS ARRAY (INTEGER RANGE 0 TO 7) OF STD_LOGIC_VECTOR(7 DOWNTO 0); --1HINH TO 7, 2 HINH TO 7+8, 3 HINH TO 7+8+8
CONSTANT LCD_CGRAM1 : LCD_CGRAM1_TB:=(
						X"0E",X"11",X"11",X"11",X"0E",X"00",X"00",X"00");
SIGNAL CGRAM_PTR : INTEGER RANGE 0 TO LCD_CGRAM'HIGH:=0;


TYPE LCD_DIS_L1 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE LCD_DIS_L2 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE LCD_DIS_L3 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE LCD_DIS_L4 IS ARRAY(INTEGER RANGE 0 TO 19) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL LCD_DIS1 : LCD_DIS_L1;
SIGNAL LCD_DIS2 : LCD_DIS_L2;
SIGNAL LCD_DIS3 : LCD_DIS_L3;
SIGNAL LCD_DIS4 : LCD_DIS_L4;

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
	
	PROCESS( LCD_CK, SLX, LCD_RST,ENA)
	BEGIN
		IF LCD_RST = '1' THEN 	LCD_STATE <= LCD_INIT;
										SLX <= 0;
										CGRAM_PTR <= 0;
		ELSIF FALLING_EDGE(LCD_CK) THEN
			CASE LCD_STATE IS
			
			WHEN LCD_INIT =>				LCD_RS <= '0';
												SLX <= SLX + 1;
					IF SLX = 164000 THEN SLX <= 0;
						IF CGRAM_PTR = LCD_CGRAM'HIGH THEN 	LCD_STATE <= LCD_CGRAM_ADDR;
						ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
						END IF;
					ELSIF SLX = 30 THEN 	LCD_E <= '0';
					ELSIF SLX = 5 THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= LCD_CMD(CGRAM_PTR);
					END IF;
------------------------------------------------------------------------------------------
		WHEN LCD_CGRAM_ADDR =>		LCD_RS <= '0';
												SLX <= SLX + 1;
					IF SLX = 5000 THEN 	SLX <= 0;
												IF (ENA='1') THEN
													LCD_STATE <= LCD_CGRAM_DATA;
												ELSE 
													LCD_STATE <= LCD_CGRAM_DATA1;
												END IF;
												CGRAM_PTR <= 0;
					ELSIF SLX = 30 THEN	LCD_E <= '0';
					ELSIF SLX = 5	THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= X"40";
					END IF;
----------------------------------------------------------------------------------------------------
		WHEN LCD_CGRAM_DATA =>		LCD_RS <= '1';
													SLX <= SLX +1;
						IF SLX = 5000 THEN	SLX <= 0;
							IF (CGRAM_PTR = 63) THEN 	LCD_STATE <= LCD_ADDR_L1; -- SUA THEO SO LUONG MA
							ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
							END IF;
						ELSIF SLX = 30 THEN 	LCD_E <= '0';
						ELSIF SLX = 5 THEN 	LCD_E <= '1';
						ELSE						LCD_DB <= LCD_CGRAM(CGRAM_PTR);
						END IF;
		WHEN LCD_CGRAM_DATA1 =>		LCD_RS <= '1';
													SLX <= SLX +1;
						IF SLX = 5000 THEN	SLX <= 0;
							IF (CGRAM_PTR = 7) THEN 	LCD_STATE <= LCD_ADDR_L1; -- SUA THEO SO LUONG MA
							ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
							END IF;
						ELSIF SLX = 30 THEN 	LCD_E <= '0';
						ELSIF SLX = 5 THEN 	LCD_E <= '1';
						ELSE						LCD_DB <= LCD_CGRAM1(CGRAM_PTR);
						END IF;
-----------------------------------------------------------------------------------------------
		WHEN LCD_ADDR_L1 =>			LCD_RS <= '0';
												SLX <= SLX + 1;
					IF SLX = 5000 THEN 	SLX <= 0;
												LCD_STATE <= LCD_DATA_L1;
												CGRAM_PTR <= 0;
					ELSIF SLX = 30 THEN	LCD_E <= '0';
					ELSIF SLX = 5	THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= X"80";
					END IF;
--------------------------------------------------------------------------------------------------------				
			WHEN LCD_DATA_L1 =>			LCD_RS <= '1';
												SLX <= SLX +1;
					IF SLX = 5000 THEN	SLX <= 0;
						IF CGRAM_PTR = 19 THEN 	LCD_STATE <= LCD_ADDR_L2;
						ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
						END IF;
					ELSIF SLX = 30 THEN 	LCD_E <= '0';
					ELSIF SLX = 5 THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= LCD_DIS1(CGRAM_PTR);
					END IF;
			---------------------------------------------------------------------------------------------------
			WHEN LCD_ADDR_L2 =>			LCD_RS <= '0';
												SLX <= SLX + 1;
					IF SLX = 5000 THEN 	SLX <= 0;
												LCD_STATE <= LCD_DATA_L2;
												CGRAM_PTR <= 0;
					ELSIF SLX = 30 THEN	LCD_E <= '0';
					ELSIF SLX = 5	THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= X"C0";
					END IF;
			-------------------------------------------------------------------------------
			WHEN LCD_DATA_L2 =>			LCD_RS <= '1';
												SLX <= SLX +1;
					IF SLX = 5000 THEN	SLX <= 0;
						IF CGRAM_PTR = 19 THEN 	LCD_STATE <= LCD_ADDR_L3;
						ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
						END IF;
					ELSIF SLX = 30 THEN 	LCD_E <= '0';
					ELSIF SLX = 5 THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= LCD_DIS2(CGRAM_PTR);
					END IF;
			WHEN LCD_ADDR_L3 =>			LCD_RS <= '0';
												SLX <= SLX + 1;
					IF SLX = 5000 THEN 	SLX <= 0;
												LCD_STATE <= LCD_DATA_L3;
												CGRAM_PTR <= 0;
					ELSIF SLX = 30 THEN	LCD_E <= '0';
					ELSIF SLX = 5	THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= X"94";
					END IF;
			-------------------------------------------------------------------------------
			WHEN LCD_DATA_L3 =>			LCD_RS <= '1';
												SLX <= SLX +1;
					IF SLX = 5000 THEN	SLX <= 0;
						IF CGRAM_PTR = 19 THEN 	LCD_STATE <= LCD_ADDR_L4;
						ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
						END IF;
					ELSIF SLX = 30 THEN 	LCD_E <= '0';
					ELSIF SLX = 5 THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= LCD_DIS3(CGRAM_PTR);
					END IF;
			------------------------------------------
			WHEN LCD_ADDR_L4 =>			LCD_RS <= '0';
												SLX <= SLX + 1;
					IF SLX = 5000 THEN 	SLX <= 0;
												LCD_STATE <= LCD_DATA_L4;
												CGRAM_PTR <= 0;
					ELSIF SLX = 30 THEN	LCD_E <= '0';
					ELSIF SLX = 5	THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= X"D4";
					END IF;
			-------------------------------------------------------------------------------
			WHEN LCD_DATA_L4 =>			LCD_RS <= '1';
												SLX <= SLX +1;
					IF SLX = 5000 THEN	SLX <= 0;
						IF CGRAM_PTR = 19 THEN 	LCD_STATE <= LCD_STOP;
						ELSE					CGRAM_PTR <= CGRAM_PTR + 1;
						END IF;
					ELSIF SLX = 30 THEN 	LCD_E <= '0';
					ELSIF SLX = 5 THEN 	LCD_E <= '1';
					ELSE						LCD_DB <= LCD_DIS4(CGRAM_PTR);
					END IF;
			WHEN LCD_STOP => 				SLX <= SLX + 1;
					IF SLX = 1000000 THEN 	SLX <= 0;
													LCD_STATE <= LCD_CGRAM_ADDR;
					END IF;
			END CASE;
		END IF;
	END PROCESS;
end Behavioral;

