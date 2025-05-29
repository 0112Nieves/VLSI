library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rng_tb is
end rng_tb;

architecture behavior of rng_tb is

    component rng_array
        Port (
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            seed : in STD_LOGIC_VECTOR(63 downto 0);
            enable : in STD_LOGIC;
            rng_out : out STD_LOGIC_VECTOR(63 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '1';
    signal seed : STD_LOGIC_VECTOR(63 downto 0) := x"DEADBEEFCAFEBABE";
    signal enable : STD_LOGIC := '0';
    signal rng_out : STD_LOGIC_VECTOR(63 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    uut: rng_array port map (
        clk => clk,
        rst => rst,
        seed => seed,
        enable => enable,
        rng_out => rng_out
    );

    clk_process :process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
        file out_file : text open write_mode is "output_data2.txt";
        variable linebuf : line;
    begin
        wait for 20 ns;
        rst <= '0';
        enable <= '1';

        for i in 0 to 19 loop
            wait until rising_edge(clk);
            write(linebuf, string'("Cycle "));
            write(linebuf, i);
            write(linebuf, string'(": "));
            write(linebuf, rng_out);
            writeline(out_file, linebuf);
        end loop;

        wait;
    end process;

end behavior;
