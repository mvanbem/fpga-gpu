create_clock -name {CLOCK_50} -period 20.000 [get_ports {CLOCK_50}]
derive_pll_clocks
derive_clock_uncertainty

set clk_core {u0|core_pll|*|clk[0]}
set clk_scanout {u0|scanout_pll|*|clk[0]}

# Outputs to the LTM LCD module.
set_output_delay \
    -clock $clk_scanout \
    5 \
    [get_ports {LTM_R[*] LTM_G[*] LTM_B[*] LTM_NCLK LTM_DEN LTM_HD LTM_VD}]

# Intentional registered clock domain crossings.
set_false_path -from {u0|display_scanout|out_next_frame} -to {u0|flag_sync|in_flag_q}
