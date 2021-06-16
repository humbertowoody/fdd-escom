-- Multiplexor para Práctica 17
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entidad para el multiplexor.
entity multiplexor is
  port (
    a, b: in std_logic_vector(2 downto 0);
    sel: in std_logic;
    mux: out std_logic_vector(2 downto 0)
  );
end entity multiplexor;

-- Arquitectura para el multiplexor.
architecture a_multiplexor of multiplexor is
begin
  -- Creamos el proceso con la lista sensible de
  -- las dos entradas + el selector.
  proceso_multiplexor: process(a,b,sel)
  begin
    if (sel = '0') then
      mux <= b;
    else
      mux <= a;
    end if;
  end process proceso_multiplexor;
end architecture a_multiplexor;
