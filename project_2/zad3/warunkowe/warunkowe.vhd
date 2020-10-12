library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity warunkowe is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC);
end warunkowe;

architecture Behavioral of warunkowe is

begin

y <= '0' when (x = "011" or x = "100" or x = "110" or x = "111")
         else '1';


end Behavioral;
