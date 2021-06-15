-- Definición principal del sumador de dos bits.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Sumador de dos bits.
entity sumador is
  port (
    a,b : in std_logic_vector(1 downto 0);
    s: out std_logic_vector(1 downto 0);
    cin: in std_logic;
    co: out std_logic
  );
end entity sumador;

-- Comportamiento del sumador de dos bits
architecture a_sumador of sumador is
  -- Señal para el sumador.
  Signal c: std_logic_vector(2 downto 0);
begin
  -- Leemos la entrada principal.
  c(0) <= cin;

  -- Aplicamos ecuaciones de suma.
  s(0) <= a(0) xor b(0) xor c(0);
  c(1) <= (b(0) and c(0)) or (a(0) and c(0)) or (a(0) and b(0));
  s(1) <= a(1) xor b(1) xor c(1);
  c(2) <= (b(1) and c(1)) or (a(1) and c(1)) or (a(1) and b(1));

  -- Asignamos el resultado.
  co <= c(2);
end architecture a_sumador;