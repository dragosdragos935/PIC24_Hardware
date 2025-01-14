--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : ISE
--  /   /         Filename : tbw_BRAC.vhw
-- /___/   /\     Timestamp : Sun Aug 25 23:27:16 2024
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tbw_BRAC
--Device: Xilinx
--

library UNISIM;
use UNISIM.Vcomponents.ALL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY tbw_BRAC IS
END tbw_BRAC;

ARCHITECTURE testbench_arch OF tbw_BRAC IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT PIC24
        PORT (
            Clk : In std_logic;
            INW0 : In std_logic_vector (15 DownTo 0);
            INW1 : In std_logic_vector (15 DownTo 0);
            OUTW0 : Out std_logic_vector (15 DownTo 0)
        );
    END COMPONENT;

    SIGNAL Clk : std_logic := '0';
    SIGNAL INW0 : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL INW1 : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL OUTW0 : std_logic_vector (15 DownTo 0) := "0000000000000000";

    constant PERIOD : time := 50 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : PIC24
        PORT MAP (
            Clk => Clk,
            INW0 => INW0,
            INW1 => INW1,
            OUTW0 => OUTW0
        );

        PROCESS    -- clock process for Clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                Clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                Clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                INW0 <= "1111111111111111";
                INW1 <= "0000000000000001";
                -- -------------------------------------
                WAIT FOR 950 ns;

            END PROCESS;

    END testbench_arch;

