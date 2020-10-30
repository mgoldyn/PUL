library ieee;
use ieee.std_logic_1164.all;

entity tb_MUL4X4 is
end tb_MUL4X4;

architecture tb of tb_MUL4X4 is

    component MUL4X4
        port (a : in std_logic_vector (3 downto 0);
              b : in std_logic_vector (3 downto 0);
              y : out std_logic_vector (7 downto 0));
    end component;

    signal a : std_logic_vector (3 downto 0);
    signal b : std_logic_vector (3 downto 0);
    signal y : std_logic_vector (7 downto 0);

begin

    dut : MUL4X4
    port map (a => a,
              b => b,
              y => y);

    sim : process
    begin
        a <= (others => '0');
        b <= (others => '0');
        wait for 10 ns;
        
        a <= "1101";
        b <= "0101";
        wait for 10 ns;
        
        a <= ("1111");
        b <= ("1111");
        wait for 10 ns;
        
    end process;

end tb;