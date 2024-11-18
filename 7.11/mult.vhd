--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity mult is
    port( -- <COMPLETAR>
        );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture mult of mult is
  type states is ( <definir os estado> ); -- TAREFA: <COMPLETAR>
  signal EA, PE : states;
  signal cont : std_logic_vector(<definir a dimensao> downto 0); -- TAREFA: <COMPLETAR>
  signal regP : std_logic_vector(<definir a dimensao> downto 0); -- TAREFA: <COMPLETAR>
begin                           

  -- Processo para troca de estados
  process(reset, clock)
  begin
    -- <COMPLETAR>
  end process;

  -- Processo para definir o proximo estado
  process (EA, start, cont)
  begin
    -- <COMPLETAR>
  end process;

  -- Bloco de dados conforme as laminas
  process (reset, clock)  
  begin
    if reset='1' then
      regP    <= (others=>'0');
      produto <= (others=>'0');
    elsif rising_edge(clock) then
      case EA is
        when INIT =>
          regP(64 downto 32) <= (others=>'0');
          regP(31 downto 0)  <= A;
          cont <= (others=>'0'); 
          end_mul <='0';

        when SUM =>
          cont <= cont-1;
          if regP(0)='1' then
            regP(64 downto 32) <= regP(64 downto 32) + ('0' & B);
          end if;

        when SHIFT =>
          if cont=0 then 
            end_mul <='1';
          end if;
          regP <= '0' & regP(64 downto 1);

        when FIM =>
          produto <= regP(63 downto 0);                 
      end case;
    end if;
  end process;

end architecture;