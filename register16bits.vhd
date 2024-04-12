library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity register16bits is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        enable: in std_logic;
        data_in  : in unsigned(15 downto 0);
        data_out : out unsigned(15 downto 0)
    );
end entity;

architecture rtl of register16bits is
    signal registro : unsigned(15 downto 0);
begin
    process(clk, reset, enable) 
    begin                
        if reset='1' then
          registro <= "0000000000000000";
      elsif enable='1' then
         if rising_edge(clk) then
            registro <= data_in;
         end if;
      end if;
   end process;
    data_out <= registro;
end architecture;