library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity selekt is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC);
end selekt;

architecture Behavioral of selekt is
    begin
        with x select
             y <= '0' when "011" | "100" | "110" | "111",
                  '1' when others;
end Behavioral;
