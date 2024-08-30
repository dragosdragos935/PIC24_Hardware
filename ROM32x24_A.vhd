----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:47 08/25/2024 
-- Design Name: 
-- Module Name:    ROM32x24_A - Behavioral 
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

entity ROM32x24_A is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24_A;

architecture Behavioral of ROM32x24_A is
    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
        constant ROM : tROM :=(   --	LOOP:
					  x"808101",  -- 808101     mov     0x1020, w1  ;INW0=aaab 
					  x"808112",  -- 808112     mov     0x1022, w2  ;INW1=5555
					  x"408182",  -- 408182     add     w1,w2,w3    ;0000
					  x"508202",  -- 508202     sub     w1,w2,w4    ;5556
					  x"608282",  -- 608282     and     w1,w2,w5    ;0001
					  x"708302",  -- 708302     ior     w1,w2,w6    ;FFFF
					  x"888121",  -- 888121     mov     w1, 0x1024
					  x"888122",  -- 888122     mov     w2, 0x1024
					  x"888123",  -- 888123     mov     w3, 0x1024
					  x"888124",  -- 888124     mov     w4, 0x1024
					  x"888125",  -- 888125     mov     w5, 0x1024
					  x"888126",  -- 888126     mov     w6, 0x1024
					  x"37FFF3",  -- 37FFF3     bra     LOOP
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000",  --
					  x"000000"   --
					  );


begin

    Data <= ROM(conv_integer(Addr));

end Behavioral;


