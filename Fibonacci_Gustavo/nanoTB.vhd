library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NanoCPU_TB is
end NanoCPU_TB;

architecture TB of NanoCPU_TB is

	signal ck, rst: std_logic := '0';
	signal dataR, dataW: std_logic_vector(15 downto 0);
	signal address: std_logic_vector(7 downto 0);
	signal we, ce: std_logic;

	-- Memory array signal for 256 x 16-bit positions
	type memoryArray is array (0 to 255) of std_logic_vector(15 downto 0);
	-- nota mental: 1. funçao | 2. variavel valorada | 3. execuçao entre 2 variaveis 
	signal memory: memoryArray :=
	(	
		0 => X"4000", -- R0 <= 0 (constante)
		1 => X"4100", -- R1 <= 0
		2 => X"4200", -- R2 <= 0
		3 => X"8220", -- R2 <= 0 + 1 = 1

		4 => X"1151", -- PMEM[21] = R1

		5 => X"6312", -- R3 = R1 + R2
		6 => X"6120", -- R1 = R2 + 0
		7 => X"6230", -- R2 = R3 + 0

		8 => X"0143", -- R3 = PMEM[20]
		9 => X"9330", -- R3 = R3 - 1

		10 => X"1143", -- PMEM[20] = R3
		11 => X"7303", -- R3 = 0 < R3 (N>0)
		12 => X"3043", -- BRANCH p/ linha 4 se R3 = 1
		13 => X"F000", -- END

		20 => X"000E", -- N (14)
		21 => X"0000", -- recebe os valores da série
		others => (others => '0')
	);

begin

	rst <= '1', '0' after 2 ns;        -- generates the reset signal
	ck  <= not ck after 1 ns;          -- generates the clock signal 

	CPU: entity work.nanoCPU port map
	(
		ck      => ck,
		rst     => rst,
		address => address,
		dataR   => dataR,
		dataW   => dataW,
		ce      => ce,
		we      => we
	); 

	-- write to memory
	process(ck)
	begin
		if ck'event and ck = '1' then
			if we = '1' then
				memory(CONV_INTEGER(address)) <= dataW; 
			end if;
		end if;
	end process;

	dataR <= memory(CONV_INTEGER(address));   -- read from memory

end TB;