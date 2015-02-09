library ieee;
	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

	-- Basic sequential functions and concurrent procedures
	use ieee.VITAL_Primitives.all;
	
	
entity LaserHarp is
	port
	(
		CLOCK_50	: in  std_logic;
		KEY		: in  std_logic_vector (0 downto 0)
	);
end LaserHarp;


architecture structure of LaserHarp is

	
	--component sub is
    --    port (
    --        clk_clk                                 : in    std_logic                     := 'X';             -- clk
    --        reset_reset_n                           : in    std_logic                     := 'X';             -- reset_n		  
	--		my_sev_seg_0_conduit_end_0_export : out   DE2_SEVEN_SEGMENT
    --    );
    --end component sub;


begin
	
		--u0 : component sub
        --port map (
		--	clk_clk                                 => CLOCK_50,                                
        --    reset_reset_n                           => KEY(0),  
		--	my_sev_seg_0_conduit_end_0_export => HEX0 
        --);

end structure;





