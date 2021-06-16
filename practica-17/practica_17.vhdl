-- Práctica 17, integración de componentes.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entidad para la práctica (vacía)
entity practica_17 is
end entity practica_17;

-- Arquitectura para la práctica
architecture a_practica_17 of practica_17 is
  -- Componente multiplexor
  component multiplexor
    port (
      a, b: in std_logic_vector(2 downto 0);
      sel: in std_logic;
      mux: out std_logic_vector(2 downto 0)
    );
  end component;

  -- Componente comparador
  component comparador
    port (
      mux, ref: in std_logic_vector(2 downto 0);
      res: out std_logic_vector(2 downto 0)
    );
  end component;

  -- Componente convertidor
  component convertidor
    port (
      res: in std_logic_vector(2 downto 0);
      display: out std_logic_vector(6 downto 0)
    );
  end component;

  -- Señales para entradas/salidas
  signal a, b, mux, ref, res : std_logic_vector(2 downto 0);
  signal sel: std_logic;
  signal display: std_logic_vector(6 downto 0);
begin
  -- Componentes con sus port maps.
  mux1: multiplexor port map(
    a => a,
    b => b,
    sel => sel,
    mux => mux
  );
  comp1: comparador port map(
    mux => mux,
    ref => ref,
    res => res
  );
  conv1: convertidor port map(
    res => res,
    display => display
  );
  
  -- Proceso para prueba de la práctica.
  prueba_practica_17: process
  begin
    -- Primer caso
    a <= "100"; -- 4
    b <= "011"; -- 3
    sel <= '0'; -- 0
    ref <= "101"; -- 5
    wait for 1 ns;

    -- Segundo caso
    a <= "011"; -- 3
    b <= "110"; -- 6
    sel <= '1'; -- 1
    ref <= "011"; -- 3
    wait for 1 ns;

    -- Tercer caso
    a <= "101"; -- 5
    b <= "010"; -- 2
    sel <= '1'; -- 1
    ref <= "001"; -- 1
    wait for 1 ns;

    -- Cuarto caso
    a <= "001"; -- 1
    b <= "000"; -- 0
    sel <= '0'; -- 0
    ref <= "111"; -- 7
    wait for 1 ns;

    -- Quinto caso
    a <= "000"; -- 0
    b <= "111"; -- 7
    sel <= '1'; -- 1
    ref <= "100"; -- 4
    wait for 1 ns;

    -- Finalización de simulación.
    assert false report "Fin de la prueba";
    wait;
  end process prueba_practica_17;
end architecture a_practica_17;
