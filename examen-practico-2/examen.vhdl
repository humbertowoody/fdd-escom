library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity examen is
  -- port (
  --   e : in std_logic_vector(1 downto 0);
  --   sel, z, y: in std_logic;
  --   display: out std_logic_vector(6 downto 0)
  -- );
end entity examen;

architecture a_examen of examen is
  component deco
    port(
      a : in std_logic_vector(1 downto 0);
      b : out std_logic_vector(3 downto 0);
      enable: in std_logic
    );
  end component;
  component mux
    port (
      dz, dy: in std_logic_vector(3 downto 0);
      m: out std_logic_vector(3 downto 0);
      sel: in std_logic
    );
  end component;
  component convertidor
    port (
      salida_mux: in std_logic_vector(3 downto 0);
      display: out std_logic_vector(6 downto 0)
    );
  end component;

  signal e : std_logic_vector(1 downto 0);
  signal sel, z, y: std_logic;
  signal display: std_logic_vector(6 downto 0);
  signal bd1, bd2 : std_logic_vector(3 downto 0);
  signal m: std_logic_vector(3 downto 0);
begin
  deco1: deco port map(e, bd1, z);
  deco2: deco port map(e, bd2, y );
  mux1: mux port map(bd1 , bd2 , m , sel );
  convertidor1: convertidor port map(m , display );

  process begin
    e <= "11";
    sel <= '0';
    z <= '0';
    y <= '0';
    wait for 1 ns;
    assert (display = "1001111") report "Error en 0";

    e <= "00";
    sel <= '0';
    z <= '1';
    y <= '1';
    wait for 1 ns;
    assert (display = "0110000") report "Error en 1";

    e <= "01";
    sel <= '1';
    z <= '1';
    y <= '1';
    wait for 1 ns;
    assert (display = "1101101") report "Error en 2";

    e <= "10";
    sel <= '1';
    z <= '1';
    y <= '1';
    wait for 1 ns;
    assert (display = "0110011") report "Error en 4";

    e <= "11";
    sel <= '1';
    z <= '1';
    y <= '1';
    wait for 1 ns;
    assert (display = "1111111") report "Error en 8";

    assert false report "Fin de Prueba";
    wait;
  end process;

end architecture a_examen;