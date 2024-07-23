puts "****Assignment 2.0****"
set cities "cairo alexandria damietta dakahlia faiyum sohag aswan"
set new_cities ""
foreach x $cities {
set firistchar [string index $x 0]
set Firistchar [string toupper $firistchar]
set Length [string length $x]
set  i [string length $x]
set x [string range $x 1 [expr $Length-1]]
set new  $Firistchar$x
set new_cities [linsert $new_cities $i $new ]
set i [expr $i-1]
}
puts $new_cities