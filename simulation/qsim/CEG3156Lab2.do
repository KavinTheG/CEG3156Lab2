onerror {exit -code 1}
vlib work
vlog -work work CEG3156Lab2.vo
vlog -work work mux8x1EightBit.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mux8x1EightBit_vlg_vec_tst -voptargs="+acc"
vcd file -direction CEG3156Lab2.msim.vcd
vcd add -internal mux8x1EightBit_vlg_vec_tst/*
vcd add -internal mux8x1EightBit_vlg_vec_tst/i1/*
run -all
quit -f
