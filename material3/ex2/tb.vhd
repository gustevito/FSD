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
    signal fin : std_logic := '0';
    signal fout : std_logic;
begin

    fin <= not fin after 10 ns;

    DUT: entity work.ex2  
         port map(fin => fin, fout => fout);

end architecture;