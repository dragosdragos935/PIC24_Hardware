library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM32x24_BTST is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24_BTST;

architecture Behavioral of ROM32x24_BTST is
    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
    constant ROM : tROM :=(
        x"808101",-- MOV 0x1020, W1 
        x"808112",--MOV 0x1022, W2 
        x"A5B801",-- BTST.Z W1, W7   
        x"888121",--MOV W1, 0x1024    
        x"888122",--MOV W2, 0x1024 
        x"888127",--MOV W7, 0x1024 
        x"37FFF9",-- BRA 0x2B8 
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
        x"000000",
		  x"000000"
    );
begin
    Data <= ROM(conv_integer(Addr));
end Behavioral;
