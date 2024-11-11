onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DUT/CLOCK
add wave -noupdate /tb/DUT/MS
add wave -noupdate /tb/DUT/X
add wave -noupdate /tb/DUT/Y
add wave -noupdate /tb/DUT/Z
add wave -noupdate /tb/DUT/RA
add wave -noupdate /tb/DUT/RB
add wave -noupdate -color {Dark Orchid} /tb/DUT/OMUX
add wave -noupdate -color {Dark Orchid} /tb/DUT/R1
add wave -noupdate -color {Dark Orchid} /tb/DUT/R2
add wave -noupdate -color {Dark Orchid} /tb/DUT/L1
add wave -noupdate -color {Dark Orchid} /tb/DUT/L2
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
