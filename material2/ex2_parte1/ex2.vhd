-----**********************************************************
-----**** REGISTRADOR DE DESLOCAMENTO
-----**********************************************************
--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity shift_reg is
  generic(N : integer := 8);
  port( clk, reset : in std_logic;
        entrada : in std_logic_vector(N-1 downto 0);
        A, B, C : out std_logic_vector(N-1 downto 0) );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture shift_reg of shift_reg is 
  signal iA, iB, iC: std_logic_vector(N-1 downto 0);
begin
  process (clk, reset)
  begin
    if reset = '1' then
      iA <= (others => '0');
      iB <= (others => '0');
      iC <= (others => '0');
    elsif rising_edge(clk) then
      iA <= entrada;
      iB <= iA;
      iC <= iB; 
    end if; 
  end process;
  C <= iC;
  B <= iB;
  A <= iA;
end architecture;

-----**********************************************************
-----  TESTBENCH
-----**********************************************************
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
  signal clk : std_logic := '0';
  signal entrada, A, B, C : std_logic_vector(7 downto 0);
begin

  DUT: entity work.shift_reg 
       generic map(8)
       port map(clk => clk, reset => reset,  entrada => entrada, A => A, B => B, C => C);

  reset <= '1', '0' after 5 ns;

  clk <= not clk after 20 ns;

  entrada <=  x"12", x"23" after 40 ns,  x"37" after 80 ns,  x"48" after 120 ns,  x"5A" after 160 ns, x"63" after 200 ns;

end architecture; 