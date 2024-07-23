module parity_calc #( parameter DATA_WIDTH = 8)(
                                                 input wire party_typ,data_valid,
                                                 input wire [DATA_WIDTH-1 : 0] P_DATA,
                                                 output reg  party_bit
                                                );
                    
                    always @(*)
                      begin
                        if (data_valid)
                           begin
                            if (party_typ)
                               party_bit  =  ~^P_DATA;
                            else
                               party_bit  =   ^P_DATA;
                           end
                        else
                           party_bit = 0;
                      end

endmodule
