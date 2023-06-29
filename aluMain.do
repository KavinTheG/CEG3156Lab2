onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_alumain/tb_ALUMain/input1
add wave -noupdate /tb_alumain/tb_ALUMain/input2
add wave -noupdate /tb_alumain/tb_ALUMain/sel
add wave -noupdate /tb_alumain/tb_ALUMain/andResult
add wave -noupdate /tb_alumain/tb_ALUMain/orResult
add wave -noupdate /tb_alumain/tb_ALUMain/addResult
add wave -noupdate /tb_alumain/tb_ALUMain/diffResult
add wave -noupdate /tb_alumain/tb_ALUMain/stlOutput
add wave -noupdate /tb_alumain/tb_ALUMain/stlResult
add wave -noupdate /tb_alumain/tb_ALUMain/aluResult
add wave -noupdate /tb_alumain/tb_ALUMain/carryOut
add wave -noupdate /tb_alumain/tb_ALUMain/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 285
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
WaveRestoreZoom {0 ps} {851 ps}
