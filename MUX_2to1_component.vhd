----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2020 11:16:30 PM
-- Design Name: 
-- Module Name: MUX_2to1_component - Behavioral
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

entity MUX_2to1_component is
Port (in0: in std_logic_vector(15 downto 0);
in1: in std_logic_vector(15 downto 0);
S3: in std_logic;
O: out std_logic_vector(15 downto 0) );
end MUX_2to1_component;

architecture Behavioral of MUX_2to1_component is

begin

process(S3,in0,in1)
begin

if S3 = '0' then
O <= in0;
else
O <= in1;
end if;

end process;

end Behavioral;
