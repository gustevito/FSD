--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity tb is
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture tb of tb is
    signal CK, DS : std_logic := '0' ;
    signal MS : std_logic_vector(1 downto 0) := "00" ;
    signal X, Y, Z, RA, RB : std_logic_vector(7 downto 0) := (others=>'0');
begin

    DUT: entity work.ex3
         port map(CLOCK => CK, MS => MS, DS=>DS, 
                  X=>X, Y=>Y, Z=>Z, RA=>RA, RB=>RB);

    CK <= not CK after 20 ns;

    process (CK)
    begin
        if rising_edge(CK) then
            MS <= MS + 1;
            X <= X + 16;
            Y <= Y + 32;
            Z <= Z + 64;
        end if;
    end process;

    DS <= not DS after 35 ns;

end architecture;