----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2021 12:28:57 PM
-- Design Name: 
-- Module Name: MULTIPLICATION_component - Behavioral
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

entity MULTIPLICATION_component is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0) );
end MULTIPLICATION_component;

architecture Behavioral of MULTIPLICATION_component is

component WallaceTree is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(29 downto 0) );
end component;


signal aux1: std_logic_vector(29 downto 0);
signal aux2: std_logic_vector(29 downto 0);
signal aux3: std_logic_vector(29 downto 0);
signal aux4: std_logic_vector(29 downto 0);

signal two_complement_A: std_logic_vector(15 downto 0);
signal two_complement_B: std_logic_vector(15 downto 0);

signal two_complement_aux2: std_logic_vector(29 downto 0);
signal two_complement_aux3: std_logic_vector(29 downto 0);

begin

two_complement_A <= (not A) + 1;
two_complement_B <= (not B) + 1;

MULT1: WallaceTree port map(A,B,aux1);
MULT2: WallaceTree port map(two_complement_A,B,aux2);
MULT3: WallaceTree port map(A,two_complement_B,aux3);
MULT4: WallaceTree port map(two_complement_A,two_complement_B,aux4);

process(A,B,aux1,aux2,aux3,aux4)
begin

if A(15) = '0' AND B(15) = '0' then
if aux1 > "000000000000000111111111111111" then
O <= "0000000000000000";
else
O <= aux1(15 downto 0);
end if;

elsif A(15) = '1' AND B(15) = '1' then 
if aux4 > "000000000000000111111111111111" then
O <= "0000000000000000";
else
O <= aux4(15 downto 0);
end if;

elsif A(15) = '1' AND B(15) = '0' then
two_complement_aux2 <= (not aux2) + 1;
if aux2 > "000000000000001000000000000000" then
O <= "0000000000000000";
else
O(15) <= '1';
O(14 downto 0) <= two_complement_aux2(14 downto 0);
end if;

elsif A(15) = '0' AND B(15) = '1' then
two_complement_aux3 <= (not aux3) + 1;
if aux3 > "000000000000001000000000000000" then
O <= "0000000000000000";
else
O(15) <= '1';
O(14 downto 0) <= two_complement_aux3(14 downto 0);
end if;

end if;

end process;

end Behavioral;
