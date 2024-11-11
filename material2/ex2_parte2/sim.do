if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vcom -work work ex2.vhd

vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

add wave -noupdate /tb/reset
add wave -noupdate /tb/clk
add wave -noupdate -divider {entradas}
add wave -noupdate -radix hexadecimal /tb/entrada
add wave -noupdate -divider {saidas}
add wave -noupdate -color Orange -radix hexadecimal /tb/A
add wave -noupdate -color Orange -radix hexadecimal /tb/B
add wave -noupdate -color Orange -radix hexadecimal /tb/C
add wave -noupdate -color Orange -radix hexadecimal /tb/X
add wave -noupdate -color Orange -radix hexadecimal /tb/Y

run 300 ns