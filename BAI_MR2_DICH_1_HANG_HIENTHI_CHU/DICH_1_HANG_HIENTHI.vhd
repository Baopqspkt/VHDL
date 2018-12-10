----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:35 11/28/2018 
-- Design Name: 
-- Module Name:    DICH_1_HANG_HIENTHI - Behavioral 
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

entity DICH_1_HANG_HIENTHI is
Port ( CKHT, BTN_N0 : in  STD_LOGIC;
           BELL : out  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_RW : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DICH_1_HANG_HIENTHI;

architecture Behavioral of DICH_1_HANG_HIENTHI is
SIGNAL ENA2HZ : STD_LOGIC;
SIGNAL LCD_HANG_1: STD_LOGIC_VECTOR (159 DOWNTO 0);
SIGNAL LCD_HANG_2: STD_LOGIC_VECTOR (159 DOWNTO 0);
SIGNAL LCD_HANG_3: STD_LOGIC_VECTOR (159 DOWNTO 0);
SIGNAL LCD_HANG_4: STD_LOGIC_VECTOR (159 DOWNTO 0);
SIGNAL RST		  : STD_LOGIC;
begin
lcd_rw 	<= '0';
rst		<= not BTN_N0;
BELL		<= '1';
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
CHIA_XUNG: ENTITY WORK. CHIA_10ENA
	PORT MAP (
		CKHT => CKHT,
		ENA2HZ => ENA2HZ);
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
LCD_GAN_DULIEU_HIENTHI:	ENTITY WORK.LCD_GAN_DULIEU_HIENTHI
   PORT MAP(   
		LCD_HANG_1  => LCD_HANG_1,
		LCD_HANG_2  => LCD_HANG_2,
		ENA2HZ		=> ENA2HZ,
		RST  			=> RST,
      CKHT   		=> CKHT,
		LCD_HANG_3  => LCD_HANG_3,
      LCD_HANG_4  => LCD_HANG_4);	
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX									
LCD_KHOITAO_HIENTHI:	ENTITY WORK.LCD_KHOITAO_HIENTHI 
   PORT MAP(   
		LCD_DB   	=> LCD_DB,     
      LCD_RS   	=> LCD_RS,                            
      LCD_E    	=> LCD_E,
      LCD_RST  	=> RST,
      LCD_CK   	=> CKHT,
		LCD_HANG_1	=>	LCD_HANG_1,
		LCD_HANG_2  => LCD_HANG_3,
		LCD_HANG_3  => LCD_HANG_4,
		LCD_HANG_4	=>	LCD_HANG_2);
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end Behavioral;

