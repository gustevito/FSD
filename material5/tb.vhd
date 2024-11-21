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
  signal clock : std_logic := '0';
  signal din, dout : std_logic;

  type dados is array(natural range <>) of std_logic;
  constant padrao_de_teste : dados := ('1', '0', '1', '1', '0', '1', '1', '0', '1', '0', '0', '1', '1', '0', '1', '0');
begin

  reset <= '1', '0' after 5 ns;

  process
  begin 
    for i in 0 to padrao_de_teste'high loop    
      din <= padrao_de_teste(i);
      wait for 10 ns;
    end loop;
  end process;

  clock <= not clock after 5 ns;

  DUT: entity work.detector_seq
       port map(clock => clock, reset => reset,  din => din, dout => dout);

end architecture; 