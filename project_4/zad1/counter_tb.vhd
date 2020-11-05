library ieee;
use ieee.std_logic_1164.all;
entity counter_tb is
end counter_tb;
architecture behavior of counter_tb is
component counter
Port ( SET   : in STD_LOGIC;
       EN    : in STD_LOGIC;
       DIR   : in STD_LOGIC;
       CLK   : in STD_LOGIC;
       RESET : in STD_LOGIC;
       X     : in STD_LOGIC_VECTOR (7 downto 0);
       Y     : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal SET   : std_logic := '0';
signal EN    : std_logic := '0';
signal DIR   : std_logic := '0';
signal RESET : std_logic := '0';
signal CLK   : std_logic := '0';
signal X     : std_logic_vector(7 downto 0) := (others => '0');
signal Y     : std_logic_vector(7 downto 0);

constant CLK_period : time := 10 ns;
begin
uut: counter port map (
SET => SET,
EN => EN,
DIR => DIR,
RESET => RESET,
CLK => CLK,
X => X,
Y => Y
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
EN <= '1';
SET <= '1';
DIR <= '1';
X <= "01111111";
wait for CLK_period;
SET <= '0';
wait for CLK_period * 130;

SET <= '1';
DIR <= '0';
wait for CLK_period;
SET <= '0';
wait for CLK_period * 130;

wait;
end process;
end;
