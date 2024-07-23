puts "****Bitwise Operation****"
set a [expr 20]
set b [expr 5]
set c [expr 9]
set var0 [expr $a&$c]
set var1 [expr $a|$b]
set var2 [expr $a^$a]
puts "$var0"
puts "$var1"
puts "$var2"