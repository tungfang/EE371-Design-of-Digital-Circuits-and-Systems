transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/371/lab3 {U:/371/lab3/VGA_framebuffer.sv}
vlog -sv -work work +incdir+U:/371/lab3 {U:/371/lab3/for_loop.sv}
vlog -sv -work work +incdir+U:/371/lab3 {U:/371/lab3/line_drawer.sv}
vlog -sv -work work +incdir+U:/371/lab3 {U:/371/lab3/DE1_SoC.sv}

