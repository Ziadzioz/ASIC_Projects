module PRESCALE_BLOCK (
                       input wire  [5:0] PRESCALE,
                       output reg  [7:0] DIV_RATIO
                       );
                    

                     always @(*)
                       begin
                        
                        case (PRESCALE)
                            
                            6'b100000: DIV_RATIO = 1;
                            6'b010000: DIV_RATIO = 2;
                            6'b001000: DIV_RATIO = 4;
                            6'b000100: DIV_RATIO = 8;
                            default:   DIV_RATIO = 1;
                            
                        endcase
                       end
     
endmodule
