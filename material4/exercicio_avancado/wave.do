onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate  -height 26 /tb/dut/clock
add wave -noupdate  -height 26 /tb/dut/reset
add wave -noupdate -divider entrada
add wave -noupdate  -height 26 -radix unsigned /tb/dut/entrada
add wave -noupdate  -height 26 /tb/dut/send
add wave -noupdate -divider registradores
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/A
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/B
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/C
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/D
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/countIN
add wave -noupdate -divider soma
add wave -noupdate  -radix hexadecimal /tb/dut/soma
add wave -noupdate  -radix hexadecimal /tb/dut/en_regSOMA
add wave -noupdate -radix hexadecimal /tb/dut/regSoma
add wave -noupdate -divider SAIDA
add wave -noupdate  -height 26 /tb/req
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/countOUT
add wave -noupdate  -height 26 -radix hexadecimal /tb/dut/saida
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {723 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {699 ns} {911 ns}
