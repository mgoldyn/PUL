library ieee;
use ieee.std_logic_1164.all;

entity tb_koder_2_4 is
end tb_koder_2_4;

architecture tb of tb_koder_2_4 is

    component koder_2_4
        port (x : in std_logic_vector (3 downto 0);
              y : out std_logic_vector (1 downto 0));
    end component;

    signal x : std_logic_vector (3 downto 0);
    signal y : std_logic_vector (1 downto 0);

begin
    dut : koder_2_4
    port map (x => x,
              y => y);

    simulation : process
    begin
        x <= ("0001");
        wait for 100 ns;
        x <= ("0010");
        wait for 100 ns;
        x <= ("0100");
        wait for 100 ns;
        x <= ("1000");
        wait for 100 ns;
        x <= ("1001");
        wait;
    end process;

end tb;