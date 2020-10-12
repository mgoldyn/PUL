library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Karnaugh is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC);
end Karnaugh;

architecture Behavioral of Karnaugh is
signal a_1, b_1, a_0, b_0: std_logic;
begin
a_1 <= (not x(2)) and ((not x(1)) or (not x(0)));
b_1 <= not x(1) and x(0);

a_0 <= not x(2) or x(0);
b_0 <= not x(1) or not x(0);

y <= a_1 or b_1;
y <= a_0 and b_0;

end Behavioral;
