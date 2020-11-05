library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity counter is
    Port ( SET   : in STD_LOGIC;
           EN    : in STD_LOGIC;
           DIR   : in STD_LOGIC;
           CLK   : in STD_LOGIC;
           RESET : in STD_LOGIC;
           X     : in STD_LOGIC_VECTOR (7 downto 0);
           Y     : out STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture Behavioral of counter is
    signal CNT: unsigned(7 downto 0);
begin
    process(Reset, CLK)
    begin
        if(RESET = '1') then
            CNT <= "00000000";
        elsif(rising_edge(CLK)) then
            if(EN = '1') then
                if(SET = '1') then
                    CNT <= unsigned(X);
                elsif(DIR = '1') then
                    if(CNT = "11111111") then
                        CNT <= "00000000";
                    else
                        CNT <= CNT + 1;
                    end if;
                else
                    if(CNT = "00000000") then
                        CNT <= "11111111";
                    else
                        CNT <= CNT - 1;
                    end if;
                end if;
            end if;
         end if;
         end process;
         
         Y <= std_logic_vector(CNT);
end Behavioral;
