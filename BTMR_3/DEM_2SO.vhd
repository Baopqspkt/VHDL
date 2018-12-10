
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEM_2SO is
	Port ( CKHT, RST, ENA_SS, ENA_DB, ENA_UD: in  STD_LOGIC;
           DONVI, CHUC : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_2SO;

architecture Behavioral of DEM_2SO is
SIGNAL DONVI_REG, DONVI_NEXT: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL CHUC_REG, CHUC_NEXT: STD_LOGIC_VECTOR (3 DOWNTO 0);
begin

	PROCESS (CKHT, RST)
	BEGIN
		IF RST ='1' THEN DONVI_REG <= "0000";
							  CHUC_REG <= "0000";
		ELSIF FALLING_EDGE (CKHT) THEN DONVI_REG <= DONVI_NEXT;
													CHUC_REG <= CHUC_NEXT;
		END IF;
	END PROCESS;
--------------------------------------------------------------------
	PROCESS (DONVI_REG, CHUC_REG, ENA_SS, ENA_DB, ENA_UD)
	BEGIN
		DONVI_NEXT <= DONVI_REG;
		CHUC_NEXT <= CHUC_REG;
		IF ENA_DB ='1' THEN 
			IF ENA_SS ='1' THEN 
			
				IF ENA_UD = '1' THEN
					IF DONVI_REG /= X"9" THEN DONVI_NEXT <= DONVI_REG +1;
					ELSE								
						DONVI_NEXT <= X"0";
						IF CHUC_REG /= X"9" THEN CHUC_NEXT <= CHUC_REG +1;
						ELSE								
						CHUC_NEXT <= X"0";
						END IF;
					END IF;
				ELSE  
					IF DONVI_REG /= X"0" THEN DONVI_NEXT <= DONVI_REG -1;
					ELSE								
						DONVI_NEXT <= X"9";
						IF CHUC_REG /= X"0" THEN CHUC_NEXT <= CHUC_REG -1;
						ELSE								
						CHUC_NEXT <= X"9";
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	DONVI <= DONVI_REG;
	CHUC <= CHUC_REG;
end Behavioral;

