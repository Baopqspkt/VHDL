----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:05:16 09/29/2018 
-- Design Name: 
-- Module Name:    DEM_1BIT_BTN - Behavioral 
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

entity DEM_1BIT_BTN is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DEM_1BIT_BTN;

architecture Behavioral of DEM_1BIT_BTN is

SIGNAL ENA_DB:STD_LOGIC;
begin

CD_LAM_HEP_BTN: ENTITY WORK.CD_LAM_HEP_BTN
PORT MAP ( CKHT		=> CKHT,
			  BTN			=> BTN,
			  BTN_CDLH	=> ENA_DB);
			  
			  
DEM_1BIT: ENTITY WORK.DEM_1BIT
PORT MAP ( CKHT	=> CKHT,
			  RST		=> RST,
			  ENA_DB	=> ENA_DB,
			  Q		=> Q);


end Behavioral;

