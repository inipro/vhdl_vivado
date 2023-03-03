library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult_tree is
    port(
        clk : in std_logic;
        i_a, i_b, i_c, i_d : in std_logic_vector(3 downto 0);
        o_result : out std_logic_vector(7 downto 0)
    );
end mult_tree;

architecture Behavioral of mult_tree is
    signal a_buf, b_buf, c_buf, d_buf : std_logic_vector(3 downto 0);
    signal abb_result, cdd_result : std_logic_vector(11 downto 0);
    signal result_buf : std_logic_vector(23 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            a_buf <= i_a;
            b_buf <= i_b;
            c_buf <= i_c;
            d_buf <= i_d;

            abb_result <= ((a_buf * b_buf) * b_buf);
            cdd_result <= ((c_buf * d_buf) * d_buf);
            result_buf <= abb_result * cdd_result;
        end if;
    end process;
    
    o_result <= result_buf(23 downto 16);
end Behavioral;
