library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplex is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC);
end multiplex;

architecture Behavioral of multiplex is

begin

    with sel select
        y <= x(0) when "000",
             x(1) when "001",
             x(2) when "010",
             x(3) when "011",
             x(4) when "100",
             x(5) when "101",
             x(6) when "110",
             x(7) when others;
             
end Behavioral;
