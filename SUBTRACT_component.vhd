----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2020 11:26:32 AM
-- Design Name: 
-- Module Name: SUBTRACT_component - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUBTRACT_component is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0) );
end SUBTRACT_component;

architecture Behavioral of SUBTRACT_component is

signal carry1: std_logic;
signal carry: std_logic;
signal two_complement_B: std_logic_vector(15 downto 0);
signal sum: std_logic_vector(15 downto 0);
signal sum1: std_logic_vector(15 downto 0);

component Carry_Lookahead_Adder is
Port (x: in std_logic_vector(15 downto 0);
y: in std_logic_vector(15 downto 0);
cin: in std_logic;
s: out std_logic_vector(15 downto 0);
cout: out std_logic );
end component;

component Simple_Adder is
Port (x: in std_logic_vector(15 downto 0);
y: in std_logic_vector(15 downto 0);
cin: in std_logic;
s: out std_logic_vector(15 downto 0);
cout: out std_logic );
end component;

begin

two_complement_B <= (not B) + 1;

ADDER: Carry_Lookahead_Adder port map(A, two_complement_B, '0', sum, carry);
ADDER1: Simple_Adder port map(A, two_complement_B, '0', sum1, carry1); 

process(carry1,sum1)
begin
if ( A(15) = '0' and two_complement_B(15) = '0' ) then
if(sum1(15)='1') then
O <= "0000000000000000";
else
O <= sum;
end if;
elsif A(15)= '0' and two_complement_B(15) ='1' then
  if A(14 downto 0) = B(14 downto 0) then
  O <= "0000000000000000";
  end if;
  if A(14 downto 0) > B(14 downto 0) then
  if carry1 ='1' then
  O <= sum1;
  end if;
  elsif A(14 downto 0) < B(14 downto 0) then
  O <= sum1;
  end if;
  elsif A(15)= '1' and two_complement_B(15)='0' then
  if B(14 downto 0) = A(14 downto 0) then
  O <= "0000000000000000";
  end if;
  if B(14 downto 0) > A(14 downto 0) then
  if carry1 = '1' then
  O <= sum1; 
  end if;
  elsif B(14 downto 0) < A(14 downto 0) then
  O <= sum1;
  end if;
elsif A(15)='1' and two_complement_B(15)='1' then
O <= sum1;
end if;
end process;

end Behavioral;
