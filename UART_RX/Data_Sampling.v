module Data_Sampling (
    
                       input wire           CLK,RST,Data_samp_en,RX_IN,
                       input wire [5:0]     Prescale,edge_count,
                       output reg           Sampled_Bit
                     );
        
                        reg sampled_bit_1,sampled_bit_2,sampled_bit_3;


                  always @(posedge CLK or negedge RST )
                     begin
                        
                        if (!RST)
                          begin
                            sampled_bit_1 <= 1'b0;
                            sampled_bit_2 <= 1'b0;
                            sampled_bit_3 <= 1'b0;
                            Sampled_Bit   <= 1'b0;
                          end
                         else
                           begin                           
                              if (Data_samp_en)
                                begin
                                  if (edge_count == (Prescale/2)-1)
                                    begin
                                         sampled_bit_1 <= RX_IN;
                                    end
                                  else if (edge_count == (Prescale/2))
                                    begin
                                        sampled_bit_2 <= RX_IN;
                                    end
                                  else if (edge_count == (Prescale/2)+1)
                                    begin
                                        sampled_bit_3 <= RX_IN;
                                    end
                                   else
                                     begin
                                          if ((sampled_bit_1&&sampled_bit_2&&sampled_bit_3)||(sampled_bit_1&&sampled_bit_2)||(sampled_bit_1&&sampled_bit_3)||(sampled_bit_3&&sampled_bit_2))
                                           begin
                                              Sampled_Bit <= 1'b1;
                                           end
                                          else
                                            begin
                                              Sampled_Bit <= 1'b0;
                                            end
                                      end
                                end
                              else
                               begin
                                    Sampled_Bit   <= 1'b0;
                                    sampled_bit_1 <= 1'b0;
                                    sampled_bit_2 <= 1'b0;
                                    sampled_bit_3 <= 1'b0;
                               end
                           end
                     end
endmodule