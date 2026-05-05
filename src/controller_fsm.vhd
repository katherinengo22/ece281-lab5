----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:42:49 PM
-- Design Name: 
-- Module Name: controller_fsm - FSM
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller_fsm is
    Port ( i_reset : in STD_LOGIC;
           i_adv : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           o_cycle : out STD_LOGIC_VECTOR (3 downto 0));
end controller_fsm;

architecture FSM of controller_fsm is

    type state is (clear, loadA, loadB, execute);
    signal current_state, next_state : state;
    
begin
    
    next_state <= loadA when (current_state = clear) else
        loadB when (current_state = loadA) else
        execute when (current_state = loadB) else
        clear when (current_state = execute) else
        clear;
        
   o_cycle <= "0001" when (current_state = clear) else
        "0010" when (current_state = loadA) else
        "0100" when (current_state = loadB) else
        "1000" when (current_state = execute) else
        "0001";
        
   state_register : process(i_clk)
        begin 
            if rising_edge(I_clk) then 
                if i_reset = '1' then 
                    current_state <= clear;
                elsif i_adv = '1' then 
                    current_state <= next_state;
                end if;
            end if;
        end process;
                
end FSM;
