----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:34 08/25/2024 
-- Design Name: 
-- Module Name:    ROM32x24 - Behavioral 
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

entity ROM32x24_FBCL is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24_FBCL;

architecture Behavioral of ROM32x24_FBCL is
    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
        constant ROM : tROM :=( 
					  x"808101", --MOV 0x1020, W1  
					  x"808112", -- MOV 0x1022, W2 
					  x"408182", --ADD W1, W2, W3   
					  x"508202", -- SUB W1, W2, W4 
					  x"608282", -- AND W1, W2, W5    
					  x"708302", -- IOR W1, W2, W6   
					  x"DF0382", --FBCL W2, W7 C =1 if bit is found else is 0.  
					  x"888121",--MOV W1, 0x1024
					  x"888122",--MOV W2, 0x1024
					  x"888123",--MOV W3, 0x1024
					  x"888124",--MOV W4, 0x1024
					  x"888125",--MOV W5, 0x1024
					  x"888126",--MOV W6, 0x1024
					  x"888127",--MOV W7, 0x1024
					  x"37FFF1",-- BRA 0x2B8 
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