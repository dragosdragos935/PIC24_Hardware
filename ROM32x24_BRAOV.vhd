----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:16 08/25/2024 
-- Design Name: 
-- Module Name:    ROM32x24_BRAOV - Behavioral 
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

entity ROM32x24_BRAOV is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24_BRAOV;

architecture Behavioral of ROM32x24_BRAOV is
    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
        constant ROM : tROM :=(   --  		  LOOP:
					  x"808101",  -- 808101     mov 0x1020, w1 ;INW0=7fff
					  x"808112",  -- 808112     mov 0x1022, w2 ;INW1=0001
					  x"410382",  -- 410382     add w2,w2,w7 ; OV = 0
					  x"300002",  -- 300002     BRA OV, STOP ; no jump
					  x"408182",  -- 408182     add w1,w2,w3 ; OV = 1
					  x"300001",  -- 300001     bra OV, END ; jump to END
					  x"37FFFF",  -- 37FFFF     STOP: bra STOP ; infinite loop
					  x"37FFF8",  -- 37FFF8     END: bra LOOP ;return to start
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