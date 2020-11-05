library ieee;
use ieee.std_logic_1164.all;
entity sm_tb is
end sm_tb;
architecture behavior of sm_tb is
component sm
Port ( I     : in STD_LOGIC;
       O     : out STD_LOGIC;
       CLK   : in STD_LOGIC;
       RESET : in STD_LOGIC);
end component;

signal I     : std_logic := '0';
signal O     : std_logic := '0';
signal RESET : std_logic := '0';
signal CLK   : std_logic := '0';

constant CLK_period : time := 10 ns;
begin
uut: sm port map (
I => I,
O => O,
CLK => CLK,
RESET => RESET
);

CLK_process :process
begin
    CLK <= '0';
wait for CLK_period/2;
    CLK <= '1';
wait for CLK_period/2;
end process;


stim_proc: process
begin
RESET <= '1';
wait for CLK_period * 2;
RESET <= '0';
I <= '0';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '0';
wait for CLK_period;

I <= '0';
wait for CLK_period;
I <= '0';
wait for CLK_period;

I <= '0';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '0';
wait for CLK_period;

I <= '0';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '1';
wait for CLK_period;

I <= '0';
wait for CLK_period;
I <= '0';
wait for CLK_period;
I <= '0';
wait for CLK_period;
I <= '0';
wait for CLK_period;

I <= '1';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '1';
wait for CLK_period;
I <= '1';
wait for CLK_period;

wait;
end process;
end;
