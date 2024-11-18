-----**********************************************************
-----  FLIP-FLOP MESTRE ESCRAVO DE N BITS
-----**********************************************************
--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------
-- Entidade
--------------------------------------
entity ffd_ms is
  generic(N : integer := 16);
  port( clk, reset, ce : in std_logic;
        D : in  std_logic_vector(N-1 downto 0);
        Q : out std_logic_vector(N-1 downto 0) );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture ffd_ms of ffd_ms is 
begin
  process(reset, clk)
  begin
    if reset = '1' then
      Q <= (others => '0');
    elsif rising_edge(clk) then
      if ce = '1' then
        Q <= D; 
      end if;
    end if;
  end process;      
end architecture;


-----**********************************************************
-----  LATCH DE N BITS
-----**********************************************************
--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------
-- Entidade
--------------------------------------
entity latch is
  generic(N : integer := 16);
  port( clk, reset, ce : in std_logic;
        D : in  std_logic_vector(N-1 downto 0);
        Q : out std_logic_vector(N-1 downto 0) );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture latch of latch is 
begin
  process(reset, clk, D)
  begin
    if reset = '1' then
      Q <= (others => '0');
    elsif clk = '1' then
      if ce = '1' then
        Q <= D; 
      end if;
    end if;
  end process;      
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

architecture tb of tb is
  signal reset, ce : std_logic;
  signal clk : std_logic := '0' ;
  signal D, q_ms, q_lt : STD_LOGIC_VECTOR(7 downto 0);
begin

  regMS: entity work.ffd_ms generic map(8)
         port map(clk => clk, reset => reset,  ce => ce, D => D, Q => q_ms);

  regLT: entity work.latch generic map(8)
         port map(clk => clk, reset => reset,  ce => ce, D => D, Q => q_lt);

  reset <= '1', '0' after 5 ns;

  clk <= not clk after 20 ns;

  ce <= '1', '0' after 50 ns, '1' after 80 ns;

  D <= x"AA", x"11" after 18 ns,  x"20" after 22 ns,  x"31" after 24 ns,  x"40" after 26 ns, x"51" after 30 ns,
              x"60" after 34 ns,  x"71" after 36 ns,  x"80" after 45 ns,  x"91" after 48 ns, x"A0" after 58 ns,
              x"B1" after 70 ns,  x"C0" after 75 ns,  x"D1" after 89 ns,  x"E0" after 90 ns, x"F1" after 110 ns,
              x"00" after 170 ns, x"EE" after 230 ns;

end architecture; 