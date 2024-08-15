module DF_SYNC       #(parameter  ADDRESS_BITS  = 3)
                           ( 
                            input wire                         W_CLK,W_RST,R_CLK,R_RST,
                            input wire    [ADDRESS_BITS : 0]   W_PTR,R_PTR,
                            output reg    [ADDRESS_BITS : 0]   RQ2_WPTR,WQ2_RPTR
                           );
       
                            reg    [ADDRESS_BITS : 0]   W_SYNC,R_SYNC;

                        
                     always @(posedge W_CLK or negedge W_RST )
                         begin
                           if (!W_RST)
                             begin
                                         WQ2_RPTR <= 'b0 ;
                                         W_SYNC   <= 'b0 ; 
                             end
                           else
                             begin
                                        W_SYNC   <=  R_PTR ; 
                                        WQ2_RPTR <=  W_SYNC ;
                             end
                         end

                    always @(posedge R_CLK or negedge R_RST )
                         begin
                           if (!R_RST)
                             begin
                                         RQ2_WPTR <= 'b0 ;
                                         R_SYNC   <= 'b0 ; 
                             end
                           else
                             begin
                                        R_SYNC   <=  W_PTR ; 
                                        RQ2_WPTR <=  R_SYNC ;
                             end
                         end


endmodule