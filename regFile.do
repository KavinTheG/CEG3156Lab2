onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_registerfile/sim_end
add wave -noupdate /tb_registerfile/tb_clk
add wave -noupdate /tb_registerfile/tb_reset
add wave -noupdate /tb_registerfile/tb_regWrite
add wave -noupdate /tb_registerfile/tb_enableReg
add wave -noupdate /tb_registerfile/tb_readData1
add wave -noupdate /tb_registerfile/tb_readData2
add wave -noupdate /tb_registerfile/tb_readReg1
add wave -noupdate /tb_registerfile/tb_readReg2
add wave -noupdate /tb_registerfile/tb_writeData
add wave -noupdate /tb_registerfile/tb_writeReg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {89132 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 209
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
WaveRestoreZoom {0 ps} {543828 ps}
