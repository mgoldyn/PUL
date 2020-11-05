library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sm is
    Port ( I : in STD_LOGIC;
           O : out STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC);
end sm;

architecture Behavioral of sm is
signal state: STD_LOGIC_VECTOR(2 downto 0);
begin

    process(RESET, CLK)
    begin
        if(RESET = '1') then
            state <= "000";
            O <= '0';
        elsif(rising_edge(CLK)) then
            if( state = "100") then
                O <= '1';
                state <= "000";
            else
                case state is 
                    when "000" =>
                        if(I = '0') then
                            state <= "001";
                        end if;
                    
                    when "001" =>
                        if(I = '1') then
                            state <= "010";
                        else
                            state <= "000";
                        end if;
                    
                    when "010" =>
                        if(I = '1') then
                            state <= "011";
                        else
                            state <= "000";
                        end if;
                
                    when "011" =>
                        if(I = '0') then
                            state <= "100";
                        else
                            state <= "000";
                        end if;
                    when others =>
                        state <= "000";
                end case;
                O <= '0';
            end if;
        end if;
    end process;
end Behavioral;
