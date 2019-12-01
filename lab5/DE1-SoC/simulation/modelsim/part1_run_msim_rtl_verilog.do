transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/part1.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/clock_generator.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/audio_and_video_config.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_slow_clock_generator.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_i2c_av_auto_initialize.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_i2c.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/audio_codec.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_clock_edge.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_audio_in_deserializer.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_audio_bit_counter.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_sync_fifo.v}
vlog -vlog01compat -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/altera_up_audio_out_serializer.v}
vlog -sv -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/noise_generator.sv}
vlog -sv -work work +incdir+U:/starterkit/DE1-SoC {U:/starterkit/DE1-SoC/filter.sv}

