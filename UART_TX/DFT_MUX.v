module DFT_MUX (
                 input wire  in_0,in_1,sel,
                 output wire  out
                );
    
assign out = sel ? in_1:in_0 ;


endmodule
