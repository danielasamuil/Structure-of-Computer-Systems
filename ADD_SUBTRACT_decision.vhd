----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/05/2021 10:38:39 PM
-- Design Name: 
-- Module Name: ADD_SUBTRACT_decision - Behavioral
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

entity ADD_SUBTRACT_decision is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
select_op: in std_logic;
O: out std_logic_vector(15 downto 0);
COUT: out std_logic );
end ADD_SUBTRACT_decision;

architecture Behavioral of ADD_SUBTRACT_decision is

signal sum: std_logic_vector(15 downto 0) := "0000000000000000";
signal difference: std_logic_vector(15 downto 0);
signal cout_aux: std_logic;

component ADD_component is
Port (A: in std_logic_vector (15 downto 0);
B: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0);
COUT: out std_logic );
end component;

component SUBTRACT_component is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0) );
end component;

begin

ADD1: ADD_component port map(A,B,sum,cout_aux);
DIFF1: SUBTRACT_component port map(A,B,difference);

process(A,B,select_op)
begin

if select_op = '0' then 
O <= sum;
COUT <= cout_aux;
else
O <= difference;
COUT <= '0';
end if;

end process;

end Behavioral;
