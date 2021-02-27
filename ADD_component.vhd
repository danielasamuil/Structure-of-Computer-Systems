----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2020 07:23:11 PM
-- Design Name: 
-- Module Name: ADD_component - Behavioral
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

entity ADD_component is
Port (A: in std_logic_vector (15 downto 0);
B: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0);
COUT: out std_logic );
end ADD_component;

architecture Behavioral of ADD_component is

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

signal sum: std_logic_vector(15 downto 0) := "0000000000000000";
signal sum_both_negative: std_logic_vector(15 downto 0) := "0000000000000000";
signal sum1: std_logic_vector(15 downto 0) := "0000000000000000";
signal sum2: std_logic_vector(15 downto 0) := "0000000000000000";
signal carry: std_logic := '0';
signal carry1: std_logic := '0';
signal carry2: std_logic := '0';
signal carry_both_negative: std_logic := '0';

signal two_complement_A: std_logic_vector(15 downto 0) := "0000000000000000";
signal two_complement_B: std_logic_vector(15 downto 0) := "0000000000000000";

begin

two_complement_B <= (not B) + 1;
two_complement_A <= (not A) + 1;

ADDER1: Simple_Adder port map(A, B, '0', sum, carry);
ADDER2: Simple_Adder port map(two_complement_A, two_complement_B, '0', sum_both_negative, carry_both_negative);
SIMPLEADDER: Simple_Adder port map(A, B, '0', sum1, carry1); 
SIMPLEADDER1: Simple_Adder port map(two_complement_A, two_complement_B, '0', sum2, carry2); 


process(sum, carry, sum_both_negative, carry_both_negative, sum1, carry1)
begin
if ( A(15) = '0' and B(15) = '0' ) then
if(sum1(15)='1') then
O <= "0000000000000000";
COUT <= '1';
else
O <= sum;
COUT <= carry;
end if;
elsif A(15)= '0' and B(15) ='1' then
  if A(14 downto 0) = two_complement_B(14 downto 0) then
  COUT <='0';
  O <= "0000000000000000";
  end if;
  if A(14 downto 0) > two_complement_B(14 downto 0) then
  if carry ='1' then
  COUT <= '0';
  O <= sum;
  end if;
  elsif A(14 downto 0) < two_complement_B(14 downto 0) then
  O <= sum1;
  COUT <= '0';
  end if;
elsif A(15)= '1' and B(15)='0' then
  if B(14 downto 0) = two_complement_A(14 downto 0) then
  COUT <='0';
  O <= "0000000000000000";
  end if;
  if B(14 downto 0) > two_complement_A(14 downto 0) then
  if carry = '1' then
  COUT <= '0';
  O <= sum; 
  end if;
  elsif B(14 downto 0) < two_complement_A(14 downto 0) then
  O <= sum1;
  COUT <= '0'; 
  end if;
elsif A(15)='1' and B(15)='1' then
if(sum2(15)='1') then
COUT <= '1';
O <= "0000000000000000";
else
O <= (not sum_both_negative) + 1 ;
COUT <= '0';
end if;
end if;
end process;

end Behavioral;
