
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

-- entity declaration for your testbench.Dont declare any ports here
ENTITY WaveformGenerator_tb IS
  
END WaveformGenerator_tb;

ARCHITECTURE behavior OF WaveformGenerator_tb IS
   -- Component Declaration for the Unit Under Test (UUT)
   
component waveform_gen is

port (

  -- system signals
  clk         : in  std_logic;
  reset       : in  std_logic;
  
  -- clock-enable
  en          : in  std_logic;
  
  -- NCO frequency control
  phase_inc   : in  std_logic_vector(31 downto 0);
  
  -- Output waveforms
  coe_sin_out     : out std_logic_vector(11 downto 0);
  coe_squ_out     : out std_logic_vector(11 downto 0);
  coe_saw_out     : out std_logic_vector(11 downto 0)  
  );
end component waveform_gen;

   --declare inputs and initialize them
   signal clk : std_logic := '0';
  signal coe_sin_out     :  std_logic_vector(11 downto 0);
  signal  coe_squ_out     :  std_logic_vector(11 downto 0);
  signal  coe_saw_out     :  std_logic_vector(11 downto 0)  ;
  
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: midiGenerator PORT MAP (
          clk => clk,
          laser_n => laser_n,
          midiData => midiData
          
            -- system signals
  clk         => clk;
  reset       => '1';
  
  -- clock-enable
  en          => '1';
  
  -- NCO frequency control
  phase_inc   => x"20000000";
  
  -- Output waveforms
  coe_sin_out  => coe_sin_out;
  coe_squ_out  => coe_squ_out;
  coe_saw_out  => coe_saw_out;
  coe_squ_out     : out std_logic_vector(11 downto 0);
  coe_saw_out     : out std_logic_vector(11 downto 0)  
		--  Peter => Peter
        );      

   -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
   -- Stimulus process
  stim_proc: process
   begin        
        wait for 40 ns;
        laser_n <= '0';
        wait for 400 ns;
        laser_n <='1';
        wait;
  end process;

END;