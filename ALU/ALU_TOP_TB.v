//time_unit = 1us & time percision = 1ns
`timescale 1us/1ns

// testbench has no inputs or outputs
module ALU_TOP_TB #(parameter widthab =16,widtharth = 32)();

//declare testbench signals
reg                               clock_tb,rst_tb ;            
reg          [widthab-1:0]        A_TB,B_TB ;
reg          [3:0]                ALU_FUNC_TB ;     
wire                              Arith_flag_TB,Logic_flag_TB,CMP_flag_TB,Shift_flag_TB,carryout_tb ;
wire         [widthab-1:0]        shift_out_tb,cmp_out_tb,logic_out_tb;
wire    signed     [widtharth-1:0]      arith_out_tb;




//initial block
initial
 begin
  $dumpfile("ALU_TOP.vcd"); // waveforms in this file      
  $dumpvars;              // saves all waveforms   
  clock_tb = 1'b0;
  rst_tb   = 1'b1;
  A_TB = 'b0000000000000000;   
  B_TB = 'b0000000000000000;     
  ALU_FUNC_TB = 4'b0000;  
  $display ("TEST CASE FOR postive values of A AND B") ;   
  #2
  A_TB = 'd8;   
  B_TB = 'd4;     
  ALU_FUNC_TB = 4'b0000;  
  $display ("**** TEST CASE 1 -- Addtion -- pos + pos ****") ;
  #5
   if  ( arith_out_tb == 'd12&&Arith_flag_TB == 1)
    $display ("Addtion %0d + %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Addtion %0d + %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 2 -- Subtraction -- pos - pos ****") ;
  
  #5
   ALU_FUNC_TB = 4'b0001;
  #5
  if  ( arith_out_tb == 'd4&&Arith_flag_TB == 1)
    $display ("Subtraction %0d - %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Subtraction %0d - %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 3 -- multiplcation -- pos * pos ****") ;
 
 #5
   ALU_FUNC_TB = 4'b0010;
 #5
  if  ( arith_out_tb == 'd32&&Arith_flag_TB == 1)
    $display ("multiplcation %0d * %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("multiplcation %0d * %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 4 -- division -- pos / pos ****") ;
  #5
   ALU_FUNC_TB = 4'b0011;
  #5
  if  ( arith_out_tb == 'd2&&Arith_flag_TB == 1)
    $display ("division %0d / %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("division %0d / %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("TEST CASE FOR Negative values of A AND B") ;   
  #5
  A_TB = -'d8;   
  B_TB = -'d4;     
  ALU_FUNC_TB = 4'b0000;  
  $display ("**** TEST CASE 5 -- Addtion -- neg + neg ****") ;
  #5
   if  ( arith_out_tb == -'d12&&Arith_flag_TB == 1)
    $display ("Addtion %0d + %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Addtion %0d + %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 6 -- Subtraction -- neg - neg ****") ;
  
  #5
   ALU_FUNC_TB = 4'b0001;
  #5
  if  ( arith_out_tb == -'d4&&Arith_flag_TB == 1)
    $display ("Subtraction %0d - %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Subtraction %0d - %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 7 -- multiplcation -- neg * neg ****") ;
 
 #5
   ALU_FUNC_TB = 4'b0010;
 #5
  if  ( arith_out_tb == 'd32&&Arith_flag_TB == 1)
    $display ("multiplcation %0d * %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("multiplcation %0d * %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 8 -- division -- neg / neg ****") ;
  #5
   ALU_FUNC_TB = 4'b0011;
  #5
  if  ( arith_out_tb == 'd2&&Arith_flag_TB == 1)
    $display ("division %0d / %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("division %0d / %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);  
    $display ("TEST CASE FOR postive value of A AND Negative value B") ;   
  #5
  A_TB = 'd8;   
  B_TB = -'d4;     
  ALU_FUNC_TB = 4'b0000;  
  $display ("**** TEST CASE 9 -- Addtion -- pos + neg ****") ;
  #5
   if  ( arith_out_tb == 'd4&&Arith_flag_TB == 1)
    $display ("Addtion %0d + %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Addtion %0d + %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 10 -- Subtraction -- pos - neg ****") ;
  
  #5
   ALU_FUNC_TB = 4'b0001;
  #5
  if  ( arith_out_tb == 'd12&&Arith_flag_TB == 1)
    $display ("Subtraction %0d - %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Subtraction %0d - %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 11 -- multiplcation -- pos * neg ****") ;
 
 #5
   ALU_FUNC_TB = 4'b0010;
 #5
  if  ( arith_out_tb == -'d32&&Arith_flag_TB == 1)
    $display ("multiplcation %0d * %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("multiplcation %0d * %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 12 -- division -- pos / neg ****") ;
  #5
   ALU_FUNC_TB = 4'b0011;
  #5
  if  ( arith_out_tb == -'d2&&Arith_flag_TB == 1)
    $display ("division %0d / %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("division %0d / %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
   $display ("TEST CASE FOR Negative value of A AND postive value B") ;   
  #5
  A_TB = -'d8;   
  B_TB = 'd4;     
  ALU_FUNC_TB = 4'b0000;  
  $display ("**** TEST CASE 13 -- Addtion -- neg + pos ****") ;
  #5
   if  ( arith_out_tb == -'d4&&Arith_flag_TB == 1)
    $display ("Addtion %0d + %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Addtion %0d + %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 14 -- Subtraction -- neg - pos ****") ;
  
  #5
   ALU_FUNC_TB = 4'b0001;
  #5
  if  ( arith_out_tb == -'d12&&Arith_flag_TB == 1)
    $display ("Subtraction %0d - %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("Subtraction %0d - %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 15 -- multiplcation -- neg * pos ****") ;
 
 #5
   ALU_FUNC_TB = 4'b0010;
 #5
  if  ( arith_out_tb == -'d32&&Arith_flag_TB == 1)
    $display ("multiplcation %0d * %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("multiplcation %0d * %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);   
  $display ("**** TEST CASE 16 -- division -- neg / pos ****") ;
  #5
   ALU_FUNC_TB = 4'b0011;
  #5
  if  ( arith_out_tb == -'d2&&Arith_flag_TB == 1)
    $display ("division %0d / %0d is passed = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);
  else
    $display ("division %0d / %0d is falled = %0d at simulation time",DUT.Arithmtic.A,DUT.Arithmtic.B,arith_out_tb,$time);  
    $display ("TEST CASE FOR Logical Operation") ;   
  #5
  A_TB = 'd8;   
  B_TB = 'd4;     
  ALU_FUNC_TB = 4'b0100;  
  $display ("**** TEST CASE 17 A ANDING B ****") ;
  #5
   if  ( logic_out_tb == 0 &&Logic_flag_TB == 1)
    $display ("ANDING %0d & %0d is passed = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);
  else
    $display ("ANDING %0d & %0d is falled = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);   
  $display ("**** TEST CASE 18 A ORING B ****") ;
  #5   
  ALU_FUNC_TB = 4'b0101; 
  #5
   if  ( logic_out_tb == 12 &&Logic_flag_TB == 1)
    $display ("ORING %0d | %0d is passed = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);
  else
    $display ("ORING %0d | %0d is falled = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);   
  $display ("**** TEST CASE 19 A NANDING B ****") ;
   #5   
    ALU_FUNC_TB = 4'b0110;
   #5
   if  ( logic_out_tb == 'd65535&&Logic_flag_TB == 1)
    $display ("NANDING %0d !& %0d is passed = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);
  else
    $display ("NANDING %0d !& %0d is falled = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);   
  $display ("**** TEST CASE 20 A NORING B ****") ;
  #5   
  ALU_FUNC_TB = 4'b0111; 
  #5
   if  ( logic_out_tb == 'd65523&&Logic_flag_TB == 1)
    $display ("NORING %0d | %0d is passed = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time);
  else
    $display ("NORING %0d | %0d is falled = %0d at simulation time",A_TB,B_TB,logic_out_tb,$time); 
     $display ("TEST CASE FOR CMP Operation") ;  
 #5
  A_TB = 'd8;   
  B_TB = 'd4;     
  ALU_FUNC_TB = 4'b1000;  
  $display ("**** TEST CASE 21 NOP ****") ;
  #5
   if  ( cmp_out_tb == 0&&CMP_flag_TB == 1)
    $display ("NOP TEST is passed");
  else
    $display ("NOP TEST is Falled");   
  $display ("**** TEST CASE 22 is A = B ****") ;
  #5   
  ALU_FUNC_TB = 4'b1001; 
  #5
   if  ( cmp_out_tb == 0&&CMP_flag_TB == 1)
    $display ("Comparing %0d AND %0d is passed = %0d at simulation time",A_TB,B_TB,cmp_out_tb,$time);
  else
    $display ("Comparing %0d AND %0d is falled = %0d at simulation time",A_TB,B_TB,cmp_out_tb,$time);   
  $display ("**** TEST CASE 23 is A > B ****") ;
   #5   
    ALU_FUNC_TB = 4'b1010;
   #5
   if  ( cmp_out_tb == 2&&CMP_flag_TB == 1)
    $display ("Comparing greater than %0d > %0d is passed = %0d at simulation time",A_TB,B_TB,cmp_out_tb,$time);
  else
    $display ("Comparing greater than %0d AND %0d is falled = %0d at simulation time",A_TB,B_TB,cmp_out_tb,$time);   
  $display ("**** TEST CASE 24 is A < B ****") ;   
   #5   
   ALU_FUNC_TB = 4'b1011; 
   #5
   if  ( cmp_out_tb == 0&&CMP_flag_TB == 1)
    $display ("Comparing smaller than %0d < %0d is passed = %0d at simulation time",A_TB,B_TB,cmp_out_tb,$time);
  else
    $display ("Comparing smaller than %0d AND %0d is falled = %0d at simulation time",A_TB,B_TB,cmp_out_tb,$time);  
  $display ("TEST CASE FOR Shift Operation") ;   
  #5
  A_TB = 'd8;   
  B_TB = 'd4;     
  ALU_FUNC_TB = 4'b1100;  
  $display ("**** TEST CASE 25 A >> 1 ****") ;
  #5
   if  ( shift_out_tb == 'd4  &&Shift_flag_TB == 1)
    $display ("SHIFTING %0d >> 1 is passed = %0d at simulation time",A_TB,shift_out_tb,$time);
  else
    $display ("SHIFTING %0d >> 1 is falled = %0d at simulation time",A_TB,shift_out_tb,$time);   
  $display ("**** TEST CASE 26 A << 1 ****") ;
  #5   
  ALU_FUNC_TB = 4'b1101; 
  #5
    if  ( shift_out_tb == 'd16 &&Shift_flag_TB == 1)
    $display ("SHIFTING %0d << 1 is passed = %0d at simulation time",A_TB,shift_out_tb,$time);
    else
    $display ("SHIFTING %0d << 1 is falled = %0d at simulation time",A_TB,shift_out_tb,$time);   
  $display ("**** TEST CASE 27 B >> 1 ****") ;
   #5   
    ALU_FUNC_TB = 4'b1110;
   #5
   if  ( shift_out_tb == 'd2 &&Shift_flag_TB == 1)
    $display ("SHIFTING %0d >> 1 is passed = %0d at simulation time",B_TB,shift_out_tb,$time);
  else
    $display ("SHIFTING %0d >> 1 is falled = %0d at simulation time",B_TB,shift_out_tb,$time);   
  $display ("**** TEST CASE 28 B << 1 ****") ;
  #5   
  ALU_FUNC_TB = 4'b1111; 
  #5
   if  ( shift_out_tb == 'd8 &&Shift_flag_TB == 1)
    $display ("SHIFTING %0d << 1 is passed = %0d at simulation time",B_TB,shift_out_tb,$time);
   else
    $display ("SHIFTING %0d << 1 is falled = %0d at simulation time",B_TB,shift_out_tb,$time); 
    
    
     $display ("DONE") ;  // THE PROJECT IS FINISHED
  #5 
  $stop;  //finished with simulation 
 end
// Clock Generator
      // duty cycle 60%
always 
  begin
   clock_tb =0  ;
   #4
   clock_tb =1;
   #6;
  end
   


// Design instantiation

ALU_TOP DUT (
.CLK(clock_tb),    
.RST(rst_tb),        
.A(A_TB), 
.B(B_TB),   
.ALU_FUN(ALU_FUNC_TB), 
.arith_flag(Arith_flag_TB),    
.logic_flag(Logic_flag_TB),
.cmp_flag(CMP_flag_TB),
.shift_flag(Shift_flag_TB),
.carry_out(carryout_tb),
.shift_out(shift_out_tb),
.cmp_out(cmp_out_tb),
.logic_out(logic_out_tb),
.arith_out(arith_out_tb)
);
endmodule
