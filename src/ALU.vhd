----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:50:18 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( i_A : in STD_LOGIC_VECTOR (7 downto 0);
           i_B : in STD_LOGIC_VECTOR (7 downto 0);
           i_op : in STD_LOGIC_VECTOR (2 downto 0);
           o_result : out STD_LOGIC_VECTOR (7 downto 0);
           o_flags : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

    signal A, B, Answer : signed(7 downto 0);
    signal check : signed(8 downto 0);
    
begin
    
    process(i_A, i_B, i_op)
    begin
        
        A <= signed(i_A);
        B <= signed(i_B);
        Answer <= (others => '0');
        check    <= (others => '0');
        
        case i_op is
        
        -- ADD
            when "000" => 
                check <= resize(signed(i_A),9) + resize(signed(i_B),9);
                Answer <= signed(i_A) + signed (i_B);
                    
        -- SUBTRACT
            when "001" => 
                check <= resize(signed(i_A),9) - resize(signed(i_B),9);
                Answer <= signed(i_A) - signed (i_B);
                                 

        -- AND
            when "010" => 
                Answer <= signed(i_A and i_B);

        -- OR
            when "011" => 
                Answer <= signed(i_A or i_B);

            when others =>
                Answer <= (others => '0');
                check <= (others => '0');

                
        end case;
    end process;
    
    o_result <= std_logic_vector(Answer);
    
    o_flags(3) <= Answer(7);
    o_flags(2) <= '1' when Answer = 0 else '0';
    o_flags(1) <= check(8) when (i_op = "000") else
                    not check(8) when( i_op = "001") else 
                    '0';
    o_flags(0) <= (check(8) xor check(7)) 
                    when (i_op = "000" or i_op = "001") 
                    else '0';
 
end Behavioral;
