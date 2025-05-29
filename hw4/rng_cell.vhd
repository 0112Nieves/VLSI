library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rng_cell is
    Port (
        in_a, in_b, in_c, in_d : in STD_LOGIC;
        out_val : out STD_LOGIC
    );
end rng_cell;

architecture Behavioral of rng_cell is
begin
    out_val <= in_a xor in_b xor in_c xor in_d;
end Behavioral;
