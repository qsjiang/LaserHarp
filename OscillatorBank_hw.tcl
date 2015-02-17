# TCL File Generated by Component Editor 12.1sp1
# Tue Feb 17 14:31:11 MST 2015
# DO NOT MODIFY


# 
# OscillatorBank "OscillatorBank" v1.0
# null 2015.02.17.14:31:11
# 
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module OscillatorBank
# 
set_module_property NAME OscillatorBank
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME OscillatorBank
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL OscillatorBank
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file OscillatorBank.vhd VHDL PATH OscillatorBank.vhd
add_fileset_file Oscillator.vhd VHDL PATH Oscillator.vhd
add_fileset_file SinLut.vhd VHDL PATH SinLut.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset_n reset_n Input 1


# 
# connection point oscillator0_phase_inc
# 
add_interface oscillator0_phase_inc avalon end
set_interface_property oscillator0_phase_inc addressUnits WORDS
set_interface_property oscillator0_phase_inc associatedClock clock
set_interface_property oscillator0_phase_inc associatedReset reset
set_interface_property oscillator0_phase_inc bitsPerSymbol 8
set_interface_property oscillator0_phase_inc burstOnBurstBoundariesOnly false
set_interface_property oscillator0_phase_inc burstcountUnits WORDS
set_interface_property oscillator0_phase_inc explicitAddressSpan 0
set_interface_property oscillator0_phase_inc holdTime 0
set_interface_property oscillator0_phase_inc linewrapBursts false
set_interface_property oscillator0_phase_inc maximumPendingReadTransactions 0
set_interface_property oscillator0_phase_inc readLatency 0
set_interface_property oscillator0_phase_inc readWaitTime 1
set_interface_property oscillator0_phase_inc setupTime 0
set_interface_property oscillator0_phase_inc timingUnits Cycles
set_interface_property oscillator0_phase_inc writeWaitTime 0
set_interface_property oscillator0_phase_inc ENABLED true

add_interface_port oscillator0_phase_inc avs_writedata_oscillator0_phase_inc writedata Input 32
add_interface_port oscillator0_phase_inc avs_write_n_oscillator0_phase_inc write_n Input 1
set_interface_assignment oscillator0_phase_inc embeddedsw.configuration.isFlash 0
set_interface_assignment oscillator0_phase_inc embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment oscillator0_phase_inc embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment oscillator0_phase_inc embeddedsw.configuration.isPrintableDevice 0


# 
# connection point oscillator1_phase_inc
# 
add_interface oscillator1_phase_inc avalon end
set_interface_property oscillator1_phase_inc addressUnits WORDS
set_interface_property oscillator1_phase_inc associatedClock clock
set_interface_property oscillator1_phase_inc associatedReset reset
set_interface_property oscillator1_phase_inc bitsPerSymbol 8
set_interface_property oscillator1_phase_inc burstOnBurstBoundariesOnly false
set_interface_property oscillator1_phase_inc burstcountUnits WORDS
set_interface_property oscillator1_phase_inc explicitAddressSpan 0
set_interface_property oscillator1_phase_inc holdTime 0
set_interface_property oscillator1_phase_inc linewrapBursts false
set_interface_property oscillator1_phase_inc maximumPendingReadTransactions 0
set_interface_property oscillator1_phase_inc readLatency 0
set_interface_property oscillator1_phase_inc readWaitTime 1
set_interface_property oscillator1_phase_inc setupTime 0
set_interface_property oscillator1_phase_inc timingUnits Cycles
set_interface_property oscillator1_phase_inc writeWaitTime 0
set_interface_property oscillator1_phase_inc ENABLED true

add_interface_port oscillator1_phase_inc avs_writedata_oscillator1_phase_inc writedata Input 32
add_interface_port oscillator1_phase_inc avs_write_n_oscillator1_phase_inc write_n Input 1
set_interface_assignment oscillator1_phase_inc embeddedsw.configuration.isFlash 0
set_interface_assignment oscillator1_phase_inc embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment oscillator1_phase_inc embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment oscillator1_phase_inc embeddedsw.configuration.isPrintableDevice 0


# 
# connection point oscillator2_phase_inc
# 
add_interface oscillator2_phase_inc avalon end
set_interface_property oscillator2_phase_inc addressUnits WORDS
set_interface_property oscillator2_phase_inc associatedClock clock
set_interface_property oscillator2_phase_inc associatedReset reset
set_interface_property oscillator2_phase_inc bitsPerSymbol 8
set_interface_property oscillator2_phase_inc burstOnBurstBoundariesOnly false
set_interface_property oscillator2_phase_inc burstcountUnits WORDS
set_interface_property oscillator2_phase_inc explicitAddressSpan 0
set_interface_property oscillator2_phase_inc holdTime 0
set_interface_property oscillator2_phase_inc linewrapBursts false
set_interface_property oscillator2_phase_inc maximumPendingReadTransactions 0
set_interface_property oscillator2_phase_inc readLatency 0
set_interface_property oscillator2_phase_inc readWaitTime 1
set_interface_property oscillator2_phase_inc setupTime 0
set_interface_property oscillator2_phase_inc timingUnits Cycles
set_interface_property oscillator2_phase_inc writeWaitTime 0
set_interface_property oscillator2_phase_inc ENABLED true

add_interface_port oscillator2_phase_inc avs_writedata_oscillator2_phase_inc writedata Input 32
add_interface_port oscillator2_phase_inc avs_write_n_oscillator2_phase_inc write_n Input 1
set_interface_assignment oscillator2_phase_inc embeddedsw.configuration.isFlash 0
set_interface_assignment oscillator2_phase_inc embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment oscillator2_phase_inc embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment oscillator2_phase_inc embeddedsw.configuration.isPrintableDevice 0

