----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/01/20 20:54:58
-- Design Name: 
-- Module Name: vga_out - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_out is
    Port (
        clk : in std_logic;
        vga_hs, vga_vs : out std_logic;
        vga_o : out std_logic_vector(11 downto 0)    
    );
end vga_out;

architecture Behavioral of vga_out is
    signal pclk : std_logic;
    signal hcnt, vcnt : integer;
    component clk_wiz_0
    port
     (-- Clock in ports
      -- Clock out ports
      clk_out1          : out    std_logic;
      clk_in1           : in     std_logic
     );
    end component;
begin

    your_instance_name : clk_wiz_0
       port map ( 
      -- Clock out ports  
       clk_out1 => pclk,
       -- Clock in ports
       clk_in1 => clk
     );
 
    process(pclk)
    begin
        if rising_edge(pclk) then 
            hcnt <= hcnt + 1;
            if hcnt = 799 then
                hcnt <= 0;
                vcnt <= vcnt + 1;
                if vcnt = 524 then  vcnt <= 0;
 	            end if;
            end if;
            if (hcnt>=656 and hcnt<752) then    vga_hs <= '0';
            else    vga_hs <= '1';
            end if;        
            if(vcnt>=490 and vcnt<492) then vga_vs <= '0';
            else    vga_vs <= '1';
            end if;    
            if(hcnt>=0 and hcnt<640 and vcnt>=0 and vcnt<480) then
                if (hcnt = 300) then    vga_o <= x"f00";
                else vga_o <= X"000";
                end if;
            else    vga_o <= X"000";
            end if;            
        end if;
    end process;
    
end Behavioral;
