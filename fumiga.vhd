---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Faça uma formiga andar através dos 4 displays.
-- O percurso completo deve levar 3s. Se sua matricula for par, o sentido deve ser
-- horario. Se for impar, anti horario. Deve fazer ao menos 1 curva. 

entity mioca is
    Port ( clk : in  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           leds : out  STD_LOGIC_VECTOR (6 downto 0));
end mioca;

architecture Behavioral of mioca is
	
signal fumiga : integer range 0 to 15;

begin

	process (clk)
	
		variable cont : integer range 0 to 18_600_000;
		variable mi, ce, de, un : std_logic_vector(6 downto 0);
		variable mux : integer range 0 to 1_000_000;
	
	begin
	
		if rising_edge(clk)
			then
				if cont < 18_600_000
					then cont := cont +1;
				else 
					cont := 0;
				end if; -- if do cont
			
				if cont = 0 
					then
						if fumiga > 0
							then fumiga <= fumiga - 1;
						else
							fumiga <= 15;
						end if;
				end if; -- if do fim do contador
			
			if fumiga = 0
				then  mi := "1111011";
						ce := "1111111";
						de := "1111111";
						un := "1111111";
			elsif fumiga = 1
				then  mi := "1111101";
						ce := "1111111";
						de := "1111111";
						un := "1111111";
			elsif fumiga = 2
				then  mi := "0111111";
						ce := "1111111";
						de := "1111111";
						un := "1111111";
			elsif fumiga = 3
				then  mi := "1111111";
						ce := "0111111";
						de := "1111111";
						un := "1111111";
			elsif fumiga = 4
				then  mi := "1111111";
						ce := "1011111";
						de := "1111111";
						un := "1111111";
			elsif fumiga = 5
				then  mi := "1111111";
						ce := "1101111";
						de := "1111111";
						un := "1111111";
			elsif fumiga = 6
				then  mi := "1111111";
						ce := "1111111";
						de := "1110111";
						un := "1111111";
			elsif fumiga = 7
				then  mi := "1111111";
						ce := "1111111";
						de := "1101111";
						un := "1111111";
			elsif fumiga = 8
				then  mi := "1111111";
						ce := "1111111";
						de := "1011111";
						un := "1111111";
			elsif fumiga = 9
				then  mi := "1111111";
						ce := "1111111";
						de := "1111111";
						un := "0111111";
			elsif fumiga = 10
				then  mi := "1111111";
						ce := "1111111";
						de := "1111111";
						un := "1011111";
			elsif fumiga = 11 
				then	mi := "1111111";
						ce := "1111111";
						de := "1111111";
						un := "1101111";
			elsif fumiga = 12
				then	mi := "1111111";
						ce := "1111111";
						de := "1111111";
						un := "1110111";
			elsif fumiga = 13
				then	mi := "1111111";
						ce := "1111111";
						de := "1110111";
						un := "1111111";
			elsif fumiga = 14
				then	mi := "1111111";
						ce := "1110111";
						de := "1111111";
						un := "1111111";	
			else
						mi := "1110111";
						ce := "1111111";
						de := "1111111";
						un := "1111111";	
			end if; --pos fumiga
			
			
			if mux < 1_000_000
				then mux := mux + 1;
				else mux  := 0;
			end if;
			
			if mux < 250_000
				then leds <= mi; -- disp recebe milhar
					  sel <= "0111"; --liga disp do milhar
			elsif mux < 500_000
				then leds <= ce; -- disp recebe milhar
					  sel <= "1011"; --liga disp do milhar
			elsif mux < 750_000
				then leds <= de; -- disp recebe milhar
					  sel <= "1101"; --liga disp do milhar
			else
				     leds <= un; -- disp recebe milhar
					  sel <= "1110"; --liga disp do milhar
			end if;
					  
		end if; --rising edge		
	
	end process;

end Behavioral;
