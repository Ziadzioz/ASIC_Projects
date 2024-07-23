puts "****Logical Operations****"
set a [expr 5]
set b [expr -1]
set c [expr 0]
set var0 [expr $a&&$c]
set var1 [expr $a||$b]
puts "$var0"
puts "$var1"
