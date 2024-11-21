onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DUT/reset
add wave -noupdate /tb/DUT/clock
add wave -noupdate /tb/DUT/SA
add wave -noupdate /tb/DUT/enableA
add wave -noupdate /tb/DUT/SB
add wave -noupdate /tb/DUT/enableB
add wave -noupdate /tb/DUT/X
add wave -noupdate /tb/DUT/Y
add wave -noupdate /tb/DUT/RB
add wave -noupdate -color {Dark Orchid} /tb/DUT/xmux
add wave -noupdate -color {Dark Orchid} /tb/DUT/ymux
add wave -noupdate -color {Dark Orchid} /tb/DUT/regA
add wave -noupdate -color {Dark Orchid} /tb/DUT/regB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ns} {315 ns}
