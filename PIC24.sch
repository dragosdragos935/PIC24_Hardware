VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1(5:0)
        SIGNAL Clk
        SIGNAL PC(5:0)
        SIGNAL Instr(23:19)
        SIGNAL Instr(10:7)
        SIGNAL WrData(15:0)
        SIGNAL DestReg(3:0)
        SIGNAL Instr(3:0)
        SIGNAL Instr(18:15)
        SIGNAL BaseData(15:0)
        SIGNAL SrcData(15:0)
        SIGNAL INW0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL Instr(8:4)
        SIGNAL MEMOut(15:0)
        SIGNAL OUTW0(15:0)
        SIGNAL ALUOut(15:0)
        SIGNAL MemWr
        SIGNAL Mem2Reg
        SIGNAL RegWr
        SIGNAL DestSel
        SIGNAL Branch_S
        SIGNAL N_EN_S
        SIGNAL OV_EN_S
        SIGNAL Z_EN_S
        SIGNAL C_EN_S
        SIGNAL ALUOP(2:0)
        SIGNAL N_S
        SIGNAL OV_S
        SIGNAL Z_S
        SIGNAL C_S
        SIGNAL Instr(4:0)
        SIGNAL Instr(18:16)
        SIGNAL PC(5:1)
        SIGNAL Instr(23:0)
        PORT Input Clk
        PORT Input INW0(15:0)
        PORT Input INW1(15:0)
        PORT Output OUTW0(15:0)
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2024 8 25 17 44 26
            RECTANGLE N 64 -512 400 0 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 400 -492 464 -468 
            LINE N 400 -480 464 -480 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgramCounter
            TIMESTAMP 2024 8 25 17 47 6
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V4
            TIMESTAMP 2024 8 25 17 50 30
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2024 8 25 17 52 8
            RECTANGLE N 64 -384 384 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 384 -364 448 -340 
            LINE N 384 -352 448 -352 
            RECTANGLE N 384 -44 448 -20 
            LINE N 384 -32 448 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2024 8 30 17 5 56
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 320 -544 384 -544 
            LINE N 320 -416 384 -416 
            LINE N 320 -288 384 -288 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ControlUnit
            TIMESTAMP 2024 8 25 19 28 50
            RECTANGLE N 64 -704 352 0 
            RECTANGLE N 0 -684 64 -660 
            LINE N 64 -672 0 -672 
            LINE N 352 -672 416 -672 
            LINE N 352 -608 416 -608 
            LINE N 352 -544 416 -544 
            LINE N 352 -480 416 -480 
            LINE N 352 -352 416 -352 
            LINE N 352 -288 416 -288 
            LINE N 352 -224 416 -224 
            LINE N 352 -160 416 -160 
            LINE N 352 -96 416 -96 
            RECTANGLE N 352 -44 416 -20 
            LINE N 352 -32 416 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2024 8 25 17 57 0
            RECTANGLE N 64 -384 368 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 368 -364 432 -340 
            LINE N 368 -352 432 -352 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 -32 432 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2024 8 25 17 58 24
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x24_COM
            TIMESTAMP 2024 8 28 19 38 48
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK U_PC_Update PC_Update
            PIN N N_S
            PIN OV OV_S
            PIN Z Z_S
            PIN C C_S
            PIN Branch Branch_S
            PIN PC(5:0) PC(5:0)
            PIN Offset(4:0) Instr(4:0)
            PIN BranchType(2:0) Instr(18:16)
            PIN New_PC(5:0) XLXN_1(5:0)
        END BLOCK
        BEGIN BLOCK U_ProgramCounter ProgramCounter
            PIN Clk Clk
            PIN New_PC(5:0) XLXN_1(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK U_MUXDEST MUX2V4
            PIN Sel DestSel
            PIN I0(3:0) Instr(10:7)
            PIN I1(3:0) Instr(3:0)
            PIN Y(3:0) DestReg(3:0)
        END BLOCK
        BEGIN BLOCK U_File_Regs File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdReg1(3:0) Instr(18:15)
            PIN RdReg2(3:0) Instr(3:0)
            PIN WrReg(3:0) DestReg(3:0)
            PIN WrData(15:0) WrData(15:0)
            PIN RdData1(15:0) BaseData(15:0)
            PIN RdData2(15:0) SrcData(15:0)
        END BLOCK
        BEGIN BLOCK U_ALU ALU
            PIN Clk Clk
            PIN N_EN N_EN_S
            PIN OV_EN OV_EN_S
            PIN Z_EN Z_EN_S
            PIN C_EN C_EN_S
            PIN RdData1(15:0) BaseData(15:0)
            PIN RdData2(15:0) SrcData(15:0)
            PIN ALUOP(2:0) ALUOP(2:0)
            PIN lit5(4:0) Instr(4:0)
            PIN N N_S
            PIN OV OV_S
            PIN Z Z_S
            PIN C C_S
            PIN Y(15:0) ALUOut(15:0)
        END BLOCK
        BEGIN BLOCK U_ControlUnit ControlUnit
            PIN OPCODE(4:0) Instr(23:19)
            PIN MemWr MemWr
            PIN Mem2Reg Mem2Reg
            PIN RegWr RegWr
            PIN DestSel DestSel
            PIN Branch Branch_S
            PIN N_EN N_EN_S
            PIN OV_EN OV_EN_S
            PIN Z_EN Z_EN_S
            PIN C_EN C_EN_S
            PIN ALUOP(2:0) ALUOP(2:0)
        END BLOCK
        BEGIN BLOCK U_DataMem DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) INW0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) SrcData(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) MEMOut(15:0)
        END BLOCK
        BEGIN BLOCK U_MUX_Wr_MEM_ALU MUX2V16
            PIN Sel Mem2Reg
            PIN I0(15:0) ALUOut(15:0)
            PIN I1(15:0) MEMOut(15:0)
            PIN Y(15:0) WrData(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 ROM32x24_COM
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        BEGIN INSTANCE U_PC_Update 784 976 M0
        END INSTANCE
        BEGIN INSTANCE U_ProgramCounter 352 1280 R0
        END INSTANCE
        BEGIN BRANCH XLXN_1(5:0)
            WIRE 304 496 320 496
            WIRE 304 496 304 1248
            WIRE 304 1248 352 1248
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 176 1184 352 1184
        END BRANCH
        IOMARKER 176 1184 Clk R180 28
        BEGIN BRANCH PC(5:0)
            WIRE 736 1184 880 1184
            WIRE 880 1184 1088 1184
            BEGIN DISPLAY 880 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(5:0)
            WIRE 784 816 928 816
            WIRE 928 816 1136 816
            BEGIN DISPLAY 928 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ControlUnit 368 2336 R0
        END INSTANCE
        BEGIN BRANCH Instr(23:19)
            WIRE 192 1664 240 1664
            WIRE 240 1664 368 1664
            BEGIN DISPLAY 240 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUXDEST 1472 2320 R0
            BEGIN DISPLAY 0 -312 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH DestReg(3:0)
            WIRE 1856 2160 1904 2160
            WIRE 1904 2160 2016 2160
            BEGIN DISPLAY 1904 2160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(3:0)
            WIRE 1312 2288 1360 2288
            WIRE 1360 2288 1472 2288
            BEGIN DISPLAY 1360 2288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(10:7)
            WIRE 1312 2224 1344 2224
            WIRE 1344 2224 1472 2224
            BEGIN DISPLAY 1344 2224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DestSel
            WIRE 1312 2160 1376 2160
            WIRE 1376 2160 1472 2160
            BEGIN DISPLAY 1376 2160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_File_Regs 1456 1760 R0
        END INSTANCE
        BEGIN BRANCH WrData(15:0)
            WIRE 1280 1728 1328 1728
            WIRE 1328 1728 1456 1728
            BEGIN DISPLAY 1328 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DestReg(3:0)
            WIRE 1280 1664 1328 1664
            WIRE 1328 1664 1456 1664
            BEGIN DISPLAY 1328 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(3:0)
            WIRE 1280 1600 1344 1600
            WIRE 1344 1600 1456 1600
            BEGIN DISPLAY 1344 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(18:15)
            WIRE 1280 1536 1344 1536
            WIRE 1344 1536 1456 1536
            BEGIN DISPLAY 1344 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 1280 1472 1376 1472
            WIRE 1376 1472 1456 1472
            BEGIN DISPLAY 1376 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 1280 1408 1344 1408
            WIRE 1344 1408 1456 1408
            BEGIN DISPLAY 1344 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BaseData(15:0)
            WIRE 1904 1408 1968 1408
            WIRE 1968 1408 2080 1408
            BEGIN DISPLAY 1968 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SrcData(15:0)
            WIRE 1904 1728 1968 1728
            WIRE 1968 1728 2064 1728
            BEGIN DISPLAY 1968 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ALU 2704 2112 R0
        END INSTANCE
        BEGIN INSTANCE U_DataMem 3536 1904 R0
        END INSTANCE
        BEGIN INSTANCE U_MUX_Wr_MEM_ALU 3216 2560 R0
            BEGIN DISPLAY 0 -312 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Clk
            WIRE 2528 1568 2592 1568
            WIRE 2592 1568 2704 1568
            BEGIN DISPLAY 2592 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_EN_S
            WIRE 2528 1632 2576 1632
            WIRE 2576 1632 2704 1632
            BEGIN DISPLAY 2576 1632 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_EN_S
            WIRE 2544 1696 2576 1696
            WIRE 2576 1696 2704 1696
            BEGIN DISPLAY 2576 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_EN_S
            WIRE 2528 1760 2624 1760
            WIRE 2624 1760 2704 1760
            BEGIN DISPLAY 2624 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_EN_S
            WIRE 2528 1824 2576 1824
            WIRE 2576 1824 2704 1824
            BEGIN DISPLAY 2576 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BaseData(15:0)
            WIRE 2528 1888 2576 1888
            WIRE 2576 1888 2704 1888
            BEGIN DISPLAY 2576 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SrcData(15:0)
            WIRE 2528 1952 2560 1952
            WIRE 2560 1952 2704 1952
            BEGIN DISPLAY 2560 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2528 2016 2576 2016
            WIRE 2576 2016 2704 2016
            BEGIN DISPLAY 2576 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 2528 2080 2560 2080
            WIRE 2560 2080 2704 2080
            BEGIN DISPLAY 2560 2080 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOut(15:0)
            WIRE 3088 2080 3168 2080
            WIRE 3168 2080 3280 2080
            BEGIN DISPLAY 3168 2080 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_S
            WIRE 3088 1952 3120 1952
            WIRE 3120 1952 3264 1952
            BEGIN DISPLAY 3120 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_S
            WIRE 3088 1824 3120 1824
            WIRE 3120 1824 3280 1824
            BEGIN DISPLAY 3120 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_S
            WIRE 3088 1696 3120 1696
            WIRE 3120 1696 3280 1696
            BEGIN DISPLAY 3120 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_S
            WIRE 3088 1568 3200 1568
            WIRE 3200 1568 3280 1568
            BEGIN DISPLAY 3200 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 3376 1552 3456 1552
            WIRE 3456 1552 3536 1552
            BEGIN DISPLAY 3456 1552 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 3392 1616 3456 1616
            WIRE 3456 1616 3536 1616
            BEGIN DISPLAY 3456 1616 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH INW0(15:0)
            WIRE 3280 976 3280 992
            WIRE 3280 976 3360 976
            WIRE 3360 976 3360 992
            WIRE 3344 992 3360 992
            WIRE 3344 992 3344 1680
            WIRE 3344 1680 3392 1680
            WIRE 3392 1680 3536 1680
        END BRANCH
        BEGIN BRANCH INW1(15:0)
            WIRE 3360 1728 3424 1728
            WIRE 3424 1728 3424 1744
            WIRE 3424 1744 3536 1744
            WIRE 3360 1728 3360 1744
            WIRE 3360 1744 3408 1744
            WIRE 3408 1008 3408 1024
            WIRE 3408 1024 3408 1744
        END BRANCH
        BEGIN BRANCH Instr(8:4)
            WIRE 3408 1808 3440 1808
            WIRE 3440 1808 3536 1808
            BEGIN DISPLAY 3440 1808 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SrcData(15:0)
            WIRE 3392 1872 3424 1872
            WIRE 3424 1872 3536 1872
            BEGIN DISPLAY 3424 1872 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MEMOut(15:0)
            WIRE 3968 1872 4016 1872
            WIRE 4016 1872 4128 1872
            BEGIN DISPLAY 4016 1872 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUTW0(15:0)
            WIRE 3968 1552 4128 1552
            WIRE 4128 1552 4144 1552
            WIRE 4144 960 4144 1552
            WIRE 4144 960 4512 960
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 3600 2400 3664 2400
            WIRE 3664 2400 3824 2400
            BEGIN DISPLAY 3664 2400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 3072 2400 3120 2400
            WIRE 3120 2400 3216 2400
            BEGIN DISPLAY 3120 2400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOut(15:0)
            WIRE 3072 2464 3088 2464
            WIRE 3088 2464 3216 2464
            BEGIN DISPLAY 3088 2464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MEMOut(15:0)
            WIRE 3056 2528 3088 2528
            WIRE 3088 2528 3216 2528
            BEGIN DISPLAY 3088 2528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 784 1664 832 1664
            WIRE 832 1664 896 1664
            BEGIN DISPLAY 832 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 784 1728 800 1728
            WIRE 800 1728 896 1728
            BEGIN DISPLAY 800 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 784 1792 848 1792
            WIRE 848 1792 880 1792
            BEGIN DISPLAY 848 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DestSel
            WIRE 784 1856 832 1856
            WIRE 832 1856 880 1856
            BEGIN DISPLAY 832 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch_S
            WIRE 784 1984 832 1984
            WIRE 832 1984 880 1984
            BEGIN DISPLAY 832 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_EN_S
            WIRE 784 2048 832 2048
            WIRE 832 2048 880 2048
            BEGIN DISPLAY 832 2048 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_EN_S
            WIRE 784 2112 848 2112
            WIRE 848 2112 880 2112
            BEGIN DISPLAY 848 2112 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_EN_S
            WIRE 784 2176 848 2176
            WIRE 848 2176 896 2176
            BEGIN DISPLAY 848 2176 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_EN_S
            WIRE 784 2240 848 2240
            WIRE 848 2240 896 2240
            BEGIN DISPLAY 848 2240 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 784 2304 864 2304
            WIRE 864 2304 912 2304
            BEGIN DISPLAY 864 2304 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_S
            WIRE 784 496 864 496
            WIRE 864 496 960 496
            BEGIN DISPLAY 864 496 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_S
            WIRE 784 560 864 560
            WIRE 864 560 960 560
            BEGIN DISPLAY 864 560 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_S
            WIRE 784 624 848 624
            WIRE 848 624 880 624
            WIRE 880 624 960 624
            BEGIN DISPLAY 848 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_S
            WIRE 784 688 864 688
            WIRE 864 688 976 688
            BEGIN DISPLAY 864 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch_S
            WIRE 784 752 880 752
            WIRE 880 752 976 752
            BEGIN DISPLAY 880 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 784 880 912 880
            WIRE 912 880 1120 880
            BEGIN DISPLAY 912 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(18:16)
            WIRE 784 944 912 944
            WIRE 912 944 1104 944
            BEGIN DISPLAY 912 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 3280 992 INW0(15:0) R90 28
        IOMARKER 3408 1008 INW1(15:0) R270 28
        IOMARKER 4512 960 OUTW0(15:0) R0 28
        BEGIN BRANCH PC(5:1)
            WIRE 1840 544 1904 544
            WIRE 1904 544 2032 544
            BEGIN DISPLAY 1904 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(23:0)
            WIRE 2416 544 2512 544
            WIRE 2512 544 2640 544
            BEGIN DISPLAY 2512 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_8 2032 576 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
