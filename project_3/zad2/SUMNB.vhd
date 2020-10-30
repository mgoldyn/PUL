library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity SUMNB is
generic (N: natural := 8);
Port(Cin  : in STD_LOGIC;
     Cout : out STD_LOGIC;
     A    : in STD_LOGIC_VECTOR(N-1 downto 0);
     B    : in STD_LOGIC_VECTOR(N-1 downto 0);
     Y    : out STD_LOGIC_VECTOR(N-1 downto 0));
end SUMNB;

architecture Behavioral of SUMNB is

component SUM1B is
Port (A, B, Cin : in STD_LOGIC;
      Cout, Y   : out STD_LOGIC);
end component;

signal cout_sig: STD_LOGIC_VECTOR(N downto 0);

begin
cout_sig(0) <= Cin;
G: for i in 0 to N - 1 generate
    sum: SUM1B port map(A=>A(i), B=>B(i), Cin=>cout_sig(i), Cout=>cout_sig(i + 1), Y=>Y(i));
end generate;
Cout <= cout_sig(N);
end Behavioral;

