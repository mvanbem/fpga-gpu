# TCL File Generated by Component Editor 21.1
# Sat Jul 09 17:08:27 PDT 2022
# DO NOT MODIFY


# 
# fake_sink "fake_sink" v21.1
#  2022.07.09.17:08:27
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module fake_sink
# 
set_module_property DESCRIPTION ""
set_module_property NAME fake_sink
set_module_property VERSION 21.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME fake_sink
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL fake_sink
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file fake_sink.sv SYSTEM_VERILOG PATH fake_sink.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter DATA_WIDTH INTEGER 24 ""
set_parameter_property DATA_WIDTH DEFAULT_VALUE 24
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH WIDTH ""
set_parameter_property DATA_WIDTH TYPE INTEGER
set_parameter_property DATA_WIDTH ENABLED false
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DATA_WIDTH DESCRIPTION ""
set_parameter_property DATA_WIDTH HDL_PARAMETER true
add_parameter COUNTER_WIDTH INTEGER 8 ""
set_parameter_property COUNTER_WIDTH DEFAULT_VALUE 8
set_parameter_property COUNTER_WIDTH DISPLAY_NAME COUNTER_WIDTH
set_parameter_property COUNTER_WIDTH TYPE INTEGER
set_parameter_property COUNTER_WIDTH ENABLED false
set_parameter_property COUNTER_WIDTH UNITS None
set_parameter_property COUNTER_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property COUNTER_WIDTH DESCRIPTION ""
set_parameter_property COUNTER_WIDTH HDL_PARAMETER true


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clk
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point clk
# 
add_interface clk clock end
set_interface_property clk clockRate 0
set_interface_property clk ENABLED true
set_interface_property clk EXPORT_OF ""
set_interface_property clk PORT_NAME_MAP ""
set_interface_property clk CMSIS_SVD_VARIABLES ""
set_interface_property clk SVD_ADDRESS_GROUP ""

add_interface_port clk clk clk Input 1


# 
# connection point num_values
# 
add_interface num_values conduit end
set_interface_property num_values associatedClock clk
set_interface_property num_values associatedReset ""
set_interface_property num_values ENABLED true
set_interface_property num_values EXPORT_OF ""
set_interface_property num_values PORT_NAME_MAP ""
set_interface_property num_values CMSIS_SVD_VARIABLES ""
set_interface_property num_values SVD_ADDRESS_GROUP ""

add_interface_port num_values num_values new_signal Output 8


# 
# connection point stall
# 
add_interface stall conduit end
set_interface_property stall associatedClock clk
set_interface_property stall associatedReset ""
set_interface_property stall ENABLED true
set_interface_property stall EXPORT_OF ""
set_interface_property stall PORT_NAME_MAP ""
set_interface_property stall CMSIS_SVD_VARIABLES ""
set_interface_property stall SVD_ADDRESS_GROUP ""

add_interface_port stall stall new_signal Input 1


# 
# connection point last_value
# 
add_interface last_value conduit end
set_interface_property last_value associatedClock clk
set_interface_property last_value associatedReset ""
set_interface_property last_value ENABLED true
set_interface_property last_value EXPORT_OF ""
set_interface_property last_value PORT_NAME_MAP ""
set_interface_property last_value CMSIS_SVD_VARIABLES ""
set_interface_property last_value SVD_ADDRESS_GROUP ""

add_interface_port last_value last_value new_signal Output 24


# 
# connection point st
# 
add_interface st avalon_streaming end
set_interface_property st associatedClock clk
set_interface_property st associatedReset reset
set_interface_property st dataBitsPerSymbol 24
set_interface_property st errorDescriptor ""
set_interface_property st firstSymbolInHighOrderBits true
set_interface_property st maxChannel 0
set_interface_property st readyLatency 0
set_interface_property st ENABLED true
set_interface_property st EXPORT_OF ""
set_interface_property st PORT_NAME_MAP ""
set_interface_property st CMSIS_SVD_VARIABLES ""
set_interface_property st SVD_ADDRESS_GROUP ""

add_interface_port st data data Input DATA_WIDTH
add_interface_port st valid valid Input 1
add_interface_port st ready ready Output 1

