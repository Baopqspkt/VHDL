library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CHOPTAT_LED is
   Port ( CKHT, RST, OE, ENA_DB : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end CHOPTAT_LED;

architecture Behavioral of CHOPTAT_LED is
SIGNAL	Q_REG,	Q_NEXT:	STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	PROCESS (CKHT, RST)
	BEGIN
			IF	RST = '1'							THEN				Q_REG	<=	(OTHERS => '0');
			ELSIF	FALLING_EDGE	(CKHT)		THEN				Q_REG	<=	Q_NEXT;
			END IF;
	END PROCESS;
	
	Q_NEXT	<=	(OTHERS => '0')				WHEN	OE =	'0'	ELSE
					NOT(Q_REG) 	WHEN	ENA_DB  =	'1'	ELSE
					Q_REG;
					
	Q			<=	Q_REG	WHEN	OE = '1' ELSE (OTHERS	=>	'0');
end Behavioral;
