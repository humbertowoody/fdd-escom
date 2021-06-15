library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity convertidor is
  port (
    salida_mux: in std_logic_vector(3 downto 0);
    display: out std_logic_vector(6 downto 0)
  );
end entity convertidor;

architecture a_convertidor of convertidor is
begin
process(salida_mux)
begin
  case salida_mux is
    when "0000" =>
      display <= "1001111";
    when "0001" =>
      display <= "0110000";
    when "0010" =>
      display <= "1101101";
    when "0100" =>
      display <= "0110011";
    when "1000" =>
      display <= "1111111";
    when others =>
      display <= "0000000";
  end case;
end process;
end architecture a_convertidor;