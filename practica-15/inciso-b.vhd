library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity incisoB is
  port (
    bcd: in std_logic_vector(3 downto 0);
    display: out std_logic_vector(6 downto 0)
  );
end entity incisoB;

architecture AIncisoB of incisoB is
begin
  if (bcd = "0000") then
    display <= "0000001";
  elsif (bcd = "0001") then
    display <= "1001111";
  elsif (bcd = "0010") then
    display <= "0010010";
  elsif (bcd = "0011") then
    display <= "0000110";
  elsif (bcd = "0100") then
    display <= "1001100";
  elsif (bcd = "0101") then
    display <= "0100100";
  elsif (bcd = "0110") then
    display <= "0001111";
  elsif (bcd = "0111") then
    display <= "0001111";
  elsif (bcd = "1000") then
    display <= "0000000";
  elsif (bcd = "1001") then
    display <= "0000100";
  else
    display <= "0000000";
  end if;
end architecture AIncisoB;
