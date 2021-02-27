----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/05/2021 10:23:59 PM
-- Design Name: 
-- Module Name: ALU_top_level - Behavioral
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

entity ALU_top_level is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
S0in: in std_logic;
S1in: in std_logic;
S2in: in std_logic;
S3in: in std_logic;
S4in: in std_logic;
S5in: in std_logic;
en_right_in: in std_logic;
clk: in std_logic;
reset: in std_logic;
overflow: out std_logic;
error_division: out std_logic;
final_result: out std_logic_vector(15 downto 0) );
end ALU_top_level;

architecture Behavioral of ALU_top_level is

signal result: std_logic_vector(15 downto 0);
signal registerA_in: std_logic_vector(15 downto 0);
signal select_mux_register: std_logic;
signal out_register_A: std_logic_vector(15 downto 0);
signal out_register_B: std_logic_vector(15 downto 0);
signal out_adder: std_logic_vector(15 downto 0);
signal cout_adder: std_logic;
signal out_subtract: std_logic_vector(15 downto 0);
signal out_mult: std_logic_vector(15 downto 0);
signal out_div: std_logic_vector(15 downto 0);
signal out_and: std_logic_vector(15 downto 0);
signal out_or: std_logic_vector(15 downto 0);
signal select_mux_single_op: std_logic;
signal single_operand: std_logic_vector(15 downto 0);
signal out_not: std_logic_vector(15 downto 0);
signal out_rotate: std_logic_vector(15 downto 0);
signal out_increase: std_logic_vector(15 downto 0);
signal out_decrease: std_logic_vector(15 downto 0);
signal S0: std_logic;
signal S1: std_logic;
signal S2: std_logic;
signal S3: std_logic;
signal en_right_out: std_logic;
signal remainder: std_logic_vector(15 downto 0);
signal cout_increase: std_logic;
signal cout_final: std_logic;

component MUX_2to1_component is
Port (in0: in std_logic_vector(15 downto 0);
in1: in std_logic_vector(15 downto 0);
S3: in std_logic;
O: out std_logic_vector(15 downto 0) );
end component;

component register_component is
Port (i: in std_logic_vector(15 downto 0);
clk: in std_logic;
reset: in std_logic;
o: out std_logic_vector(15 downto 0) );
end component;

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

component MULTIPLICATION_component is
Port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0) );
end component;

component DIVISION_component is
Port ( A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0);
R: out std_logic_vector(15 downto 0) );
end component;

component AND_component is
Port (A: in std_logic_vector (15 downto 0);
B: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0) );
end component;

component OR_component is
Port (A: in std_logic_vector (15 downto 0);
B: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0)  );
end component;

component NOT_component is
Port (A: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0)  );
end component;

component ROTATE_component is
Port (A: in std_logic_vector (15 downto 0);
enable_right: in std_logic;
O: out std_logic_vector (15 downto 0)  );
end component;

component INCREASE_component is
Port (A: in std_logic_vector(15 downto 0);
O: out std_logic_vector(15 downto 0);
COUT: out std_logic );
end component;

component DECREASE_component is
Port (A: in std_logic_vector (15 downto 0);
O: out std_logic_vector (15 downto 0) );
end component;

component MUX_8to1_component is
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
end component;

component CONTROL_component is
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
end component;

begin

MUX1: MUX_2to1_component port map(A, result, select_mux_register, registerA_in);
REGISTER_A: register_component port map(registerA_in, clk, reset, out_register_A);
REGISTER_B: register_component port map(B, clk, reset, out_register_B);  
ADD: ADD_component port map(out_register_A, out_register_B, out_adder, cout_adder);
SUBTRACT: SUBTRACT_component port map(out_register_A, out_register_B, out_subtract);
MULTIPLY: MULTIPLICATION_component port map(out_register_A, out_register_B, out_mult);
DIVIDE: DIVISION_component port map(out_register_A, out_register_B, out_div, remainder);
AND1: AND_component port map(out_register_A, out_register_B, out_and);
OR1: OR_component port map(out_register_A, out_register_B, out_or);
MUX2: MUX_2to1_component port map(out_register_A, out_register_B, select_mux_single_op, single_operand);
NOT1: NOT_component port map(single_operand, out_not);
ROTATE: ROTATE_component port map(single_operand, en_right_out, out_rotate);
INCREASE: INCREASE_component port map(single_operand, out_increase, cout_increase);
DECREASE: DECREASE_component port map(single_operand, out_decrease);
MUX3: MUX_8to1_component port map(out_adder, out_subtract, out_mult, out_div, out_and, out_or, out_not, out_rotate, out_increase, out_decrease, S0, S1, S2, S3, result);
REGISTER_RESULT: register_component port map(result, clk, reset, final_result);
CONTROL: CONTROL_component port map(S0in, S1in, S2in, S3in, S4in, S5in, en_right_in, cout_adder, cout_increase, remainder, S0, S1, S2, S3, select_mux_single_op, select_mux_register, en_right_out, overflow, error_division);

end Behavioral;
