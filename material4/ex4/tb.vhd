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
    signal ck : std_logic := '0' ;
    signal saida2 : std_logic_vector(7 downto 0);
begin

    reset <= '1', '0' after 5 ns;

    ck <= not ck after 20 ns;

    DUT: entity work.ex4
         port map(clock => ck, reset => reset,  saida => saida2);

end architecture;