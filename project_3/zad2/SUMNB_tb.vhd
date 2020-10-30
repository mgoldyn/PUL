library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SUMNB_tb is
generic (n: natural := 8);
end SUMNB_tb;

architecture tb of SUMNB_tb is

    component SUMNB
        port (Cin  : in std_logic;
              Cout : out std_logic;
              A    : in std_logic_vector (n-1 downto 0);
              B    : in std_logic_vector (n-1 downto 0);
              Y    : out std_logic_vector (n-1 downto 0));
    end component;

    signal Cin  : std_logic;
    signal Cout : std_logic;
    signal A    : std_logic_vector (n-1 downto 0);
    signal B    : std_logic_vector (n-1 downto 0);
    signal Y    : std_logic_vector (n-1 downto 0);
    signal temp : std_logic;
begin

    dut : SUMNB
    port map (Cin  => Cin,
              Cout => Cout,
              A    => A,
              B    => B,
              Y    => Y);

    sim : process
    begin
        Cin <= '0';
        temp <= '0';
        A <= (others => '0');
        B <= (others => '0');
        wait for 10 ns;
        for h in 0 to 1 loop
            for i in 0 to 255 loop
                A <= std_logic_vector(unsigned(A) + 1);
                for j in 0 to 255 loop
                    B <= std_logic_vector(unsigned(B) + 1);
                    wait for 10 ns;
                end loop;
            end loop;
            Cin <= '1';
        end loop; 

        wait;
    end process;

end tb;
