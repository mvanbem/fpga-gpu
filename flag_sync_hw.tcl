# TCL File Generated by Component Editor 21.1
# Mon Jul 04 18:50:41 PDT 2022
# DO NOT MODIFY


# 
# flag_sync "flag_sync" v21.1
#  2022.07.04.18:50:41
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module flag_sync
# 
set_module_property DESCRIPTION ""
set_module_property NAME flag_sync
set_module_property VERSION 21.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME flag_sync
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL flag_sync
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file flag_sync.sv SYSTEM_VERILOG PATH flag_sync.sv TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point in_clk
# 
add_interface in_clk clock end
set_interface_property in_clk clockRate 0
set_interface_property in_clk ENABLED true
set_interface_property in_clk EXPORT_OF ""
set_interface_property in_clk PORT_NAME_MAP ""
set_interface_property in_clk CMSIS_SVD_VARIABLES ""
set_interface_property in_clk SVD_ADDRESS_GROUP ""

add_interface_port in_clk in_clk clk Input 1


# 
# connection point out_clk
# 
add_interface out_clk clock end
set_interface_property out_clk clockRate 0
set_interface_property out_clk ENABLED true
set_interface_property out_clk EXPORT_OF ""
set_interface_property out_clk PORT_NAME_MAP ""
set_interface_property out_clk CMSIS_SVD_VARIABLES ""
set_interface_property out_clk SVD_ADDRESS_GROUP ""

add_interface_port out_clk out_clk clk Input 1


# 
# connection point in
# 
add_interface in conduit end
set_interface_property in associatedClock in_clk
set_interface_property in associatedReset ""
set_interface_property in ENABLED true
set_interface_property in EXPORT_OF ""
set_interface_property in PORT_NAME_MAP ""
set_interface_property in CMSIS_SVD_VARIABLES ""
set_interface_property in SVD_ADDRESS_GROUP ""

add_interface_port in in_flag next_frame Input 1


# 
# connection point out
# 
add_interface out conduit end
set_interface_property out associatedClock out_clk
set_interface_property out associatedReset ""
set_interface_property out ENABLED true
set_interface_property out EXPORT_OF ""
set_interface_property out PORT_NAME_MAP ""
set_interface_property out CMSIS_SVD_VARIABLES ""
set_interface_property out SVD_ADDRESS_GROUP ""

add_interface_port out out_flag next_frame Output 1

