library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity incisoD is
  port (
    bcd: in std_logic_vector(3 downto 0);
    display: out std_logic_vector(6 downto 0)
  );
end entity incisoD;

architecture AIncisoD of incisoD is
begin
process(bcd)
  case bcd is
    when "0000" =>
      display <= "0110111";
    when "0001" =>
      display <= "0111110";
    when "0010" =>
      display <= "0010101";
    when "0011" =>
      display <= "0011111";
    when "0100" =>
      display <= "1001111";
    when "0101" =>
      display <= "0000101";
    when others =>
      display <= "0000000";
  end case;
end process;
end architecture AIncisoD;
