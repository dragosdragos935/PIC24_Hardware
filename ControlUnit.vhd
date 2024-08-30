----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:42 08/25/2024 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
    Port ( OPCODE : in  STD_LOGIC_VECTOR (4 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (2 downto 0);
           MemWr : out  STD_LOGIC;
           Mem2Reg : out  STD_LOGIC;
           RegWr : out  STD_LOGIC;
           DestSel : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           N_EN : out  STD_LOGIC;
           OV_EN : out  STD_LOGIC;
           Z_EN : out  STD_LOGIC;
           C_EN : out  STD_LOGIC
			  );
end ControlUnit;

architecture Behavioral of ControlUnit is

begin


DestSel <= '1' when OPCODE = "10000" else '0'; -- MOV f, Wnd
Mem2Reg <= '1' when OPCODE = "10000" else '0'; -- MOV f, Wnd
Branch <= '1' when OPCODE = "00110" else '0';  -- BRA
MemWr <= '1' when OPCODE = "10001" else '0';   -- MOV Wns, f
RegWr <= '0' when (OPCODE = "00110" or OPCODE = "10001") -- BRA
				else '1';												-- MOV Wns, f

N_EN <= '1' when (OPCODE = "01000" or -- ADD
						OPCODE = "01010" or -- SUB
						OPCODE = "01100" or -- AND
						OPCODE = "01110" or -- IOR
						OPCODE = "01101" or --XOR
						OPCODE = "11101" --COM
						) else '0';

OV_EN <= '1' when (OPCODE = "01000" or -- ADD
						 OPCODE = "01010" -- SUB
						
						) else '0';

Z_EN <= '1' when (OPCODE = "01000" or -- ADD
						OPCODE = "01010" or -- SUB
						OPCODE = "01100" or -- AND
						OPCODE = "01110" or -- IOR
						OPCODE = "01101" or --xor
						OPCODE = "10101" or --btst
						OPCODE = "11101" --com
						
						) else '0';
						
C_EN <= '1' when (OPCODE = "01000" or -- ADD
						OPCODE = "01010" or -- SUB
						OPCODE = "11011" --FBCL
						) else '0';

with OPCODE select
	ALUOP <= "000" when "01000", -- ADD
				"001" when "01010", -- SUB
				"010" when "01100", -- AND
				"011" when "01110", -- IOR
				"100" when "11101", -- COM
				"101" when "01101", -- XOR
				"110" when "10101", -- BTST
				"111" when "11011", -- FBCL
				"ZZZ" when others;

end Behavioral;

