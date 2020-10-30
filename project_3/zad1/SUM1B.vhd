library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUM1B is
port(A : in STD_LOGIC;
     B : in STD_LOGIC;
     Cin : in STD_LOGIC;
     Cout : out STD_LOGIC;
     Y : out STD_LOGIC);
end SUM1B;

architecture Behavioral of SUM1B is

signal sum: STD_LOGIC_VECTOR(0 to 2);
begin
sum(0) <= A xor B;
sum(1) <= sum(0) and Cin;
sum(2) <= A and B;
Y <= sum(0) xor Cin;
Cout <= sum(1) or sum(2);

end Behavioral;
