
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DK_UD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q_CHUC, Q_DONVI : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Q_UD : OUT  STD_LOGIC);
end DK_UD;

architecture Behavioral of DK_UD is
signal  Q_NEXT, Q_REG: STD_LOGIC;
begin
	PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1' THEN	Q_REG <= '0';
		ELSIF FALLING_EDGE (CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
----------------------------------------------
Q_NEXT <= '1' WHEN Q_CHUC = "0001" AND Q_DONVI = "0000" ELSE 
			 '0' WHEN Q_CHUC = X"3" AND Q_DONVI = X"5" ELSE
			 Q_REG;
Q_UD <= Q_REG;
end Behavioral;

