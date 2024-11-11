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
    signal clk : std_logic := '1' ;
    signal saida : std_logic_vector(3 downto 0);
begin

    clk <= not clk after 10 ns;

    DUT: entity work.ex5
         port map(clk => clk, saida => saida);

end architecture;