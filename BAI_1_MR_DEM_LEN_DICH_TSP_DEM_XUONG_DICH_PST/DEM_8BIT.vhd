----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:05:54 09/19/2018 
-- Design Name: 
-- Module Name:    DEM_8BIT - Behavioral 
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

entity DEM_8BIT is
    Port ( ENA_DB,ENA_SS : in  STD_LOGIC;
           CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  CHOPHEP:OUT STD_LOGIC;
           DEM : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_8BIT;

architecture Behavioral of DEM_8BIT is
SIGNAL Q_REG,Q_NEXT:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CP_REG,CP_NEXT:STD_LOGIC;
begin

PROCESS(CKHT,RST)
BEGIN

	IF RST = '1' 				  THEN 	Q_REG <= (OTHERS	=> '0');
												CH_REG <= '0';
	ELSIF FALLING_EDGE (CKHT) THEN 	Q_REG <= Q_NEXT;
												CH_REG <= CH_NEXT;
	END IF;
	
END PROCESS;

Q_NEXT	<= "01100011" WHEN 
				Q_REG + 1 WHEN ENA_DB = '1' AND ENA_SS ='1' ELSE
				Q_REG;

CH_NEXT <= 
				
				
DEM	<= Q_REG;			
	
end Behavioral;

