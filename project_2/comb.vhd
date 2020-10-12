library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comb is
    Port ( X0 : in STD_LOGIC;
           X1 : in STD_LOGIC;
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC);
end comb;

architecture Behavioral of comb is
signal S0, S1: std_logic;

begin
    S0 <= NOT X0 ;
    S1 <= NOT X1;
    
    Y0 <= S0 AND S1;
    Y1 <= S1 AND X0;
    Y2 <= S0 AND X1;
    Y3 <= X0 AND X1;
end Behavioral;
