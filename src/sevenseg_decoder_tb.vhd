----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: C3C Katherine ngo
-- 
-- Create Date: 02/24/2026 02:40:37 PM
-- Design Name: Seven Segment Decoder 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: Seven Segment Decoder 
-- Target Devices: 
-- Tool Versions: 
-- Description: seven segment decoder test bench 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
--  Port ( );
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    component sevenseg_decoder
    Port (
        i_Hex : in std_logic_vector (3 downto 0);
        o_seg_n : out std_logic_vector (6 downto 0)
        );
    end component;
    
    signal i_Hex_tb : std_logic_vector (3 downto 0);
    signal o_seg_n_tb : std_logic_vector (6 downto 0);
begin

    DUT: sevenseg_decoder
        port map (
        i_Hex => i_Hex_tb,
        o_seg_n => o_seg_n_tb
        );
        
    process
    begin
    
        i_Hex_tb <= "0000"; wait for 10 ns;
        i_Hex_tb <= "0001"; wait for 10 ns;
        i_Hex_tb <= "0010"; wait for 10 ns;
        i_Hex_tb <= "0011"; wait for 10 ns;
        i_Hex_tb <= "0100"; wait for 10 ns;
        i_Hex_tb <= "0101"; wait for 10 ns;
        i_Hex_tb <= "0110"; wait for 10 ns;
        i_Hex_tb <= "0111"; wait for 10 ns;
        i_Hex_tb <= "1000"; wait for 10 ns;
        i_Hex_tb <= "1001"; wait for 10 ns;
        i_Hex_tb <= "1010"; wait for 10 ns;
        i_Hex_tb <= "1011"; wait for 10 ns;
        i_Hex_tb <= "1100"; wait for 10 ns;
        i_Hex_tb <= "1101"; wait for 10 ns;
        i_Hex_tb <= "1110"; wait for 10 ns;
        i_Hex_tb <= "1111"; wait for 10 ns;
        
        wait; 
        
    end process;

end Behavioral;
