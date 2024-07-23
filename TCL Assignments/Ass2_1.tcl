puts "****Writing Verilog Block Interface****"
set modname "Up_Dn_Counter"
set in_ports "IN Load Up Down CLK"
set in_ports_width "4 1 1 1 1"
set out_ports "High Counter Low"
set out_ports_width "1 4 1"
set modeul_name "module $modname"

foreach x $in_ports_width {
if {$x !=1} {
regsub "$x" $in_ports_width "\n \[[expr $x-1]:0\] " in_ports_width
} else {
regsub "$x" $in_ports_width "\n  " in_ports_width
}
} 
set i 0
foreach x $in_ports {
regsub "$x" $in_ports "\n input  [lindex $in_ports_width $i] $x," in_ports
incr i
} 
foreach x $out_ports_width {
if {$x !=1} {
regsub "$x" $out_ports_width "\n \[[expr $x-1]:0\] " out_ports_width
} else {
regsub "$x" $out_ports_width "\n  " out_ports_width
}
} 
set i 0
set lli [llength $out_ports]
set lli [expr $lli-1]
foreach x $out_ports {
if {$i !=$lli} {
regsub "$x" $out_ports "\n output  [lindex $out_ports_width $i] $x," out_ports
} else {
regsub "$x" $out_ports "\n output  [lindex $out_ports_width $i] $x" out_ports
}
incr i

} 
set module_block "$modeul_name \( \n $in_ports \n $out_ports \n );"
puts "$module_block"