----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2020 11:18:00 AM
-- Design Name: 
-- Module Name: Full_Adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
port(nr1,nr2: in std_logic;
CIN: in std_logic;
adder_out: out std_logic;
COUT: out std_logic);
end Full_Adder;

architecture Behavioral of Full_Adder is

begin

adder_out <= nr1 XOR nr2 XOR CIN;
COUT <= (nr1 AND nr2) OR (CIN AND nr1) OR (CIN AND nr2);

end Behavioral;