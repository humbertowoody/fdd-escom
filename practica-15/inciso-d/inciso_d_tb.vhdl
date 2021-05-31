library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inciso_d_tb is
end inciso_d_tb;

architecture prueba_inciso_d of inciso_d_tb is
  component inciso_d
    port (
      bcd: in std_logic_vector(3 downto 0);
      display: out std_logic_vector(6 downto 0)
    );
  end component inciso_d;

  signal bcd: std_logic_vector(3 downto 0);
  signal display: std_logic_vector(6 downto 0);
begin
  incisoD: inciso_d port map(bcd => bcd, display => display);

  process begin
    bcd <= "0000";
    wait for 1 ns;
    assert (display = "0110111") report "Error en 0";
    
    bcd <= "0001";
    wait for 1 ns;
    assert (display = "0111110") report "Error en 1";

    bcd <= "0010";
    wait for 1 ns;
    assert (display = "0010101") report "Error en 2";

    bcd <= "0011";
    wait for 1 ns;
    assert (display = "0011111") report "Error en 3";

    bcd <= "0100";
    wait for 1 ns;
    assert (display = "1001111") report "Error en 4";

    bcd <= "0101";
    wait for 1 ns;
    assert (display = "0000101") report "Error en 5";

    assert false report "Fin de prueba";
    wait;
  end process;
  
  
end architecture prueba_inciso_d;