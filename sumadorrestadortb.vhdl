LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tbaddsub IS
END tbaddsub;
 
ARCHITECTURE behavior OF tbaddsub IS 
 
    
 
    COMPONENT addsub
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         T : IN  std_logic;
         C_FLAG : OUT  std_logic;
         OV_FLAG : OUT  std_logic;
         R : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal T : std_logic := '0';

 	--Outputs
   signal C_FLAG : std_logic;
   signal OV_FLAG : std_logic;
   signal R : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub PORT MAP (
          A => A,
          B => B,
          T => T,
          C_FLAG => C_FLAG,
          OV_FLAG => OV_FLAG,
          R => R
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
  

   ---SUMA DE NUMEROS POSITIVOS  
  wait for 100 ns;	
  A<="01001001"; 
  B<="00101010";
  T<='0';
  
  Wait for 100 ns;	
  A<="01011001";  
  B<="00111110";
  T<='0';
  
  
  ---SUMA DE NUMEROS POSITIVO / NUMERO NEGATIVO
  Wait for 100 ns;	
  A<="01011001";  
  B<="11111111";
  T<='0';
  
  Wait for 100 ns;	
  A<="00000010";  
  B<="11111111";
  T<='0';
  
  ---SUMA DE NUMEROS NEGATIVO / NUMERO POSITIVO
   Wait for 100 ns;	
  A<="11110110";  
  B<="00000001";
  T<='0';
  
   Wait for 100 ns;	
  A<="11111110"; 
  B<="00000001";
  T<='0';
  
  --OVERFLOW SUMA
  
  
     Wait for 100 ns;	
  A<="01000000"; 
  B<="01000000";
  T<='0';
  
     Wait for 100 ns;	
  A<="01110011"; 
  B<="00101010";
  T<='0';
  
  --OVERFLOW NEGATIVES
   Wait for 100 ns;	
  A<="11000001"; 
  B<="10110111";
  T<='0';
  
   Wait for 100 ns;	
  A<="11000011"; 
  B<="10110111";
  T<='0';
  
 --CARRY OUT SUMA
  Wait for 100 ns;	
  A<="11000001"; 
  B<="11110110";
  T<='0';
   Wait for 100 ns;	
  A<="11000011"; 
  B<="11110110";
  T<='0';
  
  --CARRYOUT RESTA
  Wait for 100 ns;	
  A<="11111111"; 
  B<="01000000";
  T<='1';
   Wait for 100 ns;	
  A<="11111111"; 
  B<="01000000";
  T<='1';

  
      wait;
   end process;

END;
