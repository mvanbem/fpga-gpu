create_clock -name {CLOCK_50} -period 20.000 [get_ports {CLOCK_50}]
derive_pll_clocks
derive_clock_uncertainty

set_output_delay -clock { display_pll0|*|clk[0] } 5 [get_ports { \
	LTM_R* LTM_G* LTM_B* LTM_NCLK LTM_DEN LTM_HD LTM_VD \
	}]

# Intentional registered clock domain crossings.
set_false_path -from {scanout:scanout0|reset_writer} -to {scanout_sreset_sync}

# Ignore false path. This is safe because "Add circuit to synchronize `aclr' input with `wrclk'" is enabled.
# See FIFO Intel® FPGA IP User Guide for Quartus Prime 18.0
set_false_path \
	-from {scanout:scanout0|reset_writer} \
	-to {*dcfifo:dcfifo_component|dcfifo_*:auto_generated|dffpipe_*:wraclr|dffe*a[0]}
