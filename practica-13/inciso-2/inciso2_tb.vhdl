library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inciso2_tb is
end inciso2_tb;

architecture prueba of inciso2_tb is
  component inciso2
    port (
      e: in std_logic_vector(1 downto 0);
      z, y: in std_logic;
      d, c: out std_logic_vector(3 downto 0)
    );
  end component;

  signal e: std_logic_vector(1 downto 0);
  signal z, y: std_logic;
  signal d, c: std_logic_vector(3 downto 0);
begin
  inciso_2: inciso2 port map(e => e, z => z, y => y, d => d, c => c);

  process begin

    e <= "00";
    z <= '1';
    y <= '1';
    wait for 1 ns;
    assert (d = "0001") report "Error en d";
    assert (c = "0001") report "Error en c";

    assert false report "Fin de la prueba, sin errores.";
    wait;
  end process;
  
end architecture prueba;