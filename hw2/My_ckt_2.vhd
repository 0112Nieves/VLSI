library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity My_ckt_2 is
    Port (
        clk : in STD_LOGIC;
        A   : in STD_LOGIC_VECTOR(7 downto 0);
        B   : in STD_LOGIC_VECTOR(7 downto 0);
        S   : in STD_LOGIC_VECTOR(1 downto 0);
        Y   : out STD_LOGIC_VECTOR(15 downto 0)
    );
end My_ckt_2;

architecture Structural of My_ckt_2 is

    -- 宣告 component
    component D_FF
        Port (
            clk : in STD_LOGIC;
            D   : in STD_LOGIC_VECTOR;
            Q   : out STD_LOGIC_VECTOR
        );
    end component;

    component My_ckt_1
        Port (
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            S : in STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- 中介線路
    signal A_reg, B_reg : STD_LOGIC_VECTOR(7 downto 0);
    signal S_reg        : STD_LOGIC_VECTOR(1 downto 0);
    signal Y_temp       : STD_LOGIC_VECTOR(15 downto 0);
    signal Y_reg        : STD_LOGIC_VECTOR(15 downto 0);

begin
    -- 註冊輸入 A
    DFF_A : D_FF
        port map(clk => clk, D => A, Q => A_reg);

    -- 註冊輸入 B
    DFF_B : D_FF
        port map(clk => clk, D => B, Q => B_reg);

    -- 註冊輸入 S
    DFF_S : D_FF
        port map(clk => clk, D => S, Q => S_reg);

    -- 註冊輸出 Y
    DFF_Y : D_FF
        port map(clk => clk, D => Y_temp, Q => Y_reg);

    -- 呼叫 My_ckt_1，接上 D FF 輸出的訊號
    U1 : My_ckt_1
        port map(
            A => A_reg,
            B => B_reg,
            S => S_reg,
            Y => Y_temp
        );

    -- 將輸出的 D FF 結果傳給 Y
    Y <= Y_reg;

end Structural;
