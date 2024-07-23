
`timescale 1ns/1ps
module Garage_TB ();
  reg   CLK_TB,RST_TB,Up_max_TB,Dn_max_TB,Activate_TB;
  wire  Up_M_TB,Dn_M_TB;
  always #10    CLK_TB = ~CLK_TB ;
  
   initial 
      begin
         $dumpfile("Garage.vcd") ;       
         $dumpvars; 
         #5
         itializion();
         resting();
         $display("Test Case 1");
         #10
         garage_inputs(0,1,0);
         $display("Test Case 2");
         #10
         resting();
         #10
         garage_inputs(1,0,1);                   // Test the UP_M
         $display("Test Case 3");
         #10
         resting();
         #10
         garage_inputs(0,1,0);
         $display("Test Case 4");
         #10
         resting();
         #10
         garage_inputs(1,1,0);                  // Test the Dn_M
         $display("Test Case 5");
         #10
         resting();
         #10
         garage_inputs(0,0,1); 
        
        
        
        
         $display("Done");  // The project is finished 
      
       $stop ;
      end 
   task  itializion ;
     begin
       CLK_TB = 0;
       RST_TB = 1;
       Up_max_TB = 0;
       Dn_max_TB = 0;
       Activate_TB = 0;
     end
   endtask
   task   resting ;
      begin
        RST_TB =  1'b1;
        #10
        RST_TB  = 1'b0;
        #10
        RST_TB  = 1'b1;
      end
    endtask
    task garage_inputs(
      input reg act,up,down
                       );
       begin
         #10
           Activate_TB = act;
           Up_max_TB = up;
           Dn_max_TB = down;
         #40
        if (Up_M_TB)
             $display("The Garage Door is  completely open at Time %d ",$time) ;
       else if (Dn_M_TB)
             $display("The Garage Door is  completely close at Time %d ",$time) ;  
      else
             $display(" we are in the idle state at Time %d ",$time) ;
      end
    endtask
    
    
  
      
           
  Garage_RTL DUT (
                  .CLK(CLK_TB),
                  .RST(RST_TB),
                  .Up_max(Up_max_TB),
                  .Dn_max(Dn_max_TB),
                  .Activate(Activate_TB),
                  .Up_M(Up_M_TB),
                  .Dn_M(Dn_M_TB)
                    );
endmodule