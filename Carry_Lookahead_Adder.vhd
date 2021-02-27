----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2020 07:45:01 PM
-- Design Name: 
-- Module Name: Carry_Lookahead_Adder - Behavioral
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

entity Carry_Lookahead_Adder is
Port (x: in std_logic_vector(15 downto 0);
y: in std_logic_vector(15 downto 0);
cin: in std_logic;
s: out std_logic_vector(15 downto 0);
cout: out std_logic );
end Carry_Lookahead_Adder;

architecture Behavioral of Carry_Lookahead_Adder is

signal C1: std_logic;
signal C2: std_logic;
signal C3: std_logic;
signal C4: std_logic;
signal C5: std_logic;
signal C6: std_logic;
signal C7: std_logic;
signal C8: std_logic;
signal C9: std_logic;
signal C10: std_logic;
signal C11: std_logic;
signal C12: std_logic;
signal C13: std_logic;
signal C14: std_logic;
signal C15: std_logic;

component FA is
port(nr1,nr2: in std_logic;
CIN: in std_logic;
adder_out: out std_logic);
end component;

component CarryBlock is
generic (n: integer);
port (x: in std_logic_vector (n downto 0);
y: in std_logic_vector (n downto 0);
C0: in std_logic;
C: out std_logic );
end component;

begin

FA1: FA port map(x(0), y(0), cin, s(0));
CB1: CarryBlock 
generic map (n => 0) 
port map (x(0 downto 0), y(0 downto 0), cin, C1);

FA2: FA port map(x(1), y(1), C1, s(1));
CB2: CarryBlock 
generic map (n => 1) 
port map (x(1 downto 0), y(1 downto 0), cin, C2);

FA3: FA port map(x(2), y(2), C2, s(2));
CB3: CarryBlock 
generic map (n => 2) 
port map (x(2 downto 0), y(2 downto 0), cin, C3);

FA4: FA port map(x(3), y(3), C3, s(3));
CB4: CarryBlock 
generic map (n => 3) 
port map (x(3 downto 0), y(3 downto 0), cin, C4);

FA5: FA port map(x(4), y(4), C4, s(4));
CB5: CarryBlock 
generic map (n => 4) 
port map (x(4 downto 0), y(4 downto 0), cin, C5);

FA6: FA port map(x(5), y(5), C5, s(5));
CB6: CarryBlock 
generic map (n => 5) 
port map (x(5 downto 0), y(5 downto 0), cin, C6);

FA7: FA port map(x(6), y(6), C6, s(6));
CB7: CarryBlock 
generic map (n => 6) 
port map (x(6 downto 0), y(6 downto 0), cin, C7);

FA8: FA port map(x(7), y(7), C7, s(7));
CB8: CarryBlock 
generic map (n => 7) 
port map (x(7 downto 0), y(7 downto 0), cin, C8);

FA9: FA port map(x(8), y(8), C8, s(8));
CB9: CarryBlock 
generic map (n => 8) 
port map (x(8 downto 0), y(8 downto 0), cin, C9);

FA10: FA port map(x(9), y(9), C9, s(9));
CB10: CarryBlock 
generic map (n => 9) 
port map (x(9 downto 0), y(9 downto 0), cin, C10);

FA11: FA port map(x(10), y(10), C10, s(10));
CB11: CarryBlock 
generic map (n => 10) 
port map (x(10 downto 0), y(10 downto 0), cin, C11);

FA12: FA port map(x(11), y(11), C11, s(11));
CB12: CarryBlock 
generic map (n => 11) 
port map (x(11 downto 0), y(11 downto 0), cin, C12);

FA13: FA port map(x(12), y(12), C12, s(12));
CB13: CarryBlock 
generic map (n => 12) 
port map (x(12 downto 0), y(12 downto 0), cin, C13);

FA14: FA port map(x(13), y(13), C13, s(13));
CB14: CarryBlock 
generic map (n => 13) 
port map (x(13 downto 0), y(13 downto 0), cin, C14);

FA15: FA port map(x(14), y(14), C14, s(14));
CB15: CarryBlock 
generic map (n => 14) 
port map (x(14 downto 0), y(14 downto 0), cin, C15);

FA16: FA port map(x(15), y(15), C15, s(15));
CB16: CarryBlock 
generic map (n => 15) 
port map (x(15 downto 0), y(15 downto 0), cin, cout);

end Behavioral;
