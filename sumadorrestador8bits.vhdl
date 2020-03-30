--FULL ADDER
library IEEE;
use IEEE.STD_LOGIC_1164.all;   

entity fadder is
port(a,b,cin: in std_logic;
     cout, suma: out std_logic);
end fadder;


architecture behave of fadder is 
begin 
	suma<= (a xor b) xor cin;
	cout <= (a and b) or ((a xor b) and cin);
end behave;
----ADDER SUSBTRACTOR 
library IEEE;
use IEEE.STD_LOGIC_1164.all;   

entity addsub is

   port(
      A : IN std_logic_vector(7 DOWNTO 0);
      B : IN std_logic_vector(7 DOWNTO 0); 
      T : IN std_logic;
      C_FLAG : OUT std_logic;
      OV_FLAG : OUT std_logic;
      R : OUT std_logic_vector(7 DOWNTO 0)
   );
end addsub;

architecture behave of addsub is
component fadder
	port(a,b,cin: in std_logic;
      suma,cout: out std_logic);
end component;

signal temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7:std_logic;
signal c1, c2, c3, c4, c5, c6, c7,c8: std_logic;

begin
   temp0 <= b(0) xor t;
	temp1<= b(1) xor t;
	temp2 <= b(2) xor t;
	temp3 <= b(3) xor t;
	temp4 <= b(4) xor t;
	temp5 <= b(5) xor t;
	temp6 <= b(6) xor t;
	temp7 <= b(7) xor t;

	
 su0: fadder port map(A(0), temp0, T,R(0),C1);
 su1: fadder port map(A(1), temp1, C1,R(1),C2);
 su2: fadder port map(A(2), temp2, C2, R(2),c3);
 su3: fadder port map(A(3), temp3, C3, R(3),c4);
 su4: fadder port map(A(4), temp4, C4, R(4),c5);
 su5: fadder port map(A(5), temp5, C5, R(5),c6);
 su6: fadder port map(A(6), temp6, C6, R(6),c7);
 su7: fadder port map(A(7), temp7, C7, R(7),C8);
 OV_FLAG <=C8 XOR C7;
 C_FLAG <=C8;
 
end behave;