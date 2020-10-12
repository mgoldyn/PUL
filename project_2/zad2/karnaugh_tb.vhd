library ieee;
use ieee.std_logic_1164.all;

entity tb_Karnaugh is
end tb_Karnaugh;

architecture tb of tb_Karnaugh is
component Karnaugh
    port (x : in std_logic_vector (2 downto 0);
          y : out std_logic);
end component;

signal x : std_logic_vector (2 downto 0);
signal y : std_logic;

begin

    dut : Karnaugh
    port map (x => x,
              y => y);
              
    simulation : process
    begin
        x <= (others => '0');
        wait for 100 ns;
        x <= "001";
        wait for 100 ns;
        x <= "010";
        wait for 100 ns;
        x <= "011";
        wait for 100 ns;
        x <= "100";
        wait for 100 ns;
        x <= "101";
        wait for 100 ns;
        x <= "110";
        wait for 100 ns;
        x <= "111";
        wait;
    end process;

end tb;