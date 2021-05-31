library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inciso_c_tb is
end entity inciso_c_tb;

architecture prueba_inciso_c of inciso_c_tb is
  component inciso_c
    port (
    bcd: in std_logic_vector(3 downto 0);
    display: out std_logic_vector(6 downto 0)
  );
  end component inciso_c;

  signal bcd: std_logic_vector(3 downto 0);
  signal display: std_logic_vector(6 downto 0);
begin
  incisoC: inciso_c port map(bcd => bcd, display => display);

  -- Comienzan las pruebas.
  process begin
    bcd <= "0000";
    wait for 1 ns;

    bcd <= "0001";
    wait for 1 ns;

    bcd <= "0010";
    wait for 1 ns;

    bcd <= "0011";
    wait for 1 ns;

    bcd <= "0100";
    wait for 1 ns;

    bcd <= "0101";
    wait for 1 ns;

    bcd <= "0110";
    wait for 1 ns;

    bcd <= "0111";
    wait for 1 ns;

    bcd <= "1000";
    wait for 1 ns;

    bcd <= "1001";
    wait for 1 ns;

    bcd <= "1010";
    wait for 1 ns;

    bcd <= "1011";
    wait for 1 ns;

    bcd <= "1100";
    wait for 1 ns;

    bcd <= "1101";
    wait for 1 ns;

    bcd <= "1110";
    wait for 1 ns;

    bcd <= "1111";
    wait for 1 ns;

    assert false report "Fin de prueba";
    wait;
  end process;
  
end architecture prueba_inciso_c;
