library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity processador_tb is
end entity;

architecture tb of processador_tb is
  component uProcessor is
    port
    (
      clk_in    : in std_logic;
      reset     : in std_logic;
      exception : out std_logic;
      crivoOut  : out unsigned(15 downto 0)
    );
  end component;
  signal primos              : unsigned(15 downto 0) := "0000000000000000";
  signal clk, reset, exception : std_logic             := '0';
  signal finished              : std_logic             := '0';
  constant period_time         : time                  := 100 ns;
begin
  uut : uProcessor port map
  (
    clk_in    => clk,
    reset     => reset,
    exception => exception,
    crivoOut => primos
  );
  reset_global : process
  begin
    reset <= '1';
    wait for period_time * 2;
    reset <= '0';
    wait;
  end process;

  sim_time_proc : process
  begin
    wait for 900 us;
    finished <= '1';
    wait;
  end process sim_time_proc;

  clk_proc : process
  begin
    while finished /= '1' loop
      clk <= '0';
      wait for period_time/2;
      clk <= '1';
      wait for period_time/2;
    end loop;
    wait;
  end process clk_proc;

end architecture;