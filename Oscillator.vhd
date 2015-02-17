-- Original Author	: Bharathwaj Muthuswamy
-- Additional Author : Peter Crinklaw
-- Based on version by	: Eric Lunty, Kyle Brooks, Peter Roland
-- http://www.ece.ualberta.ca/~elliott/ece492/appnotes/2012w/Audio_Codec_G2/waveform_gen.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Oscillator is

port (

  -- system signals
  clk         : in  std_logic;
  reset_n       : in  std_logic;
  
  -- NCO frequency control
  phase_inc   : in  std_logic_vector(31 downto 0);
  phase_inc_enable   : in  std_logic;
  
  -- Output waveforms
  sin_out     : out std_logic_vector(11 downto 0);
  squ_out     : out std_logic_vector(11 downto 0);
  saw_out     : out std_logic_vector(11 downto 0)  
  );
end entity;


architecture rtl of Oscillator is


component SinLut

port 
	(
	clk      : in  std_logic;
	--en       : in  std_logic;
	
	--Address input
	addr     : in  std_logic_vector(11 downto 0);
	
	--Sine output
	sin_out  : out std_logic_vector(11 downto 0)
	);
end component;

signal  phase_acc     : std_logic_vector(31 downto 0);
signal  phase_inc_s     : std_logic_vector(31 downto 0);
signal  lut_addr      : std_logic_vector(11 downto 0);
signal  lut_addr_reg  : std_logic_vector(11 downto 0);
signal  phase_inc_hardcoded : std_logic_vector(31 downto 0) := x"20000000";

begin


--------------------------------------------------------------------------
-- Phase accumulator increments by 'phase_inc' every clock cycle        --
-- Output frequency determined by formula: Phase_inc = (Fout/Fclk)*2^32 --
-- E.g. Fout = 36MHz, Fclk = 100MHz,  Phase_inc = 36*2^32/100           --
-- Frequency resolution is 100MHz/2^32 = 0.00233Hz                      --
--------------------------------------------------------------------------

update_phase_inc:
	process( reset_n, phase_inc_enable ) is
		-- Declaration(s)
	begin
		if ( reset_n = '0' ) then
				phase_inc_s <= x"00000000";
		elsif (phase_inc_enable = '0') then
				phase_inc_s <= phase_inc;
		end if;
	end process;
	

phase_acc_reg: process(clk, reset_n)
begin
  if reset_n = '0' then
    	phase_acc <= (others => '0');

  elsif clk'event and clk = '1' then
    --if en = '1' then
      	phase_acc <= unsigned(phase_acc) + unsigned(phase_inc_s);  
    --end if;
  end if;
end process phase_acc_reg;

---------------------------------------------------------------------
-- use top 12-bits of phase accumulator to address the SIN LUT --
---------------------------------------------------------------------

lut_addr <= phase_acc(31 downto 20);

----------------------------------------------------------------------
-- SIN LUT is 4096 by 12-bit ROM                                    --
-- 12-bit output allows sin amplitudes between 2047 and -2047       --
-- (-2048 not used to keep the output signal perfectly symmetrical) --
-- Phase resolution is 2Pi/4096 = 0.088 degrees                     --
----------------------------------------------------------------------

lut: SinLut

  port map
  (
    	clk       => clk,
    	--en        => en,
    	addr      => lut_addr,
		sin_out   => sin_out
  );

---------------------------------
-- Hide the latency of the LUT --
---------------------------------

delay_regs: process(clk)
begin
  if clk'event and clk = '1' then
    --if en = '1' then
      	lut_addr_reg <= lut_addr;
    --end if;
  end if;
end process delay_regs;

---------------------------------------------
-- Square output is msb of the accumulator --
---------------------------------------------

squ_out <= "001111111111" when lut_addr_reg(11) = '1' else "110000000000";

-------------------------------------------------------
-- Sawtooth output is top 12-bits of the accumulator --
-------------------------------------------------------

saw_out <= lut_addr_reg(11 downto 0);

end rtl;