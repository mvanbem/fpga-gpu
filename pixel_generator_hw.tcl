# TCL File Generated by Component Editor 21.1
# Thu Jul 07 09:07:28 PDT 2022
# DO NOT MODIFY


# 
# pixel_generator "pixel_generator" v21.1
#  2022.07.07.09:07:28
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module pixel_generator
# 
set_module_property DESCRIPTION ""
set_module_property NAME pixel_generator
set_module_property VERSION 21.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME pixel_generator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL pixel_generator
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file pixel_generator.sv SYSTEM_VERILOG PATH pixel_generator.sv TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


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

add_interface_port clk in_clk clk Input 1


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

add_interface_port reset in_reset_n reset_n Input 1


# 
# connection point pixel
# 
add_interface pixel avalon_streaming start
set_interface_property pixel associatedClock clk
set_interface_property pixel associatedReset reset
set_interface_property pixel dataBitsPerSymbol 24
set_interface_property pixel errorDescriptor ""
set_interface_property pixel firstSymbolInHighOrderBits true
set_interface_property pixel maxChannel 0
set_interface_property pixel readyLatency 1
set_interface_property pixel ENABLED true
set_interface_property pixel EXPORT_OF ""
set_interface_property pixel PORT_NAME_MAP ""
set_interface_property pixel CMSIS_SVD_VARIABLES ""
set_interface_property pixel SVD_ADDRESS_GROUP ""

add_interface_port pixel out_pixel_data data Output 24
add_interface_port pixel out_pixel_ready ready Input 1
add_interface_port pixel out_pixel_valid valid Output 1


# 
# connection point next_frame
# 
add_interface next_frame conduit end
set_interface_property next_frame associatedClock clk
set_interface_property next_frame associatedReset ""
set_interface_property next_frame ENABLED true
set_interface_property next_frame EXPORT_OF ""
set_interface_property next_frame PORT_NAME_MAP ""
set_interface_property next_frame CMSIS_SVD_VARIABLES ""
set_interface_property next_frame SVD_ADDRESS_GROUP ""

add_interface_port next_frame in_next_frame next_frame Input 1

