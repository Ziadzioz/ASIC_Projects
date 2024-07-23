module Decoder_unit (
     input  wire [3:0] ALU_FUN,
     output reg Arith_enable,Logic_enable,CMP_enable,Shift_enable
     );
     
     always @(*)
        begin 
         Arith_enable = 0;
         Logic_enable = 0;
         CMP_enable = 0;
         Shift_enable = 0;
           case (ALU_FUN[3:2])
                2'b00 : Arith_enable = 1;
                2'b01 : Logic_enable = 1;
                2'b10 : CMP_enable = 1;
                2'b11 : Shift_enable = 1;
           endcase
         end
endmodule
