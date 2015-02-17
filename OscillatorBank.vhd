-- Original Author	: Bharathwaj Muthuswamy
-- Additional Author : Peter Crinklaw
-- Based on version by	: Eric Lunty, Kyle Brooks, Peter Roland
-- http://www.ece.ualberta.ca/~elliott/ece492/appnotes/2012w/Audio_Codec_G2/waveform_gen.vhd

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity OscillatorBank is

port (

  -- system signals
  clk         : in  std_logic;
  reset_n       : in  std_logic;
  
  -- NCO frequency control
	avs_writedata_oscillator0_phase_inc   : in  std_logic_vector(31 downto 0);
	avs_write_n_oscillator0_phase_inc   : in  std_logic;

	avs_writedata_oscillator1_phase_inc   : in  std_logic_vector(31 downto 0);
	avs_write_n_oscillator1_phase_inc   : in  std_logic;
	
	avs_writedata_oscillator2_phase_inc   : in  std_logic_vector(31 downto 0);
	avs_write_n_oscillator2_phase_inc   : in  std_logic
  );
end entity;


architecture rtl of OscillatorBank is


component Oscillator
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
end component;

signal wave0 : std_logic_vector(11 downto 0);
signal wave1 : std_logic_vector(11 downto 0);
signal wave2 : std_logic_vector(11 downto 0);

signal waveSum : std_logic_vector(11 downto 0);

begin

waveSum <= std_logic_vector( unsigned(wave0) + unsigned(wave1) + unsigned(wave2) );

o0: Oscillator
  port map
  (
	clk => clk,
	reset_n => reset_n,
	phase_inc => avs_writedata_oscillator0_phase_inc,
	phase_inc_enable => avs_write_n_oscillator0_phase_inc,
	sin_out => wave0,
	squ_out => wave1,
	saw_out => wave2
  );

end rtl;