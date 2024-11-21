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
    signal reset : std_logic;
    signal clock : std_logic := '0' ;
    signal saida1 : std_logic_vector(3 downto 0);
begin

    reset <= '1', '0' after 5 ns;

    clock <= not clock after 20 ns;

    DUT: entity work.ex1
         port map(clock => clock, reset => reset,  saida => saida1);

end architecture;