----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2020 04:39:24 PM
-- Design Name: 
-- Module Name: register_component - Behavioral
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

entity register_component is
Port (i: in std_logic_vector(15 downto 0);
clk: in std_logic;
reset: in std_logic;
o: out std_logic_vector(15 downto 0) );
end register_component;

architecture Behavioral of register_component is

begin

process(clk,reset)
begin

if clk'event and clk='1' then
if reset='1' then
o <= "0000000000000000";
else
o <= i;
end if;
end if;

end process;

end Behavioral;
