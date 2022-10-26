library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test is
  port (
    e: in std_logic_vector(1 downto 0);
    sel, z, y: in std_logic;
    display: out std_logic_vector(6 downto 0);
  );
end entity test;

architecture test_a of test is
begin
process(e,sel,z,y,display)
begin
  if ((e = "11") and (sel = '0') and (z = '0') and (y = '0')) then
    display <= "1001111";
  else if ((e = "11") and (sel = '0') and (z = '0') and (y = '0')) then
    display <= "0110000";
  else if ((e = "11") and (sel = '0') and (z = '0') and (y = '0')) then
    display <= "1101101";
  else if ((e = "11") and (sel = '0') and (z = '0') and (y = '0')) then
    display <= "0110011";
  else
    display <= "1111111";
  end if;
end process;
end architecture test_a;