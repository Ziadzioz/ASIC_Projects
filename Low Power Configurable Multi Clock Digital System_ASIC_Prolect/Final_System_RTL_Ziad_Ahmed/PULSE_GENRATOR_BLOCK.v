module PULSE_GENRATOR_BLOCK (
                                input wire   TX_CLK,PULSE_GEN,
                                output reg   RINC
                             );
     
                                       reg     BEFORE_INV;
                                       wire    AFTER_INV;


                     always @(posedge TX_CLK )
                     
                                        begin
                                         
                                                BEFORE_INV <= PULSE_GEN;
                                                RINC       <= AFTER_INV;
                                         
                                        end

     assign   AFTER_INV  = (!BEFORE_INV & PULSE_GEN);


endmodule
