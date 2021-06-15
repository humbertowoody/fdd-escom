library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity deco is
  port(
    a : in std_logic_vector(1 downto 0);
    b : out std_logic_vector(3 downto 0);
    enable: in std_logic
  );
end deco;

architecture a_deco of deco is
begin
process(a,enable)
begin
  if (enable = '1') then
    case a is
      when "00" => b <= "0001"; 
      when "01" => b <= "0010"; 
      when "10" => b <= "0100"; 
      when "11" => b <= "1000";
      when others => b <= "0000";
    end case;
  else
    b <= "0000";
  end if;
end process;
end a_deco;

