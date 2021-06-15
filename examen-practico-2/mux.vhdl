library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is
  port (
    dz, dy: in std_logic_vector(3 downto 0);
    m: out std_logic_vector(3 downto 0);
    sel: in std_logic
  );
end entity mux;

architecture a_mux of mux is
begin
process(sel,dz,dy)
begin
  if (sel = '0') then
    m <= dz;
  else
    m <= dy;
  end if;
end process;
end architecture a_mux;
