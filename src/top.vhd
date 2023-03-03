library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        clk : in std_logic;
        q : out std_logic_vector(7 downto 0)
    );
end top;

architecture Behavioral of top is
    COMPONENT c_counter_binary_0
      PORT (
        CLK : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    END COMPONENT;
    signal qtmp : std_logic_vector(31 downto 0);
begin
    u1 : c_counter_binary_0
    PORT MAP (
        CLK => clk,
        Q => qtmp
    );
    q <= qtmp(31 downto 24);    
end Behavioral;