transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/DE1_SoC.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/userInput.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/metastability.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/keyPress.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/parkingLot.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/displayCount.sv}
vlog -sv -work work +incdir+C:/Users/tungfang/Desktop/lab1 {C:/Users/tungfang/Desktop/lab1/counter.sv}

