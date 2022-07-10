onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pixel_sram_test/clk
add wave -noupdate /pixel_sram_test/reset_n
add wave -noupdate /pixel_sram_test/u0/pixel_reader/next_frame
add wave -noupdate /pixel_sram_test/stall
add wave -noupdate -divider {Pixel Reader state}
add wave -noupdate /pixel_sram_test/u0/pixel_reader/state
add wave -noupdate /pixel_sram_test/u0/pixel_reader/x
add wave -noupdate /pixel_sram_test/u0/pixel_reader/y
add wave -noupdate /pixel_sram_test/u0/pixel_reader/registered_mm_readdata
add wave -noupdate -divider {Pixel Reader MM}
add wave -noupdate /pixel_sram_test/u0/pixel_reader/mm_address
add wave -noupdate /pixel_sram_test/u0/pixel_reader/mm_read
add wave -noupdate /pixel_sram_test/u0/pixel_reader/mm_readdata
add wave -noupdate /pixel_sram_test/u0/pixel_reader/mm_waitrequest
add wave -noupdate -divider {Pixel Writer MM}
add wave -noupdate /pixel_sram_test/u0/pixel_writer/mm_address
add wave -noupdate /pixel_sram_test/u0/pixel_writer/mm_write
add wave -noupdate /pixel_sram_test/u0/pixel_writer/mm_writedata
add wave -noupdate /pixel_sram_test/u0/pixel_writer/mm_waitrequest
add wave -noupdate -divider {SRAM MM}
add wave -noupdate /pixel_sram_test/u0/sram_controller/mm_address
add wave -noupdate /pixel_sram_test/u0/sram_controller/mm_read
add wave -noupdate /pixel_sram_test/u0/sram_controller/mm_readdata
add wave -noupdate /pixel_sram_test/u0/sram_controller/mm_write
add wave -noupdate /pixel_sram_test/u0/sram_controller/mm_writedata
add wave -noupdate -divider {SRAM Controller debug}
add wave -noupdate /pixel_sram_test/u0/sram_controller/sram_control
add wave -noupdate /pixel_sram_test/u0/sram_controller/state
add wave -noupdate /pixel_sram_test/u0/sram_controller/dq_value
add wave -noupdate /pixel_sram_test/u0/sram_controller/dq_assert
add wave -noupdate -divider {SRAM signals}
add wave -noupdate /pixel_sram_test/sram_addr
add wave -noupdate /pixel_sram_test/sram_dq
add wave -noupdate /pixel_sram_test/sram_oe_n
add wave -noupdate /pixel_sram_test/sram_we_n
add wave -noupdate /pixel_sram_test/sram_ce_n
add wave -noupdate -divider {Fake SRAM debug}
add wave -noupdate -expand /pixel_sram_test/u1/mem
add wave -noupdate -divider {Pixel Reader ST}
add wave -noupdate /pixel_sram_test/u0/pixel_reader/st_pixel_data
add wave -noupdate /pixel_sram_test/u0/pixel_reader/st_pixel_valid
add wave -noupdate /pixel_sram_test/u0/pixel_reader/st_pixel_ready
add wave -noupdate -divider {Fake Sink ST}
add wave -noupdate /pixel_sram_test/u0/fake_sink/data
add wave -noupdate /pixel_sram_test/u0/fake_sink/valid
add wave -noupdate /pixel_sram_test/u0/fake_sink/ready
add wave -noupdate -divider {Fake Sink debug}
add wave -noupdate /pixel_sram_test/u0/fake_sink/last_value
add wave -noupdate /pixel_sram_test/u0/fake_sink/num_values
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {78349 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 293
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {315484 ps}
