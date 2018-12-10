----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:11:45 11/03/2018 
-- Design Name: 
-- Module Name:    DEM_2SO_UD - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_2SO_UD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           ENA_SS : in  STD_LOGIC;
           ENA_UD : OUT  STD_LOGIC;
			  
           DONVI : out  STD_LOGIC_VECTOR (3 downto 0);
           CHUC : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_2SO_UD;

architecture Behavioral of DEM_2SO_UD is
SIGNAL 	DONVI_REG, DONVI_NEXT: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL 	CHUC_REG, CHUC_NEXT: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL 	ENA_UD_REG, ENA_UD_NEXT: STD_LOGIC;
Begin
--REGISTER
	PROCESS (CKHT, RST)
	BEGIN	
		IF 	RST='1' 	THEN 	DONVI_REG	<=	"0000";		
									CHUC_REG		<=	"0000";
		ELSIF	RISING_EDGE (CKHT) 	THEN  
									DONVI_REG	<=	DONVI_NEXT;
									CHUC_REG		<=	CHUC_NEXT;		
		END IF;
	END PROCESS;
--NEXT STATE LOGIC		
	PROCESS(DONVI_REG, CHUC_REG, ENA_SS, ENA_DB, ENA_UD_REG)
	BEGIN
		DONVI_NEXT <= DONVI_REG;
		CHUC_NEXT  <= CHUC_REG;
		IF ENA_SS = '1' AND ENA_DB = '1' AND ENA_UD_REG = '1' THEN 
			IF DONVI_REG /= X"9"	THEN 	DONVI_NEXT <= DONVI_REG + 1;
			ELSE								DONVI_NEXT <= X"0";
				IF CHUC_REG /= X"9" THEN CHUC_NEXT <= CHUC_REG +1;
				ELSE							 CHUC_NEXT <= X"0";
				END IF;
			END IF;
		ELSIF ENA_SS = '1' AND ENA_DB = '1' AND ENA_UD_REG = '0' THEN 
			IF DONVI_REG /= X"0"	THEN 	DONVI_NEXT <= DONVI_REG - 1;
			ELSE								DONVI_NEXT <= X"9";
				IF CHUC_REG /= X"0" THEN CHUC_NEXT <= CHUC_REG -1;
				ELSE							 CHUC_NEXT <= X"9";
				END IF;
			END IF;
		END IF;
	END PROCESS;
--OUTPUT LOGIC
		DONVI	<=	DONVI_REG;	
		CHUC	<=	CHUC_REG;

--REGISTER UD_Q, UD_R
	PROCESS (CKHT, RST)
	BEGIN	
		IF 	RST='1' 	THEN 	ENA_UD_REG	<=	'1';		
		ELSIF	RISING_EDGE (CKHT) 	THEN  ENA_UD_REG	<=	ENA_UD_NEXT;
		END IF;
	END PROCESS;
--NEXT STATE LOGIC		
	PROCESS(DONVI_REG, CHUC_REG, ENA_UD_REG)
	BEGIN
		ENA_UD_NEXT <= ENA_UD_REG;
		IF 	DONVI_REG = X"9"	AND CHUC_REG = X"9" THEN 	ENA_UD_NEXT <= '0';
		ELSIF DONVI_REG = X"0"	AND CHUC_REG = X"0" THEN 	ENA_UD_NEXT <= '1';
		END IF;
	END PROCESS;
--OUTPUT LOGIC	
	ENA_UD <= ENA_UD_REG;

end Behavioral;

