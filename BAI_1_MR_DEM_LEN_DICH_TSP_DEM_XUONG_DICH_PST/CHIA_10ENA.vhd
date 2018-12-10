----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:40:42 20/09/2017
-- Design Name: 
-- Module Name:    CHIAXUNG_1HZ - Behavioral 
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

entity CHIA_10ENA is
    Port ( CKHT: in  STD_LOGIC;
--				ENA1HZ: out  STD_LOGIC
--				ENA2HZ: out  STD_LOGIC;
				ENA5HZ: out  STD_LOGIC
--				ENA10HZ : out  STD_LOGIC;
--				ENA20HZ: out  STD_LOGIC;
--				ENA25HZ: out  STD_LOGIC;
--				ENA50HZ: out  STD_LOGIC;				
--				ENA100HZ : out  STD_LOGIC;
--				ENA1KHZ : out  STD_LOGIC
--				ENA1MHZ : out  STD_LOGIC
				);
end CHIA_10ENA;

architecture Behavioral of CHIA_10ENA is
CONSTANT N: INTEGER := 50000000; 
SIGNAL	D1MHZ_REG, D1MHZ_NEXT: 	 INTEGER RANGE 0 TO N/1000000:=1;	
SIGNAL	D1KHZ_REG, D1KHZ_NEXT: 	 INTEGER RANGE 0 TO N/1000:=1;		
SIGNAL	D100HZ_REG, D100HZ_NEXT: INTEGER RANGE 0 TO N/100:=1;			
SIGNAL	D50HZ_REG, D50HZ_NEXT: 	 INTEGER RANGE 0 TO N/50:=1;			
SIGNAL	D25HZ_REG, D25HZ_NEXT: 	 INTEGER RANGE 0 TO N/25:=1;			
SIGNAL	D20HZ_REG, D20HZ_NEXT: 	 INTEGER RANGE 0 TO N/20:=1;			
SIGNAL	D10HZ_REG, D10HZ_NEXT: 	 INTEGER RANGE 0 TO N/10:=1;			
SIGNAL	D5HZ_REG, D5HZ_NEXT: 	 INTEGER RANGE 0 TO N/5:=1;			
SIGNAL	D2HZ_REG, D2HZ_NEXT: 	 INTEGER RANGE 0 TO N/2:=1;			
SIGNAL	D1HZ_REG, D1HZ_NEXT: 	 INTEGER RANGE 0 TO N/1:=1;			

Begin
--OUTPUT LOGIC
--	ENA1HZ	<=	'1' WHEN D1HZ_REG = N/(1*2)			ELSE	'0';
--	ENA2HZ	<=	'1' WHEN D2HZ_REG = N/(2*2)			ELSE	'0';
	ENA5HZ	<=	'1' WHEN D10HZ_REG = N/(5*2)			ELSE	'0';
--	ENA10HZ	<=	'1' WHEN D10HZ_REG = N/(10*2)			ELSE	'0';
--	ENA20HZ	<=	'1' WHEN D10HZ_REG = N/(20*2)			ELSE	'0';
--	ENA25HZ	<=	'1' WHEN D25HZ_REG = N/(25*2)			ELSE	'0';				
--	ENA50HZ	<=	'1' WHEN D50HZ_REG = N/(50*2)			ELSE	'0';					
--	ENA100HZ	<=	'1' WHEN D100HZ_REG = N/(100*2)		ELSE	'0';					
--	ENA1KHZ	<=	'1' WHEN D1KHZ_REG = N/(1000*2)		ELSE	'0';
--	ENA1MHZ	<=	'1' WHEN D1MHZ_REG = N/(1000000*2)	ELSE	'0';				
					
--REGISTER
	PROCESS (CKHT)
	BEGIN
		IF FALLING_EDGE (CKHT) THEN	D1MHZ_REG	<= D1MHZ_NEXT;
												D1KHZ_REG	<= D1KHZ_NEXT;		
												D100HZ_REG	<= D100HZ_NEXT;
												D50HZ_REG	<= D50HZ_NEXT;
												D25HZ_REG	<= D25HZ_NEXT;
												D20HZ_REG	<= D20HZ_NEXT;
												D10HZ_REG	<= D10HZ_NEXT;
												D5HZ_REG		<= D5HZ_NEXT;
												D2HZ_REG		<= D2HZ_NEXT;
												D1HZ_REG		<= D1HZ_NEXT;												
		END IF;
	END PROCESS;
--NEXT STATE LOGIC	
	D1MHZ_NEXT 	<= 1 WHEN D1MHZ_REG = N/1000000	ELSE
						D1MHZ_REG + 1; 
						
	D1KHZ_NEXT 	<= 1 WHEN D1KHZ_REG = N/1000	ELSE
						D1HZ_REG + 1;
						
	D100HZ_NEXT <= 1 WHEN D100HZ_REG = N/100	ELSE
						D100HZ_REG + 1;

	D50HZ_NEXT 	<= 1 WHEN D50HZ_REG = N/50	ELSE
						D50HZ_REG + 1;

	D25HZ_NEXT 	<= 1 WHEN D25HZ_REG = N/25	ELSE
						D25HZ_REG + 1;						

	D20HZ_NEXT 	<= 1 WHEN D20HZ_REG = N/20	ELSE
						D20HZ_REG + 1;						

	D10HZ_NEXT 	<= 1 WHEN D10HZ_REG = N/10	ELSE
						D10HZ_REG + 1;						

	D5HZ_NEXT 	<= 1 WHEN D5HZ_REG = N/5	ELSE
						D5HZ_REG + 1;						

	D2HZ_NEXT 	<= 1 WHEN D2HZ_REG = N/2	ELSE
						D2HZ_REG + 1;
						
	D1HZ_NEXT 	<= 1 WHEN D1HZ_REG = N/1	ELSE
						D1HZ_REG + 1;						

		
end Behavioral;

