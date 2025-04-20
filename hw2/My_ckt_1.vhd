library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity My_ckt_1 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end My_ckt_1;

architecture Behavioral of My_ckt_1 is
begin
    process (A, B, S)
    begin
        case S is
            when "00" =>  -- Mode 1: Bitwise OR
                Y(7 downto 0) <= STD_LOGIC_VECTOR(UNSIGNED(A) OR UNSIGNED(B));
                Y(15 downto 8) <= (others => '0');

            when "01" =>  -- Mode 2: Multiplication
                Y <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(A) * UNSIGNED(B), 16));

            when "10" =>  -- Mode 3: Addition
                Y <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(A) + UNSIGNED(B), 16));

            when "11" =>  -- Mode 4: Modulus
                if UNSIGNED(B) /= 0 then
                    Y(7 downto 0) <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(A) MOD UNSIGNED(B), 8));
                    Y(15 downto 8) <= (others => '0');
                else
                    Y <= (others => '0'); -- ??K???H?s???~
                end if;

            when others =>
                Y <= (others => '0');
        end case;
    end process;
end Behavioral;