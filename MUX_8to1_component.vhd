----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2020 10:54:54 PM
-- Design Name: 
-- Module Name: MUX_component - Behavioral
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

entity MUX_8to1_component is
Port (in0: in std_logic_vector (15 downto 0);
in1: in std_logic_vector (15 downto 0);
in2: in std_logic_vector (15 downto 0);
in3: in std_logic_vector (15 downto 0);
in4: in std_logic_vector (15 downto 0);
in5: in std_logic_vector (15 downto 0);
in6: in std_logic_vector (15 downto 0);
in7: in std_logic_vector (15 downto 0);
in8: in std_logic_vector (15 downto 0);
in9: in std_logic_vector (15 downto 0);
S0: in std_logic;
S1: in std_logic;
S2: in std_logic;
S3: in std_logic;
O: out std_logic_vector (15 downto 0) );
end MUX_8to1_component;

architecture Behavioral of MUX_8to1_component is

signal aux: std_logic_vector(15 downto 0);

begin

process(S0,S1,S2,S3,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9)
begin

if (S0 = '0' and S1 = '0' and S2 = '0' and S3 = '0') then
aux <= in0; --add
elsif (S0 = '0' and S1 = '0' and S2 = '0' and S3 = '1') then
aux <= in1; --subtract
elsif (S0 = '0' and S1 = '0' and S2 = '1' and S3 = '0') then
aux <= in2; --multiply
elsif (S0 = '0' and S1 = '0' and S2 = '1' and S3 = '1') then
aux <= in3; --divide
elsif (S0 = '0' and S1 = '1' and S2 = '0' and S3 = '0') then
aux <= in4; --AND
elsif (S0 = '0' and S1 = '1' and S2 = '0' and S3 = '1') then
aux <= in5; --OR
elsif (S0 = '0' and S1 = '1' and S2 = '1' and S3 = '0') then
aux <= in6; --NOT
elsif (S0 = '0' and S1 = '1' and S2 = '1' and S3 = '1') then
aux <= in7; --rotate
elsif (S0 = '1' and S1 = '0' and S2 = '0' and S3 = '0') then
aux <= in8; --increase
elsif (S0 = '1' and S1 = '0' and S2 = '0' and S3 = '1') then
aux <= in9; --decrease
else
aux <= "ZZZZZZZZZZZZZZZZ";
end if;

end process;

O <= aux;

end Behavioral;
