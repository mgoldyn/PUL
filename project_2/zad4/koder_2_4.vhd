library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity koder_2_4 is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (1 downto 0));
end koder_2_4;

architecture Behavioral of koder_2_4 is

    begin
        with x select
             y <= "00" when "0001",
                  "01" when "0010",
                  "10" when "0100",
                  "11" when "1000",
                  "WW" when others;
end Behavioral;
