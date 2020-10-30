library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.stop;

entity SUM1B_tb is
end SUM1B_tb;

architecture tb of SUM1B_tb is
    component SUM1B
        port (A    : in std_logic;
              B    : in std_logic;
              Cin  : in std_logic;
              Cout : out std_logic;
              Y    : out std_logic);
    end component;

    signal A    : std_logic;
    signal B    : std_logic;
    signal Cin  : std_logic;
    signal Cout : std_logic;
    signal Y    : std_logic;

begin
    dut : SUM1B
    port map (A    => A,
              B    => B,
              Cin  => Cin,
              Cout => Cout,
              Y    => Y);

    sim : process
    begin
        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 10 ns;
        
        A <= '0';
        B <= '1';
        wait for 10 ns;
        
        A <= '1';
        B <= '0';
        wait for 10 ns;
        
        A <= '1';
        B <= '1';
        wait for 10 ns;
        
        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 10 ns;
        
        A <= '0';
        B <= '1';
        wait for 10 ns;
        
        A <= '1';
        B <= '0';
        wait for 10 ns;
        
        A <= '1';
        B <= '1';
        wait for 10 ns;
        stop;
    end process;

end tb;
