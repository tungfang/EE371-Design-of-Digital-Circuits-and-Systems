transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/371/lab4 {U:/371/lab4/task1.sv}
vlog -sv -work work +incdir+U:/371/lab4 {U:/371/lab4/bit_counting.sv}
vlog -sv -work work +incdir+U:/371/lab4 {U:/371/lab4/shift.sv}
vlog -sv -work work +incdir+U:/371/lab4 {U:/371/lab4/display.sv}

