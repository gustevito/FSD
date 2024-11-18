--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------
-- Entidade
--------------------------------------
entity tb is
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture tb of tb is 
  signal op1, op2 : std_logic_vector(31 downto 0);
  signal produto : std_logic_vector(63 downto 0);
  signal reset, start, end_mul : std_logic;
  signal clock : std_logic := '0';
begin

  DUT: entity work.mult
       port map( clock => clock, reset => reset, start => start, A => op1,
                 B => op2, end_mul => end_mul, produto => produto );  

  reset <= '1', '0' after 5 ns;    
  clock <= not clock after 5 ns;

  op1 <=  x"12345678",   x"FFFFFFFF" after 800 ns,  x"00123045" after 1600 ns;

  op2 <=  x"33333333",   x"FFFFFFFF" after 800 ns,  x"33333333" after 1600 ns;

  start <= '0' , '1' after   30 ns, '0' after   50 ns,
                 '1' after  830 ns, '0' after  850 ns,
                 '1' after 1630 ns, '0' after 1650 ns;
    
end architecture;