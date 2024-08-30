library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM32x24_COM is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24_COM;

architecture Behavioral of ROM32x24_COM is
    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
    constant ROM : tROM :=(
        x"808101", -- mov     0x1020, w1  ; INW0=7fff
        x"808112", --mov     0x1022, w2  ; INW1=0001
        x"408182",-- add     w1, w2, w3  ; w3 = w1 + w2, C = 0, Z = 0, N = 0, OV = 0
        x"508202",-- sub     w1, w2, w4  ; w4 = w1 - w2, C = 1, Z = 0, N = 1, OV = 0
        x"608282",-- and     w1, w2, w5  ; w5 = w1 & w2, C = -, Z = 0, N = 0, OV = -
        x"708302",-- ior     w1, w2, w6  ; w6 = w1 | w2, C = -, Z = 0, N = 1, OV = -
        x"EA8382",--com     w2, w7      ; w7 = ~w2, C = 1, Z = 0, N = 1, OV = 0
        x"888121",--mov     w1, 0x1024
        x"888122",--mov     w2, 0x1024
        x"888123",--mov     w3, 0x1024
        x"888124",--mov     w4, 0x1024
        x"888125",--mov     w5, 0x1024
        x"888126",--mov     w6, 0x1024
        x"888127",--mov     w7, 0x1024
        x"37FFF1",-- bra     LOOP        ; jump back to LOOP
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
