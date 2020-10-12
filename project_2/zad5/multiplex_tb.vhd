library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_multiplex is
end tb_multiplex;

architecture tb of tb_multiplex is

    component multiplex
        port (x   : in std_logic_vector (7 downto 0);
              sel : in std_logic_vector (2 downto 0);
              y   : out std_logic);
    end component;

    signal x   : std_logic_vector (7 downto 0);
    signal sel : std_logic_vector (2 downto 0);
    signal y   : std_logic;

begin

    dut : multiplex
    port map (x   => x,
              sel => sel,
              y   => y);

    simulation : process
    begin

        x <= "10101010";
        
        for i in 0 to 7 loop
            sel <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        
        x <= "01010101";
        
        for i in 0 to 7 loop
            sel <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        wait;
    end process;

end tb;