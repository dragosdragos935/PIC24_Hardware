----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:55 08/25/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( Clk : in  STD_LOGIC;
           RdData1 : in  STD_LOGIC_VECTOR (15 downto 0);
           RdData2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
			  
           N_EN : in STD_LOGIC;
           OV_EN : in STD_LOGIC;
           Z_EN : in STD_LOGIC;
           C_EN : in STD_LOGIC;
			  
           N : out STD_LOGIC;
           OV : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
			  
           lit5 : in STD_LOGIC_VECTOR (4 downto 0)
          );
end ALU;

architecture Behavioral of ALU is
    signal result : STD_LOGIC_VECTOR (16 downto 0);
	
    signal N_temp : STD_LOGIC;
    signal OV_temp : STD_LOGIC;
    signal Z_temp : STD_LOGIC;
    signal C_temp : STD_LOGIC;
	
    signal com_s : STD_LOGIC_VECTOR(15 downto 0);
    signal s_lit5 : STD_LOGIC_VECTOR(4 downto 0);

begin	

    
    s_lit5 <= lit5;
    --com
    com_s <= not RdData2;
	
    -- ALU Operation Select
    with ALUOP select
        result <= ('0'&RdData1) + ('0'&RdData2) when "000",   -- ADD
                  ('0'&RdData1) - ('1'&RdData2) when "001",   -- SUB
                  ('0'&RdData1) and ('1'&RdData2) when "010", -- AND
                  ('0'&RdData1) or ('1'&RdData2) when "011",  -- IOR
                  ('0'&com_s) when "100",                     -- COM
                  ('0'&(RdData1 xor ("00000000000" & s_lit5))) when "101", -- XOR Wb, #lit5, Wd
                  ('0'&(RdData1 and RdData2)) when "110",     -- BTST.Z Ws, Wb
                  ('0'&(RdData1 and (not RdData2))) when "111", -- FBCL Ws, Wnd
                  "ZZZZZZZZZZZZZZZZZ" when others;
    
    -- Flags Generation
    N_temp <= result(15);
    OV_temp <= '1' when (ALUOP = "000" and RdData1(15) = RdData2(15) and result(15) = (not RdData1(15))) or
                      (ALUOP = "001" and RdData1(15) = (not RdData2(15)) and result(15) = RdData2(15)) 
                      else '0';
    
    Z_temp <= '1' when result(15 downto 0) = x"0000" else '0';
    C_temp <= result(16) when rising_edge(Clk) and C_EN = '1';
    
    -- Enable and Assign Output Flags
    N <= N_temp when rising_edge(Clk) and N_EN = '1';
    OV <= OV_temp when rising_edge(Clk) and OV_EN = '1';
    Z <= Z_temp when rising_edge(Clk) and Z_EN = '1';
    C <= C_temp when rising_edge(Clk) and C_EN = '1';
    
    -- Output result
    Y <= result(15 downto 0);
	
end Behavioral;
