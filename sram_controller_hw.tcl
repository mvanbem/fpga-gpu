# TCL File Generated by Component Editor 21.1
# Sat Jul 09 18:54:32 PDT 2022
# DO NOT MODIFY


# 
# sram_controller "sram_controller" v21.1
#  2022.07.09.18:54:32
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module sram_controller
# 
set_module_property DESCRIPTION ""
set_module_property NAME sram_controller
set_module_property VERSION 21.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME sram_controller
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL sram_controller
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file sram_controller.sv SYSTEM_VERILOG PATH sram_controller.sv TOP_LEVEL_FILE


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

add_interface_port clk clk clk Input 1


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
# connection point sram_addr
# 
add_interface sram_addr conduit end
set_interface_property sram_addr associatedClock clk
set_interface_property sram_addr associatedReset ""
set_interface_property sram_addr ENABLED true
set_interface_property sram_addr EXPORT_OF ""
set_interface_property sram_addr PORT_NAME_MAP ""
set_interface_property sram_addr CMSIS_SVD_VARIABLES ""
set_interface_property sram_addr SVD_ADDRESS_GROUP ""

add_interface_port sram_addr sram_addr new_signal Output 20


# 
# connection point sram_dq
# 
add_interface sram_dq conduit end
set_interface_property sram_dq associatedClock clk
set_interface_property sram_dq associatedReset ""
set_interface_property sram_dq ENABLED true
set_interface_property sram_dq EXPORT_OF ""
set_interface_property sram_dq PORT_NAME_MAP ""
set_interface_property sram_dq CMSIS_SVD_VARIABLES ""
set_interface_property sram_dq SVD_ADDRESS_GROUP ""

add_interface_port sram_dq sram_dq new_signal Bidir 16


# 
# connection point sram_oe_n
# 
add_interface sram_oe_n conduit end
set_interface_property sram_oe_n associatedClock clk
set_interface_property sram_oe_n associatedReset ""
set_interface_property sram_oe_n ENABLED true
set_interface_property sram_oe_n EXPORT_OF ""
set_interface_property sram_oe_n PORT_NAME_MAP ""
set_interface_property sram_oe_n CMSIS_SVD_VARIABLES ""
set_interface_property sram_oe_n SVD_ADDRESS_GROUP ""

add_interface_port sram_oe_n sram_oe_n new_signal Output 1


# 
# connection point sram_ce_n
# 
add_interface sram_ce_n conduit end
set_interface_property sram_ce_n associatedClock clk
set_interface_property sram_ce_n associatedReset ""
set_interface_property sram_ce_n ENABLED true
set_interface_property sram_ce_n EXPORT_OF ""
set_interface_property sram_ce_n PORT_NAME_MAP ""
set_interface_property sram_ce_n CMSIS_SVD_VARIABLES ""
set_interface_property sram_ce_n SVD_ADDRESS_GROUP ""

add_interface_port sram_ce_n sram_ce_n new_signal Output 1


# 
# connection point sram_we_n
# 
add_interface sram_we_n conduit end
set_interface_property sram_we_n associatedClock clk
set_interface_property sram_we_n associatedReset ""
set_interface_property sram_we_n ENABLED true
set_interface_property sram_we_n EXPORT_OF ""
set_interface_property sram_we_n PORT_NAME_MAP ""
set_interface_property sram_we_n CMSIS_SVD_VARIABLES ""
set_interface_property sram_we_n SVD_ADDRESS_GROUP ""

add_interface_port sram_we_n sram_we_n new_signal Output 1


# 
# connection point mm
# 
add_interface mm avalon end
set_interface_property mm addressUnits WORDS
set_interface_property mm associatedClock clk
set_interface_property mm associatedReset reset
set_interface_property mm bitsPerSymbol 8
set_interface_property mm burstOnBurstBoundariesOnly false
set_interface_property mm burstcountUnits WORDS
set_interface_property mm explicitAddressSpan 0
set_interface_property mm holdTime 0
set_interface_property mm linewrapBursts false
set_interface_property mm maximumPendingReadTransactions 0
set_interface_property mm maximumPendingWriteTransactions 0
set_interface_property mm readLatency 0
set_interface_property mm readWaitStates 2
set_interface_property mm readWaitTime 2
set_interface_property mm setupTime 0
set_interface_property mm timingUnits Cycles
set_interface_property mm writeWaitTime 0
set_interface_property mm ENABLED true
set_interface_property mm EXPORT_OF ""
set_interface_property mm PORT_NAME_MAP ""
set_interface_property mm CMSIS_SVD_VARIABLES ""
set_interface_property mm SVD_ADDRESS_GROUP ""

add_interface_port mm mm_address address Input 20
add_interface_port mm mm_read read Input 1
add_interface_port mm mm_readdata readdata Output 16
add_interface_port mm mm_write write Input 1
add_interface_port mm mm_writedata writedata Input 16
set_interface_assignment mm embeddedsw.configuration.isFlash 0
set_interface_assignment mm embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment mm embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment mm embeddedsw.configuration.isPrintableDevice 0

