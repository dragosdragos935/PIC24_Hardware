--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : PIC24.vhf
-- /___/   /\     Timestamp : 08/30/2024 20:36:17
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx92i\bin\nt\sch2vhdl.exe -intstyle ise -family spartan3 -flat -suppress -w "C:/Documents and Settings/Administrator/Desktop/pic24final/PIC24/PIC24.sch" PIC24.vhf
--Design Name: PIC24
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PIC24 is
   port ( Clk   : in    std_logic; 
          INW0  : in    std_logic_vector (15 downto 0); 
          INW1  : in    std_logic_vector (15 downto 0); 
          OUTW0 : out   std_logic_vector (15 downto 0));
end PIC24;

architecture BEHAVIORAL of PIC24 is
   signal ALUOP    : std_logic_vector (2 downto 0);
   signal ALUOut   : std_logic_vector (15 downto 0);
   signal BaseData : std_logic_vector (15 downto 0);
   signal Branch_S : std_logic;
   signal C_EN_S   : std_logic;
   signal C_S      : std_logic;
   signal DestReg  : std_logic_vector (3 downto 0);
   signal DestSel  : std_logic;
   signal Instr    : std_logic_vector (23 downto 0);
   signal MEMOut   : std_logic_vector (15 downto 0);
   signal MemWr    : std_logic;
   signal Mem2Reg  : std_logic;
   signal N_EN_S   : std_logic;
   signal N_S      : std_logic;
   signal OV_EN_S  : std_logic;
   signal OV_S     : std_logic;
   signal PC       : std_logic_vector (5 downto 0);
   signal RegWr    : std_logic;
   signal SrcData  : std_logic_vector (15 downto 0);
   signal WrData   : std_logic_vector (15 downto 0);
   signal XLXN_1   : std_logic_vector (5 downto 0);
   signal Z_EN_S   : std_logic;
   signal Z_S      : std_logic;
   component ALU
      port ( Clk     : in    std_logic; 
             N_EN    : in    std_logic; 
             OV_EN   : in    std_logic; 
             Z_EN    : in    std_logic; 
             C_EN    : in    std_logic; 
             RdData1 : in    std_logic_vector (15 downto 0); 
             RdData2 : in    std_logic_vector (15 downto 0); 
             ALUOP   : in    std_logic_vector (2 downto 0); 
             lit5    : in    std_logic_vector (4 downto 0); 
             N       : out   std_logic; 
             OV      : out   std_logic; 
             Z       : out   std_logic; 
             C       : out   std_logic; 
             Y       : out   std_logic_vector (15 downto 0));
   end component;
   
   component ControlUnit
      port ( OPCODE  : in    std_logic_vector (4 downto 0); 
             MemWr   : out   std_logic; 
             Mem2Reg : out   std_logic; 
             RegWr   : out   std_logic; 
             DestSel : out   std_logic; 
             Branch  : out   std_logic; 
             N_EN    : out   std_logic; 
             OV_EN   : out   std_logic; 
             Z_EN    : out   std_logic; 
             C_EN    : out   std_logic; 
             ALUOP   : out   std_logic_vector (2 downto 0));
   end component;
   
   component DataMem
      port ( Clk     : in    std_logic; 
             Wr      : in    std_logic; 
             INW0    : in    std_logic_vector (15 downto 0); 
             INW1    : in    std_logic_vector (15 downto 0); 
             Addr    : in    std_logic_vector (4 downto 0); 
             DataIn  : in    std_logic_vector (15 downto 0); 
             OUTW0   : out   std_logic_vector (15 downto 0); 
             DataOut : out   std_logic_vector (15 downto 0));
   end component;
   
   component File_Regs
      port ( Clk     : in    std_logic; 
             WrEn    : in    std_logic; 
             RdReg1  : in    std_logic_vector (3 downto 0); 
             RdReg2  : in    std_logic_vector (3 downto 0); 
             WrReg   : in    std_logic_vector (3 downto 0); 
             WrData  : in    std_logic_vector (15 downto 0); 
             RdData1 : out   std_logic_vector (15 downto 0); 
             RdData2 : out   std_logic_vector (15 downto 0));
   end component;
   
   component MUX2V4
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (3 downto 0); 
             I1  : in    std_logic_vector (3 downto 0); 
             Y   : out   std_logic_vector (3 downto 0));
   end component;
   
   component MUX2V16
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (15 downto 0); 
             I1  : in    std_logic_vector (15 downto 0); 
             Y   : out   std_logic_vector (15 downto 0));
   end component;
   
   component PC_Update
      port ( N          : in    std_logic; 
             OV         : in    std_logic; 
             Z          : in    std_logic; 
             C          : in    std_logic; 
             Branch     : in    std_logic; 
             PC         : in    std_logic_vector (5 downto 0); 
             Offset     : in    std_logic_vector (4 downto 0); 
             BranchType : in    std_logic_vector (2 downto 0); 
             New_PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ProgramCounter
      port ( Clk    : in    std_logic; 
             New_PC : in    std_logic_vector (5 downto 0); 
             PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ROM32x24_FBCL
      port ( Addr : in    std_logic_vector (4 downto 0); 
             Data : out   std_logic_vector (23 downto 0));
   end component;
   
begin
   U_ALU : ALU
      port map (ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                Clk=>Clk,
                C_EN=>C_EN_S,
                lit5(4 downto 0)=>Instr(4 downto 0),
                N_EN=>N_EN_S,
                OV_EN=>OV_EN_S,
                RdData1(15 downto 0)=>BaseData(15 downto 0),
                RdData2(15 downto 0)=>SrcData(15 downto 0),
                Z_EN=>Z_EN_S,
                C=>C_S,
                N=>N_S,
                OV=>OV_S,
                Y(15 downto 0)=>ALUOut(15 downto 0),
                Z=>Z_S);
   
   U_ControlUnit : ControlUnit
      port map (OPCODE(4 downto 0)=>Instr(23 downto 19),
                ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                Branch=>Branch_S,
                C_EN=>C_EN_S,
                DestSel=>DestSel,
                MemWr=>MemWr,
                Mem2Reg=>Mem2Reg,
                N_EN=>N_EN_S,
                OV_EN=>OV_EN_S,
                RegWr=>RegWr,
                Z_EN=>Z_EN_S);
   
   U_DataMem : DataMem
      port map (Addr(4 downto 0)=>Instr(8 downto 4),
                Clk=>Clk,
                DataIn(15 downto 0)=>SrcData(15 downto 0),
                INW0(15 downto 0)=>INW0(15 downto 0),
                INW1(15 downto 0)=>INW1(15 downto 0),
                Wr=>MemWr,
                DataOut(15 downto 0)=>MEMOut(15 downto 0),
                OUTW0(15 downto 0)=>OUTW0(15 downto 0));
   
   U_File_Regs : File_Regs
      port map (Clk=>Clk,
                RdReg1(3 downto 0)=>Instr(18 downto 15),
                RdReg2(3 downto 0)=>Instr(3 downto 0),
                WrData(15 downto 0)=>WrData(15 downto 0),
                WrEn=>RegWr,
                WrReg(3 downto 0)=>DestReg(3 downto 0),
                RdData1(15 downto 0)=>BaseData(15 downto 0),
                RdData2(15 downto 0)=>SrcData(15 downto 0));
   
   U_MUXDEST : MUX2V4
      port map (I0(3 downto 0)=>Instr(10 downto 7),
                I1(3 downto 0)=>Instr(3 downto 0),
                Sel=>DestSel,
                Y(3 downto 0)=>DestReg(3 downto 0));
   
   U_MUX_Wr_MEM_ALU : MUX2V16
      port map (I0(15 downto 0)=>ALUOut(15 downto 0),
                I1(15 downto 0)=>MEMOut(15 downto 0),
                Sel=>Mem2Reg,
                Y(15 downto 0)=>WrData(15 downto 0));
   
   U_PC_Update : PC_Update
      port map (Branch=>Branch_S,
                BranchType(2 downto 0)=>Instr(18 downto 16),
                C=>C_S,
                N=>N_S,
                Offset(4 downto 0)=>Instr(4 downto 0),
                OV=>OV_S,
                PC(5 downto 0)=>PC(5 downto 0),
                Z=>Z_S,
                New_PC(5 downto 0)=>XLXN_1(5 downto 0));
   
   U_ProgramCounter : ProgramCounter
      port map (Clk=>Clk,
                New_PC(5 downto 0)=>XLXN_1(5 downto 0),
                PC(5 downto 0)=>PC(5 downto 0));
   
   XLXI_6 : ROM32x24_FBCL
      port map (Addr(4 downto 0)=>PC(5 downto 1),
                Data(23 downto 0)=>Instr(23 downto 0));
   
end BEHAVIORAL;


