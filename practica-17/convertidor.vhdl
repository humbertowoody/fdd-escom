-- Convertidor de código para Práctica 17
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entidad para el convertidor de código
entity convertidor is
  port (
    res: in std_logic_vector(2 downto 0);
    display: out std_logic_vector(6 downto 0)
  );
end entity convertidor;

-- Arquitectura para el convertidor de código
architecture a_convertidor of convertidor is
begin
  -- Creamos el proceso del convertidor de código
  -- usando `res` como parte de la lista sensible.
  proceso_convertidor: process(res)
  begin
    case res is
      when "001" =>
        display <= "0001101";
      when "010" =>
        display <= "0001001";
      when "100" =>
        display <= "0011001";
      when others =>
        display <= "0000000";
    end case;
  end process proceso_convertidor;
end architecture a_convertidor;
