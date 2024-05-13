library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity registerBank is
    port
        (
        outData      : out unsigned(15 downto 0);
        inData       : in  unsigned(15 downto 0);
        writeSel     : in  unsigned(2 downto 0);
        outSel       : in unsigned(2 downto 0);
        wr_en        : in std_logic;
        clk          : in std_logic;
        reset        : in std_logic
        );
end entity;

architecture rtl of registerBank is
    component register16bits is
        port (
            clk      : in std_logic;
            reset    : in std_logic;
            wr_en    : in std_logic;
            data_in  : in unsigned(15 downto 0);
            data_out : out unsigned(15 downto 0)
        );
    end component;
signal r0_en, r1_en, r2_en, r3_en, r4_en, r5_en, r6_en, r7_en    : std_logic := '0';
signal outS1Data,
       outS2Data,
       outS3Data,
       outS4Data, 
       outS5Data, 
       outS6Data,
       outS7Data,
       outS0Data                                                 : unsigned(15 downto 0) := "0000000000000000";

begin
r0 : register16bits port map (clk => clk, reset => reset, wr_en => r0_en, data_in => inData, data_out => outS0Data);
r1 : register16bits port map (clk => clk, reset => reset, wr_en => r1_en, data_in => inData, data_out => outS1Data);
r2 : register16bits port map (clk => clk, reset => reset, wr_en => r2_en, data_in => inData, data_out => outS2Data);
r3 : register16bits port map (clk => clk, reset => reset, wr_en => r3_en, data_in => inData, data_out => outS3Data);
r4 : register16bits port map (clk => clk, reset => reset, wr_en => r4_en, data_in => inData, data_out => outS4Data);
r5 : register16bits port map (clk => clk, reset => reset, wr_en => r5_en, data_in => inData, data_out => outS5Data);
r6 : register16bits port map (clk => clk, reset => reset, wr_en => r6_en, data_in => inData, data_out => outS6Data);
r7 : register16bits port map (clk => clk, reset => reset, wr_en => r7_en, data_in => inData, data_out => outS7Data);

r0_en <= '1' when writeSel = "000" and wr_en = '1' else '0';
r1_en <= '1' when writeSel = "001" and wr_en = '1' else '0';
r2_en <= '1' when writeSel = "010" and wr_en = '1' else '0';
r3_en <= '1' when writeSel = "011" and wr_en = '1' else '0';
r4_en <= '1' when writeSel = "100" and wr_en = '1' else '0';
r5_en <= '1' when writeSel = "101" and wr_en = '1' else '0';
r6_en <= '1' when writeSel = "110" and wr_en = '1' else '0';
r7_en <= '1' when writeSel = "111" and wr_en = '1' else '0';

outData <= outS0Data when outSel = "000" else
       outS1Data when outSel = "001" else
       outS2Data when outSel = "010" else
       outS3Data when outSel = "011" else
       outS4Data when outSel = "100" else
       outS5Data when outSel = "101" else
       outS6Data when outSel = "110" else
       outS7Data when outSel = "111" else
        "0000000000000000";

end architecture;