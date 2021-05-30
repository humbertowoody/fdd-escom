library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity practica13_tb is
end entity practica13_tb;

architecture prueba of practica13_tb is
  component practica13
    port (
      a01: in std_logic_vector(1 downto 0);
      e, a2: in std_logic;
      y1, y2: out std_logic_vector(3 downto 0)
    );
  end component;

  signal a01: std_logic_vector(1 downto 0);
  signal e, a2: std_logic;
  signal y1, y2: std_logic_vector(3 downto 0);
begin
  practica_13: practica13 port map(a01 => a01, e => e, a2 => a2, y1 => y1, y2 => y2);

  process begin
      a01 <= "00";
      e <= '1';
      a2 <= '1';
      wait for 1 ns;
      assert (y1 = "0000") report "Error en y1";
      assert (y2 = "0001") report "Error en y2";

    -- Mensaje para finalización de la simulación.
    assert false report "Fin de la prueba, sin errores.";
    wait;
  end process;
  
end architecture prueba;