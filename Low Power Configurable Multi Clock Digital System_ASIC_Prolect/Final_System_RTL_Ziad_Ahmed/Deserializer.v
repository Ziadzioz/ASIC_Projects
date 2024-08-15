  module Deserializer (
                       input wire       CLK,RST,desrializer_en,Sampled_Bit,DATA_VALID,
                       input wire [3:0] bit_count,
                       output reg       parity_flag,
                       output reg [7:0] P_DATA
                       );
                       
                       reg [7:0] DATA;

                 always @(posedge CLK or negedge RST)
                   begin
                      if (!RST)
                        begin
                       //   P_DATA       <= 0;
                          parity_flag  <= 0;
                        end
                       else
                        begin
                          if (desrializer_en && DATA_VALID)
                           begin
                         //   P_DATA  <=  DATA;
                            parity_flag  <= (^DATA);
                           end
                          else if (desrializer_en && DATA_VALID == 0)
                            begin
                              DATA[bit_count - 1] <= Sampled_Bit ;
                              parity_flag  <= (^DATA);
                       //       P_DATA <= 0;
                            end
                          else
                            begin
                            //    P_DATA <= 0;
//                                parity_flag  <= 0;
                            end

                        end
                   end                   
                always @(*)
                            begin
                              if(DATA_VALID)
                                P_DATA = DATA ;
                              else
                                P_DATA = 0 ;
  
                            end 
  endmodule
