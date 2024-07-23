module Shift_Unit #(parameter width =16)(
     input  wire [width-1:0] A,B,
     input  wire [3:0] ALU_FUN,
     input  wire  clock,shift_enable,rest,
     output reg  shift_flag,
     output reg  [width-1:0] shift_out);
     
     reg flagshift;
     reg [width-1:0] outshift;
     
      always @(*)
         begin 
           if (shift_enable)
             begin
               flagshift = 1;
               case (ALU_FUN[1:0])
                 2'b00: outshift = A>>1;
                 2'b01: outshift = A<<1;
                 2'b10: outshift = B>>1;
                 2'b11: outshift = B<<1;
               endcase
             end
           else
             begin
               flagshift = 0;
               outshift  = 'b0;
             end
       end
       always @(posedge clock or negedge rest)
          begin
            if(!rest)
              begin
               shift_flag<= 1'b0;
               shift_out <=  'b0;
              end
          else
            begin
               shift_flag<= flagshift;
               shift_out <= outshift;
             end
           end
         endmodule
         
               
               
               
               
              
                
                
                
                
                
                
                
                
                
                
                
       
           
             
                 
     
     
