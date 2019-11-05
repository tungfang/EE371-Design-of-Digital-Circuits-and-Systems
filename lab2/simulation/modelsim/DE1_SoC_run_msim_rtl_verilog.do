transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab2 {C:/Users/tungfang/Desktop/lab2/HEX_display.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab2 {C:/Users/tungfang/Desktop/lab2/memArray.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab2 {C:/Users/tungfang/Desktop/lab2/task3.sv}

