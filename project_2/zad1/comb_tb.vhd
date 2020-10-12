library ieee;
use ieee.std_logic_1164.all;

entity tb_comb is
end tb_comb;

architecture tb of tb_comb is

component comb

port (X0 : in std_logic;
      X1 : in std_logic;
      Y0 : out std_logic;
      Y1 : out std_logic;
      Y2 : out std_logic;
      Y3 : out std_logic);
end component;

signal X0 : std_logic;
signal X1 : std_logic;
signal Y0 : std_logic;
signal Y1 : std_logic;
signal Y2 : std_logic;
signal Y3 : std_logic;

begin
    dut : comb
    port map (X0 => X0,
              X1 => X1,
              Y0 => Y0,
              Y1 => Y1,
              Y2 => Y2,
              Y3 => Y3);

sim : process
begin
    X0 <= '0';
    X1 <= '0';
    wait for 100 ns;
    X0 <= '1';
    X1 <= '0';
    wait for 100 ns;
    X0 <= '0';
    X1 <= '1';
    wait for 100 ns;
    X0 <= '1';
    X1 <= '1';
    wait;
end process;

end tb;
