module parity_calc #( parameter DATA_WIDTH = 8)(
                                                 input wire party_typ,data_valid,CLK,RST,busy,
                                                 input wire [DATA_WIDTH-1 : 0] P_DATA,
                                                 output reg  party_bit
                                                );
                                               
                    
                    always @(posedge CLK or negedge RST )
                    
                      begin
                        if(!RST)
                        party_bit <= 0;
                        else if (data_valid && !busy)
                        begin
                             if (party_typ)
                               party_bit  <=  ~^P_DATA;
                            else
                               party_bit  <=   ^P_DATA;
                       end
                   
                      end
         

endmodule

