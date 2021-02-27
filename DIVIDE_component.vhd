----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2020 04:13:27 PM
-- Design Name: 
-- Module Name: DIVIDE_component - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIVIDE_component is
Port (divident: in std_logic_vector(15 downto 0);
divisor: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0);
remainder: out std_logic_vector(15 downto 0) );
end DIVIDE_component;

architecture Behavioral of DIVIDE_component is

begin
           
process(divisor, divident)

variable output_copy: std_logic_vector(15 downto 0);
variable remainder_aux: std_logic_vector(15 downto 0) := "0000000000000000";

variable i:integer;

begin
 
output_copy := "0000000000000000";
remainder_aux := "0000000000000000";

                   
    for i in 14 downto 0 loop
       remainder_aux(15) := remainder_aux(14);
       remainder_aux(14) := remainder_aux(13);
       remainder_aux(13) := remainder_aux(12);
       remainder_aux(12) := remainder_aux(11);
       remainder_aux(11) := remainder_aux(10);
       remainder_aux(10) := remainder_aux(9);
       remainder_aux(9) := remainder_aux(8);
       remainder_aux(8) := remainder_aux(7);
       remainder_aux(7) := remainder_aux(6);
       remainder_aux(6) := remainder_aux(5);
       remainder_aux(5) := remainder_aux(4);
       remainder_aux(4) := remainder_aux(3);
       remainder_aux(3) := remainder_aux(2);
       remainder_aux(2) := remainder_aux(1);
       remainder_aux(1) := remainder_aux(0);
       remainder_aux(0) := divident(i);
       if remainder_aux >= divisor then
          remainder_aux := remainder_aux - divisor;
          output_copy(i) := '1';
       end if;                     
     end loop;
    

if (divisor = "0000000000000000") then O <= "ZZZZZZZZZZZZZZZZ"; remainder <= "ZZZZZZZZZZZZZZZZ";
else  O <= output_copy; remainder <=remainder_aux;
end if;

         
end process;

end Behavioral;
