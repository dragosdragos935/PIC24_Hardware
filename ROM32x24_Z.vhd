----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:13 08/25/2024 
-- Design Name: 
-- Module Name:    ROM32x24_Z - Behavioral 
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

entity ROM32x24_Z is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24_Z;

architecture Behavioral of ROM32x24_Z is
    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
        constant ROM : tROM :=(  --    LOOP:
					  x"808101", -- 37FFEF    mov 0x1020, w1 ;INW0=ffff
					  x"808112", -- 888126    mov 0x1022, w2 ;INW1=0001
					  x"408182", -- 888125    add w1,w2,w3 ;0000, Z=1
					  x"410382", -- 888124    add w2,w2,w7 ;0002, Z=0
					  x"510202", -- 888123    sub w2,w2,w4 ;0000, Z=1
					  x"520202", -- 888122    sub w4,w2,w4 ;ffff, Z=0
					  x"608283", -- 888121    and w1,w3,w5 ;0000, Z=1
					  x"608281", -- 708302    and w1,w1,w5 ;ffff Z=0
					  x"718303", -- 718303    ior w3,w3,w6 ;0000 Z=1
					  x"708302", -- 608281    ior w1,w2,w6 ;FFFF Z=0
					  x"888121", -- 608283    mov w1, 0x1024
					  x"888122", -- 520202    mov w2, 0x1024
					  x"888123", -- 510202    mov w3, 0x1024
					  x"888124", -- 410382    mov w4, 0x1024
					  x"888125", -- 408182    mov w5, 0x1024
					  x"888126", -- 808112    mov w6, 0x1024
					  x"37FFEF", -- 808101    bra LOOP
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