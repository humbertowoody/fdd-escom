library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity practica13 is
  port (
    a01: in std_logic_vector(1 downto 0);
    e, a2: in std_logic;
    y1, y2: out std_logic_vector(3 downto 0)
  );
end entity practica13;

architecture APractica13 of practica13 is
  signal e1, e2: std_logic;
begin
  -- Lógica para determinar el valor de e1.
  e1 <= e and (not a2);

  -- Lógica para determinar el valor de e2.
  e2 <= e and a2;

  -- Primer decodificador
  primerDeco: process(a01, e1)
  begin
    if (e1 = '1') then
      if(a01 = "00") then
        y1 <= "0001";
      elsif (a01 = "01") then
        y1 <= "0010";
      elsif(a01 ="10") then
        y1 <= "0100";
      else
        y1 <= "1000";
      end if;
    else
      y1 <= "0000";
    end if;
  end process primerDeco;
  
  -- Segundo decodificador
  segundoDeco: process(a01, e2)
  begin
    if (e2 = '1') then
      if(a01 = "00") then
        y2 <= "0001";
      elsif (a01 = "01") then
        y2 <= "0010";
      elsif(a01 ="10") then
        y2 <= "0100";
      else
        y2 <= "1000";
      end if;
    else
      y2 <= "0000";
    end if;
  end process segundoDeco;
end architecture APractica13;
