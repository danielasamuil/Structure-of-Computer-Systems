----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2020 10:24:00 PM
-- Design Name: 
-- Module Name: ROTATE_component - Behavioral
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

entity ROTATE_component is
Port (A: in std_logic_vector (15 downto 0);
enable_right: in std_logic;
O: out std_logic_vector (15 downto 0)  );
end ROTATE_component;

architecture Behavioral of ROTATE_component is

begin

process(enable_right,A)
begin

if enable_right = '1' then
O(15) <= A(15);
O(14) <= A(0);
O(13) <= A(14);
O(12) <= A(13);
O(11) <= A(12);
O(10) <= A(11);
O(9) <= A(10);
O(8) <= A(9);
O(7) <= A(8);
O(6) <= A(7);
O(5) <= A(6);
O(4) <= A(5);
O(3) <= A(4);
O(2) <= A(3);
O(1) <= A(2);
O(0) <= A(1);
else
O(15) <= A(15);
O(14) <= A(13);
O(13) <= A(12);
O(12) <= A(11);
O(11) <= A(10);
O(10) <= A(9);
O(9) <= A(8);
O(8) <= A(7);
O(7) <= A(6);
O(6) <= A(5);
O(5) <= A(4);
O(4) <= A(3);
O(3) <= A(2);
O(2) <= A(1);
O(1) <= A(0);
O(0) <= A(14);
end if;

end process;

end Behavioral;
