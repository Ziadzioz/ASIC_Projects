module FSM_TX ( 
      input wire CLK,RST,party_en,ser_done,data_valid,
      output reg busy,ser_en,
      output reg [2:0] mux_sel
           );
        localparam   idle = 3'b000 ,
                     start = 3'b001,
                     data  = 3'b011,
                     party = 3'b010,
                     stop  = 3'b110;
        reg [2:0]   current_state,next_state;

          always @ (posedge CLK or negedge RST)
              begin
                if (!RST)
                    begin
                        current_state <= idle;
                      
                    end
                else
                        current_state <= next_state;
                      
              end

         always @ (*)
            begin
                case(current_state)
                  idle :
                         begin
                            mux_sel = 5;
                            busy = 0;
                            ser_en = 0 ;
                             
                             if (data_valid)
                               begin
                                next_state = start;
                               end
                             else
                                 next_state = idle;
                         end
                  start :
                           begin 
                             busy = 1  ;
                             ser_en = 0 ;
                             mux_sel = 0;
                             next_state = data ;
                           end
                   data :
                          begin
                             busy = 1   ;
                             ser_en = 1 ;
                             mux_sel = 1;
                             if (ser_done && party_en)
                                      next_state = party ;
                             else if (ser_done && !party_en)
                                       next_state = stop;
                             else 
                                       next_state = data;
                          end
                  party :
                          begin
                             busy = 1   ;
                             ser_en = 0 ;
                             mux_sel = 2;
                             next_state = stop ;
                          end
                  stop  :
                          begin
                             busy = 1          ;
                             ser_en = 0        ;
                             mux_sel = 3       ;
                             next_state = idle ;
                          end
                  default :
                            begin
                              busy =  0         ;
                              ser_en = 0        ;
                              mux_sel = 5       ;
                              next_state = idle ; 
                            end
                endcase
            end


    endmodule

