library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult_async is
    port(
        clka : in std_logic;
        clkb : in std_logic;
        i_a, i_b : in std_logic_vector(3 downto 0);
        o_result : out std_logic_vector(7 downto 0)
    );
end mult_async;

architecture Behavioral of mult_async is
    signal a_buf_by_clka : std_logic_vector(3 downto 0);
    signal synchronizer : std_logic_vector(3 downto 0);
    signal a_buf, b_buf : std_logic_vector(3 downto 0);
    signal result_buf : std_logic_vector(7 downto 0);
begin
    process(clka)
    begin
        if rising_edge(clka) then
            a_buf_by_clka <= i_a;
        end if;
    end process;
    
    -- synchronizer register
    process(clkb)
    begin
        if rising_edge(clkb) then
            synchronizer <= a_buf_by_clka;
        end if;
    end process;
    
    process(clkb)
    begin
        if rising_edge(clkb) then
            a_buf <= synchronizer;
            b_buf <= i_b;
            result_buf <= a_buf * b_buf;
        end if;
    end process;

    o_result <= result_buf;
end Behavioral;