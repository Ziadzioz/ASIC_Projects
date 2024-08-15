module FSM (
               input     wire  CLK,RST,RX_IN,Parity_error,Stop_error,Start_glitch,Parity_en,
               input     wire [3:0] bit_count,
               input     wire [5:0] edge_count,
               output     reg  Data_samp_en,edge_count_en,desrializer_en,stop_en,start_en,parity_check_en,DATA_VALID
           );
    
            localparam   idle   = 3'b000,
                         start  = 3'b001,
                         DATA   = 3'b010,
                         parity = 3'b011,
                         stop   = 3'b100;
             //            FINAL  = 3'b111;

            reg [2:0]   current_state,next_state;
    always @(posedge CLK or negedge RST ) 

          begin
                   if(!RST)
                     current_state <= idle;
                   else
                     current_state <= next_state; 

          end

    always @(*) 
          
          begin
                    Data_samp_en = 0;
                    edge_count_en = 0;
                    desrializer_en = 0;
                    stop_en = 0;
                    start_en = 0;
                    parity_check_en = 0;
                    DATA_VALID = 0;
            case (current_state)
               
                idle: 
                      begin
                            Data_samp_en = 0;
                            edge_count_en = 0;
                            desrializer_en = 0;
                            stop_en = 0;
                            start_en = 0;
                            parity_check_en = 0;
                            DATA_VALID = 0;

                        if (RX_IN) 
                           begin
                             next_state = idle;
                           end

                        else
                          begin
                            next_state = start;
                          end

                       end
                start:
                       begin
                        
                        edge_count_en = 1'b1;
                        Data_samp_en  = 1'b1;
                        start_en  = 1'b1;

                          if (Start_glitch == 0 && bit_count == 1) 
                            begin
                               next_state = DATA;
                            end 
                          else if (Start_glitch == 1 && bit_count == 1)
                             begin
                               next_state = idle;
                             end
                          else
                             begin
                                next_state = start;
                             end
                        end

                 DATA:
                        begin
                            
                             edge_count_en =  1'b1;
                             Data_samp_en  =  1'b1;
                             desrializer_en = 1'b1;
                          
                          if (bit_count == 9) 
                             begin
                               if (Parity_en) 
                                 begin
                                     next_state = parity;
                                 end 
                               else 
                                 begin
                                     next_state = stop;
                                 end
                              end 
                          else 
                             begin
                                    next_state = DATA;
                             end
                        end
                parity:
                        begin

                           edge_count_en =   1'b1;
                           Data_samp_en  =   1'b1;
                           parity_check_en = 1'b1;
                        
                        if (Parity_error == 0 && bit_count == 10) 
                          begin
                               next_state = stop;
                           end 
                        else if (Parity_error && bit_count == 10)
                          begin
                                next_state = idle;
                          end
                        else  
                          begin
                                next_state = parity;
                          end
                        end
                stop:
                      begin
                        
                         edge_count_en =   1'b1;
                         Data_samp_en  =   1'b1;
                         stop_en  = 1'b1;

                       if (Stop_error == 0 && ((bit_count == 12 && Parity_en)||(bit_count == 11 && Parity_en == 0)))
                        begin
                            if (RX_IN == 0)
                             begin
                                  next_state = start; 
                             end
                            else
                             begin
                                  next_state = idle;
                             end
                        end
                       else if (Stop_error == 0 && ((bit_count == 11 && Parity_en)||(bit_count == 10 && Parity_en == 0)))
                        begin
                            desrializer_en = 1'b1;
                            edge_count_en =   1'b1;
                            DATA_VALID = 1;
                            next_state = stop;//
                        end
                       else if (Stop_error == 1 && ((bit_count == 11 && Parity_en)||(bit_count == 10 && Parity_en == 0)))
                          begin
                                 next_state = idle;
                          end
                       else 
                          begin
                                 next_state = stop;
                          end
                      end
                      
                default: 
                         begin
                            next_state = idle;
                             Data_samp_en = 0;
                             edge_count_en = 0;
                             desrializer_en = 0;
                             stop_en = 0;
                             start_en = 0;
                             parity_check_en = 0;
                             DATA_VALID = 0;
                         end
            endcase
          end
endmodule
