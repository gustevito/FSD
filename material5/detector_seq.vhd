--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity detector_seq is 
  port( -- <COMPLETAR>
      );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture detector_seq of detector_seq is
  type state is (S0, S1, S11, S110, S1101);
  signal EA, PE: state;
begin

  -- <COMPLETAR>

end architecture;