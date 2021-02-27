----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2020 11:41:59 AM
-- Design Name: 
-- Module Name: INCREASE_component - Behavioral
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

entity INCREASE_component is
Port (A: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0);
COUT: out std_logic );
end INCREASE_component;

architecture Behavioral of INCREASE_component is

component ADD_component is
Port (A: in std_logic_vector (15 downto 0);
B: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0);
COUT: out std_logic );
end component;

begin

ADDER: ADD_component port map(A, "0000000000000001", O, COUT);

end Behavioral;
