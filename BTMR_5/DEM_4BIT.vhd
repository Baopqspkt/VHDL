----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:01 02/27/2017 
-- Design Name: 
-- Module Name:    DEM_4BIT - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_4BIT is
    Port ( CKHT, RST, ENA_DB,ENA_SS : in  STD_LOGIC;
				Q1: OUT STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (4 downto 0));
end DEM_4BIT;

architecture Behavioral of DEM_4BIT is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR (4 downto 0);
begin
	PROCESS(CKHT,RST)
	BEGIN
		IF RST = '1' THEN Q_REG <= (OTHERS => '0');
		ELSIF FALLING_EDGE(CKHT) THEN Q_REG <= Q_NEXT;
		END IF;
	END PROCESS;
	
	PROCESS( Q_REG, ENA_DB,ENA_SS)
	BEGIN
		Q_NEXT	<=	Q_REG;
		IF	ENA_DB	=	'1' AND ENA_SS ='1' THEN
			IF	Q_REG	=	"10100"	THEN	Q_NEXT	<=	(OTHERS => '0');
			ELSE									Q_NEXT	<=	Q_REG + 1;
			END IF;
		END IF;	
	END PROCESS;
				
	Q1 <= '0' WHEN Q_REG = "10100" ELSE '1';
end Behavioral;

