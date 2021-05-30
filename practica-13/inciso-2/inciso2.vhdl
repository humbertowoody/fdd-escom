library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inciso2 is
  port (
    e: in std_logic_vector(1 downto 0);
    z, y: in std_logic;
    d, c: out std_logic_vector(3 downto 0)
  );
end entity inciso2;

architecture AInciso2 of inciso2 is
  
begin
  
  decoA: process(e,z)
  begin
    if (z = '1') then
      if(e = "00") then
        d <= "0001";
      elsif (e = "01") then
        d <= "0010";
      elsif (e = "10") then
        d <= "0100";
      elsif (e = "11") then
        d <= "1000";
      else
        d <= "0000";
      end if;
    else
      d <= "0000";
    end if;
  end process decoA;

  decoB: process(e,y)
  begin
    if (y = '1') then
      if(e = "00") then
        c <= "0001";
      elsif (e = "01") then
        c <= "0010";
      elsif (e = "10") then
        c <= "0100";
      elsif (e = "11") then
        c <= "1000";
      else 
        c <= "0000";
      end if;
    else
      c <= "0000";
    end if;
  end process decoB;
  
end architecture AInciso2;