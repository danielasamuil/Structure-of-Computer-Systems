----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2020 11:09:42 PM
-- Design Name: 
-- Module Name: CONTROL_component - Behavioral
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

entity CONTROL_component is
Port (S0in: in std_logic;
S1in: in std_logic;
S2in: in std_logic;
S3in: in std_logic;
S4in: in std_logic;
S5in: in std_logic;
en_right_in: in std_logic;
cout_adder: in std_logic;
cout_increase: in std_logic;
remainder_division: in std_logic_vector(15 downto 0);
S0out: out std_logic;
S1out: out std_logic;
S2out: out std_logic;
S3out: out std_logic;
S4out: out std_logic;
S5out: out std_logic;
en_right_out: out std_logic;
overflow: out std_logic;
error_division: out std_logic );
end CONTROL_component;

architecture Behavioral of CONTROL_component is

begin

process(S0in,S1in,S2in,S3in,S4in,S5in,en_right_in, remainder_division, cout_adder, cout_increase)
begin

if cout_adder = '1' OR cout_increase = '1' then
overflow <= '1';
else
overflow <= '0';
end if;

if remainder_division = "ZZZZZZZZZZZZZZZZ" then
error_division <= '1';
else
error_division <= '0';
end if;

S0out <= S0in;
S1out <= S1in;
S2out <= S2in;
S3out <= S3in;
S4out <= S4in;
S5out <= S5in;
en_right_out <= en_right_in;

end process;

end Behavioral;
