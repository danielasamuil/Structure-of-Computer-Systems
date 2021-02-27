----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2020 10:06:18 PM
-- Design Name: 
-- Module Name: AND_component - Behavioral
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

entity AND_component is
Port (A: in std_logic_vector (15 downto 0);
B: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0) );
end AND_component;

architecture Behavioral of AND_component is

begin

process(A,B)
begin
O <= A and B;
end process;

end Behavioral;
