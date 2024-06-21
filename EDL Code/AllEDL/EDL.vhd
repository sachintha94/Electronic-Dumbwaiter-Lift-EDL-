library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity ELD_TEST is
  port(
      clk,reset : in STD_LOGIC;
      BTN1,BTN2,LS0,LS1,LS2,RET: in STD_LOGIC;
      M : out STD_LOGIC_VECTOR(1 downto 0));

end ELD_TEST;

architecture Behavioral of ELD_TEST is
type stateType is (INT,A,B,C,D,E,F);
  signal state_reg, state_next : stateType;
   -- signal M :  STD_LOGIC_VECTOR(1 downto 0):="00";
begin
--Defining clock
  process(clk,reset)
  begin
  if (reset = '1') then 
    state_reg <= INT;
   elsif(rising_edge(clk)) then
   state_reg <= state_next;
   end if;
   end process;
  
  process(BTN1,BTN2,LS0,LS1,LS2,RET,state_reg)  
  begin
    state_next <= state_reg;
--    M <= "00";
--    
   case state_reg is 
      -- If the current state is INT 
      when INT =>
		M <= "00";
        if (BTN2 = '1' and LS0 ='1' and BTN1='0') then M <= "01";
           state_next<= d;-- Inertial point
        elsif (BTN1='1' and LS0='1' and BTN2 = '0') then M <= "01";
           state_next<= a; --up 1nd floor
		  --elsif (BTN2 = '1' and LS0 = '1') then M <= "01";
			   --state_next<= D; --up 2nd floor
				
        end if;
        
        
      -- If the current state is A 
      when A =>
        if (BTN1='1' and LS1='1') then M <= "00";
				state_next<= B;--stop 1st floor
				
        end if;
      
      
      -- If the current state is B
      when B =>
        if (RET= '1' and LS1='1') then M <= "10";
            state_next<= C;--down 
				
        end if;
      
      -- If the current state is C
      when C =>
        if (RET= '1' and LS0= '1') then M <= "00";
            state_next<= INT;--INT stop 
				
        end if;
      
      -- If the current state is D
      when D =>
        if (BTN2='1' and LS2='1') then M <= "00";
            state_next<= E;--2nd floor stop
				
        end if;
      
      -- If the current state is E 
      when E =>
        if (RET= '1' and LS2='1') then M <= "10";
            state_next<= F;--2nd floor down
				
        end if;
		  
      -- If the current state is F
      when F =>
        if (RET= '1' and LS0= '1') then M <= "00";
            state_next<= INT;--INT stop
				
        end if;
      
   end case;
 end process;   
end Behavioral;