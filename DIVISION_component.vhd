----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/05/2021 05:15:01 PM
-- Design Name: 
-- Module Name: DIVISION_component - Behavioral
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
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIVISION_component is
Port ( A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0);
R: out std_logic_vector(15 downto 0) );
end DIVISION_component;

architecture Behavioral of DIVISION_component is

signal two_complement_A: std_logic_vector(15 downto 0);
signal two_complement_B: std_logic_vector(15 downto 0);
signal divisor_copy: std_logic_vector(15 downto 0);
signal divident_copy: std_logic_vector(15 downto 0);
signal output_copy: std_logic_vector(15 downto 0);

component DIVIDE_component is
Port (divident: in std_logic_vector(15 downto 0);
divisor: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0);
remainder: out std_logic_vector(15 downto 0) );
end component;

begin

two_complement_A <= (not A) + 1;
two_complement_B <= (not B) + 1;

process(two_complement_A,A,two_complement_B,B)
begin
if B(15) ='0' then
divisor_copy <= B;
else
divisor_copy <= two_complement_B;
end if;
if A(15)='0' then
divident_copy <= A;
else
divident_copy <= two_complement_A;
end if;

end process;

DIVIDE: DIVIDE_component port map(divident_copy, divisor_copy, output_copy, R);

process(A,B,output_copy)
begin
if ((A(15)='1' and B(15)='1') or (A(15)='0' and B(15)='0')) then
O(15) <= '0';
O(14 downto 0) <= output_copy(14 downto 0);
elsif ((A(15)='0' and B(15)='1') or (A(15)='1' and B(15)='0')) then
O <= (not output_copy) + 1;
end if;
end process;

end Behavioral;
