-- Testbench para el Sumador de 2 bits.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- La entidad está vacía al ser un testbench
entity sumador_tb is
end entity sumador_tb;

-- Comportamiento del testbench
architecture prueba of sumador_tb is
  -- Componente sumador
  component sumador
    port (
      a,b : in std_logic_vector(1 downto 0);
      s: out std_logic_vector(1 downto 0);
      cin: in std_logic;
      co: out std_logic
    );
  end component sumador;

  -- Señales para mapeo de puertos.
  signal a,b: std_logic_vector(1 downto 0);
  signal s: std_logic_vector(1 downto 0);
  signal cin: std_logic;
  signal co: std_logic;
begin
  -- Mapeo de puertos para un sumador de 2 bits.
  sumadorDosBits: sumador port map(
    a => a,
    b => b,
    s => s,
    cin => cin,
    co => co
  );
  
  -- Proceso de prueba
  process begin
    
    -- Primer caso: 1 + 2 = 3
    a <= "01";
    b <= "10";
    cin <= '0';
    wait for 1 ns;
    assert (s = "11" and co = '0') report "Error en caso 1";

    -- Segundo caso: 0 + 1 = 1
    a <= "00";
    b <= "01";
    cin <= '0';
    wait for 1 ns;
    assert (s = "01" and co = '0') report "Error en caso 2";

    -- Tercer caso: 1 + 3 = 4
    a <= "01";
    b <= "11";
    cin <= '1';
    wait for 1 ns;
    assert (s = "01" and co = '1') report "Error en caso 3";

    -- Cuarto caso: 3 + 3 = 6
    a <= "11";
    b <= "11";
    cin <= '0';
    wait for 1 ns;
    assert (s = "10" and co = '1') report "Error en caso 4";

    -- Quinto caso: 2 + 3 = 5
    a <= "10";
    b <= "11";
    cin <= '1';
    wait for 1 ns;
    assert (s = "10" and co = '1') report "Error en caso 5";

    -- Mensaje final de simulación.
    assert false report "Fin de la prueba";
    wait;
  end process;
end architecture prueba;