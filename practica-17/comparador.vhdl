-- Comparador para la práctica 17
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entidad  del comparador.
entity comparador is
  port (
    mux, ref: in std_logic_vector(2 downto 0);
    res: out std_logic_vector(2 downto 0)
  );
end entity comparador;

-- Arquitectura del comparador.
architecture a_comparador of comparador is
begin
  -- Proceso apra el comparador con la lista sensible.
  proceso_comparador: process(mux,ref)
  begin
    if (mux = ref) then
      res <= "010";
    elsif (mux < ref) then
      res <= "001";
    else
      res <= "100";
    end if;
  end process proceso_comparador;
end architecture a_comparador;
