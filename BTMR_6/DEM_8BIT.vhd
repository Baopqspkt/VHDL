
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEM_8BIT is
    Port ( CKHT, RST, ENA_DB, ENA_SS : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_8BIT;

architecture Behavioral of DEM_8BIT is
signal Q_REG, Q_NEXT: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1' THEN	Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	
	Q_NEXT <= 	Q_REG + 1 WHEN ENA_DB = '1' AND ENA_SS ='1' ELSE
					Q_REG;
	Q <= Q_REG;
end Behavioral;

