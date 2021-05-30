library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inciso_b_tb is
end inciso_b_tb;

architecture prueba_inciso_b of inciso_b_tb is
  component inciso_b
    port (
      bcd: in std_logic_vector(3 downto 0);
      display: out std_logic_vector(6 downto 0)
    );
  end component;

  signal bcd: std_logic_vector(3 downto 0);
  signal display: std_logic_vector(6 downto 0);
begin
  incisoB: inciso_b port map(bcd => bcd, display => display);
  
  process begin
    bcd <= "0000";
    wait for 1 ns;
    assert (display = "0000001") report "Error en 0";
    
    bcd <= "0001";
    wait for 1 ns;
    assert (display = "1001111") report "Error en 1";

    bcd <= "0010";
    wait for 1 ns;
    assert (display = "0010010") report "Error en 2";

    bcd <= "0011";
    wait for 1 ns;
    assert (display = "0000110") report "Error en 3";

    bcd <= "0100";
    wait for 1 ns;
    assert (display = "1001100") report "Error en 4";

    bcd <= "0101";
    wait for 1 ns;
    assert (display = "0100100") report "Error en 5";

    bcd <= "0110";
    wait for 1 ns;
    assert (display = "0001111") report "Error en 6";

    bcd <= "0111";
    wait for 1 ns;
    assert (display = "0001111") report "Error en 7";

    bcd <= "1000";
    wait for 1 ns;
    assert (display = "0000000") report "Error en 8";

    bcd <= "1001";
    wait for 1 ns;
    assert (display = "0000100") report "Error en 9";

    bcd <= "1010";
    wait for 1 ns;
    assert (display = "1111111") report "Error en caso fuera de control";

    -- Mensaje para finalización de la simulación.
    assert false report "Fin de la prueba, sin errores.";
    wait;
  end process;
end architecture prueba_inciso_b;