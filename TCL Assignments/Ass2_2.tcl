set x [open rtl.txt r+]
set des [read $x]
set designs ""
set i 0
foreach v $des {
set designs [linsert $designs $i $v]

incr i

}
puts "{$designs}"
close $x
