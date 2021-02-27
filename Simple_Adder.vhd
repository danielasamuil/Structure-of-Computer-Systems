----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2020 05:34:37 PM
-- Design Name: 
-- Module Name: Simple_Adder - Behavioral
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

entity Simple_Adder is
Port (x: in std_logic_vector(15 downto 0);
y: in std_logic_vector(15 downto 0);
cin: in std_logic;
s: out std_logic_vector(15 downto 0);
cout: out std_logic );
end Simple_Adder;

architecture Behavioral of Simple_Adder is

component Full_Adder is
port(nr1,nr2: in std_logic;
CIN: in std_logic;
adder_out: out std_logic;
COUT: out std_logic);
end component;

signal aux_carry: std_logic_vector(15 downto 0) := "0000000000000000";

begin

FA0: Full_Adder port map (x(0), y(0), '0', S(0), aux_carry(0)); 
FA1: Full_Adder port map (x(1), y(1), aux_carry(0), S(1), aux_carry(1));
FA2: Full_Adder port map (x(2), y(2), aux_carry(1), S(2), aux_carry(2));
FA3: Full_Adder port map (x(3), y(3), aux_carry(2), S(3), aux_carry(3));
FA4: Full_Adder port map (x(4), y(4), aux_carry(3), S(4), aux_carry(4));
FA5: Full_Adder port map (x(5), y(5), aux_carry(4), S(5), aux_carry(5));
FA6: Full_Adder port map (x(6), y(6), aux_carry(5), S(6), aux_carry(6));
FA7: Full_Adder port map (x(7), y(7), aux_carry(6), S(7), aux_carry(7));
FA8: Full_Adder port map (x(8), y(8), aux_carry(7), S(8), aux_carry(8)); 
FA9: Full_Adder port map (x(9), y(9), aux_carry(8), S(9), aux_carry(9));
FA10: Full_Adder port map (x(10), y(10), aux_carry(9), S(10), aux_carry(10));
FA11: Full_Adder port map (x(11), y(11), aux_carry(10), S(11), aux_carry(11));
FA12: Full_Adder port map (x(12), y(12), aux_carry(11), S(12), aux_carry(12));
FA13: Full_Adder port map (x(13), y(13), aux_carry(12), S(13), aux_carry(13));
FA14: Full_Adder port map (x(14), y(14), aux_carry(13), S(14), aux_carry(14));
FA15: Full_Adder port map (x(15), y(15), aux_carry(14), S(15), aux_carry(15));

cout <= aux_carry(15);

end Behavioral;
