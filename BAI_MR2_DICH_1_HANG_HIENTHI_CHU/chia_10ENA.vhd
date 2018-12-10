----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:48 09/19/2018 
-- Design Name: 
-- Module Name:    chia_10ENA - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chia_10ENA is
    Port ( CKHT : in  STD_LOGIC;
           ENA1HZ,ENA2HZ,ENA5HZ : out  STD_LOGIC;
           ENA10HZ,ENA20HZ,ENA25HZ : out  STD_LOGIC;
           ENA50HZ,ENA100HZ,ENA1KHZ : out  STD_LOGIC;
           ENA1MHZ : out  STD_LOGIC);
end chia_10ENA;

architecture Behavioral of chia_10ENA is

CONSTANT N:INTEGER := 50000000;
SIGNAL D1HZ_REG, D1HZ_NEXT     : INTEGER RANGE 0 TO N:=1;
SIGNAL D2HZ_REG, D2HZ_NEXT     : INTEGER RANGE 0 TO N/2:=1;
SIGNAL D5HZ_REG, D5HZ_NEXT     : INTEGER RANGE 0 TO N/5:=1;
SIGNAL D10HZ_REG, D10HZ_NEXT   : INTEGER RANGE 0 TO N/10:=1;
SIGNAL D20HZ_REG, D20HZ_NEXT   : INTEGER RANGE 0 TO N/20:=1;
SIGNAL D25HZ_REG, D25HZ_NEXT   : INTEGER RANGE 0 TO N/25:=1;
SIGNAL D50HZ_REG, D50HZ_NEXT   : INTEGER RANGE 0 TO N/50:=1;
SIGNAL D100HZ_REG, D100HZ_NEXT : INTEGER RANGE 0 TO N/100:=1;
SIGNAL D1KHZ_REG, D1KHZ_NEXT   : INTEGER RANGE 0 TO N/1000:=1;
SIGNAL D1MHZ_REG, D1MHZ_NEXT   : INTEGER RANGE 0 TO N/1000000:=1;

begin

--OUT PUT
ENA1hz   <= '1' when d1hz_reg 	= N/(2*1) 		else	'0';
ENA2hz	<= '1' when D2HZ_REG 	= N/(2*2) 		else 	'0';
ENA5hz   <= '1' when d5hz_reg 	= N/(2*5) 		else	'0';
ENA10hz	<= '1' when d10hz_reg 	= N/(2*10) 		else 	'0';
ENA20hz  <= '1' when d20hz_reg 	= N/(2*20) 		else	'0';
ENA25hz	<= '1' when d25hz_reg 	= N/(2*25)		else 	'0';
ENA50Hz  <= '1' when d50hz_reg 	= N/(2*50) 		else	'0';
ENA100hz	<= '1' when d100hz_reg	= N/(2*100) 	else 	'0';
ENA1Khz  <= '1' when d1Khz_reg 	= N/(2*1000) 	else	'0';
ENA1Mhz	<= '1' when d1Mhz_reg 	= N/(2*1000000)else 	'0';				

---
	process(ckht)
	begin
		if falling_edge (ckht) then 	d1hz_reg  	<= d1hz_next;
												D2HZ_REG		<= D2HZ_NEXT;
												D5HZ_REG		<= D5HZ_NEXT;
												d10hz_reg 	<= d10hz_next;
												D20HZ_REG	<= D20HZ_NEXT;
												D25HZ_REG	<= D25HZ_NEXT;
												D50HZ_REG	<= D50HZ_NEXT;
												D100HZ_REG	<= D100HZ_NEXT;
												D1KHZ_REG	<= D1KHZ_NEXT;
												D1MHZ_REG	<= D1MHZ_NEXT;
												
		end if;
	end process;
---- 
	d1hz_next  	<= 1 when d1hz_reg 	= N 				else		d1hz_reg 	+ 	1	;
	d2hz_next 	<= 1 when d2hz_reg 	= N/2 			else		d2hz_reg 	+	1	;
	d5hz_next  	<= 1 when d5hz_reg 	= N/5 			else		d5hz_reg 	+ 	1	;
	d10hz_next 	<= 1 when d10hz_reg 	= N/10 			else		d10hz_reg 	+	1	;
	d20hz_next  <= 1 when d20hz_reg	= N/20 			else		d20hz_reg 	+ 	1	;
	d25hz_next 	<= 1 when d25hz_reg 	= N/25 			else		d25hz_reg 	+	1	;
	d50hz_next  <= 1 when d50hz_reg 	= N/50 			else		d50hz_reg 	+ 	1	;
	d100hz_next <= 1 when d100hz_reg = N/100 			else		d100hz_reg 	+	1	;
	d1Khz_next  <= 1 when d1Khz_reg 	= N/1000 		else		d1Khz_reg 	+ 	1	;
	d1Mhz_next 	<= 1 when d1Mhz_reg 	= N/1000000 	else		d1Mhz_reg 	+	1	;

end Behavioral;

