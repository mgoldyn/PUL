library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUL4X4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end MUL4X4;

architecture Behavioral of MUL4X4 is

component SUMNB is
generic (N: natural := 8);
Port(Cin  : in STD_LOGIC;
     Cout : out STD_LOGIC;
     A    : in STD_LOGIC_VECTOR(N-1 downto 0);
     B    : in STD_LOGIC_VECTOR(N-1 downto 0);
     Y    : out STD_LOGIC_VECTOR(N-1 downto 0));
end component;

type vector_2d_t is array (natural range <>) of std_logic_vector(7 downto 0);
signal and_out: vector_2d_t(3 downto 0) := (others => (others => '0'));
signal sum_out: vector_2d_t(1 downto 0) := (others => (others => '0'));

signal cout: STD_LOGIC_VECTOR(3 downto 0);
signal cin: STD_LOGIC_VECTOR(4 downto 0);
signal y_temp: STD_LOGIC_VECTOR(7 downto 0);

begin
-- Input wpisany z offsetem do sygnalu
F: for i in 0 to 3 generate
    G: for j in 0 to 3 generate
        and_out(i)(i + j) <= a(i) and b(j);
    end generate;
end generate;

-- Sumator 8 bitowy na 2 parach wynikach operacji and
H: for k in 0 to 1 generate
    sum: SUMNB port map(Cin => cin(k), Cout => cin(k + 1), A => and_out(k * 2), B => and_out((k * 2) + 1), Y => sum_out(k));
end generate;

-- Sumator 8 bitowy na parze wynikow z kroku poprzedniego
sum: SUMNB port map(Cin => cin(4), Cout => cin(0), A => sum_out(0), B => sum_out(1), Y => y);

end Behavioral;
