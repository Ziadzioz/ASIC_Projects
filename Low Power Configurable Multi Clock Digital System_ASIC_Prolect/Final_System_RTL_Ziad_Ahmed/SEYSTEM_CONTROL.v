module SYSTEM_CONTROL #(
                         parameter DATA_WIDTH   = 8,
                                   ADDRESS_BITS = 3
                        ) (
                            input wire                                    REF_CLK,RST_SYNC_2,pulse_gen,W_FULL,R_DATA_VALID,ALU_OUT_VALID,
                            input  wire [DATA_WIDTH - 1 : 0]              SYNC_BUS,R_REG_DATA,
                            input  wire [DATA_WIDTH*2 - 1  : 0]           ALU_OUT,
                            output reg                                    WINC,W_REG_EN,R_REG_EN,ALU_EN,CLK_GATE_EN,div_en,
                            output reg  [DATA_WIDTH - 1 : 0]              W_DATA,W_REG_DATA,
                            output reg  [ADDRESS_BITS : 0]                REG_ADDRESS,ALU_FUNC
                           );
    

                         localparam                                     idle                  = 3'b000,
                                                                        W_DATA_state          = 3'b001,
                                                                        PASS_DATA             = 3'b010,
                                                                        D_READ_state          = 3'b011,
                                                                        ALU_WITH_OPERNDS      = 3'b100,
                                                                        PASS_OPERAND_B        = 3'b101,
                                                                        ALU_FUN_state         = 3'b110,
                                                                        LAST_ALU_BITS         = 3'b111;




                        reg [3:0]                                       current_state,next_state;
                        reg [ADDRESS_BITS : 0]                          comb_reg_address;
                        reg [DATA_WIDTH - 1 : 0]                        W_DATA_2;


                always @(posedge REF_CLK or negedge RST_SYNC_2 ) 
                    begin
                            if(!RST_SYNC_2)
                                current_state <= idle;
                            else
                                current_state <= next_state; 

                    end

                    always @(posedge REF_CLK or negedge RST_SYNC_2 ) 
                    begin
                            if(!RST_SYNC_2)
                               begin
                                comb_reg_address <= 0;
                                W_DATA_2 <= 0;  
                               end

                            else if (current_state == W_DATA_state )
                              begin
                                if (pulse_gen) 
                                 comb_reg_address <= SYNC_BUS ;
                                 
                              end
                              else if (current_state == ALU_FUN_state )
                              begin
                                if (ALU_OUT_VALID)
                                 W_DATA_2 <= ALU_OUT[DATA_WIDTH*2 - 1 : DATA_WIDTH];
                                 
                              end

                    end
                
                always @(*)
                  begin
                    
                    WINC          = 0;
                    W_REG_EN      = 0;
                    R_REG_EN      = 0;
                    ALU_EN        = 0;
                    CLK_GATE_EN   = 0;
                    div_en        = 1;
                    W_DATA        = 0;
                    W_REG_DATA    = 0;
                    REG_ADDRESS   = 0;
                    ALU_FUNC      = 0;
    
                              
            case (current_state)
               
                idle: 
                      begin
                                                
                                WINC          = 0;
                                W_REG_EN      = 0;
                                R_REG_EN      = 0;
                                ALU_EN        = 0;
                                CLK_GATE_EN   = 0;
                                div_en        = 1;
                                W_DATA        = 0;
                                W_REG_DATA    = 0;
                                REG_ADDRESS   = 0;
                                ALU_FUNC      = 0;
                            
                                    if (pulse_gen) 

                                               begin
                                                  case (SYNC_BUS)
                                                                'b10101010: next_state = W_DATA_state;
                                                                'b10111011: next_state = D_READ_state;
                                                                'b11001100: next_state = ALU_WITH_OPERNDS;
                                                                'b11011101: next_state = ALU_FUN_state;
                                                                default:    next_state = idle; 
                                                   endcase     
                                               end
                                    else
                                               begin
                                                                             next_state = idle;
                                                end

                       end
               
                W_DATA_state: 
                             begin
                           
                                    if (pulse_gen) 

                                                   begin
                                                                 
                                                                            next_state       = PASS_DATA; 
                                                   end
                                    else
                                                   begin
                                                                             next_state =  W_DATA_state;
                                                   end
                             end

                PASS_DATA: 
                             begin
                                                                            
                                    if (pulse_gen) 

                                                      begin
                                                                            REG_ADDRESS      = comb_reg_address;
                                                                            W_REG_DATA       = SYNC_BUS;
                                                                            W_REG_EN         = 1'b1;
                                                                            next_state       = idle; 
                                                      end
                                    else
                                                     begin
                                                                             next_state      =  PASS_DATA;
                                                      end
                             end


                D_READ_state: 
                              begin
                                                                            
                                    if (pulse_gen) 

                                                      begin
                                                                            REG_ADDRESS      = SYNC_BUS;
                                                                            R_REG_EN         = 1'b1;

                                                                              if (R_DATA_VALID)
                                                                                begin
                                                                                            W_DATA = R_REG_DATA;

                                                                                              if (W_FULL)
                                                                                                begin
                                                                                                     next_state      =  D_READ_state; 
                                                                                                end
                                                                                              else
                                                                                                begin
                                                                                                      WINC           = 1'b1;
                                                                                                      next_state     = idle; 
                                                                                                end 

                                                                                 end
                                                                              else
                                                                                begin
                                                                                             next_state      =  D_READ_state;
                                                                                 end

                                                                             
                                                      end
                                    else
                                                     begin
                                                         
                                                                             
                                                                              if (R_DATA_VALID)
                                                                                begin
                                                                                            W_DATA = R_REG_DATA;

                                                                                              if (W_FULL)
                                                                                                begin
                                                                                                     next_state      =  D_READ_state; 
                                                                                                end
                                                                                              else
                                                                                                begin
                                                                                                      WINC           = 1'b1;
                                                                                                      next_state     = idle; 
                                                                                                end 

                                                                                 end
                                                                              else
                                                                                begin
                                                                                             next_state      =  D_READ_state;
                                                                                 end

                                                                          
                                                      end
                              end



                ALU_WITH_OPERNDS: 
                                 begin
                                       CLK_GATE_EN = 1'b1;
                                                                            
                                          if (pulse_gen) 

                                                      begin
                                                                            REG_ADDRESS      = 'b0000;
                                                                            W_REG_DATA       = SYNC_BUS;
                                                                            W_REG_EN         = 1'b1;
                                                                            next_state       = PASS_OPERAND_B;                                                                            
                                                      end
                                         else
                                                     begin
                                                                            next_state      =  ALU_WITH_OPERNDS;
                                                      end
                                 end


                PASS_OPERAND_B: 
                                 begin
                                       CLK_GATE_EN = 1'b1;
                                                                            
                                          if (pulse_gen) 

                                                      begin
                                                                            REG_ADDRESS      = 'b0001;
                                                                            W_REG_DATA       = SYNC_BUS;
                                                                            W_REG_EN         = 1'b1;
                                                                            next_state       = ALU_FUN_state ;                                                                            
                                                      end
                                         else
                                                     begin
                                                                            next_state      =  PASS_OPERAND_B;
                                                      end
                                 end

                ALU_FUN_state: 
                                 begin
                                       CLK_GATE_EN = 1'b1;
                                                                            
                                          if (pulse_gen) 

                                                      begin
                                                                            ALU_FUNC         = SYNC_BUS[ADDRESS_BITS : 0];
                                                                            ALU_EN           = 1'b1;
                                                                             
                                                                             if (ALU_OUT_VALID)
                                                                               begin
                                                                                     W_DATA   = ALU_OUT[DATA_WIDTH - 1 : 0] ;
                                                                                        
                                                                                        
                                                                                              if (W_FULL)
                                                                                                begin
                                                                                                     next_state      =  ALU_FUN_state; 
                                                                                                end
                                                                                              else
                                                                                                begin
                                                                                                      WINC           = 1'b1;
                                                                                                      next_state     = LAST_ALU_BITS; 
                                                                                                end 
                                                                               end
                                                                             else
                                                                               begin
                                                                                     next_state  = ALU_FUN_state ;
                                                                               end                                                                                                                                             
                                                      end
                                         else
                                                     begin
                                                                           if (ALU_OUT_VALID)
                                                                               begin
                                                                                     W_DATA   = ALU_OUT[DATA_WIDTH - 1 : 0] ;
                                                                                     
                                                                                        
                                                                                        
                                                                                              if (W_FULL)
                                                                                                begin
                                                                                                     next_state      =  ALU_FUN_state; 
                                                                                                end
                                                                                              else
                                                                                                begin
                                                                                                      WINC           = 1'b1;
                                                                                                      next_state     = LAST_ALU_BITS; 
                                                                                                end 
                                                                               end
                                                                             else
                                                                               begin
                                                                                     next_state  = ALU_FUN_state ;
                                                                               end  
                                                      end
                                 end

            

                LAST_ALU_BITS: 
                                 begin
                                                                                   
                                       W_DATA      =  W_DATA_2;                                               
                                                                                              if (W_FULL)
                                                                                                begin
                                                                                                     next_state      =   LAST_ALU_BITS; 
                                                                                                end
                                                                                              else
                                                                                                begin
                                                                                                      WINC           = 1'b1;
                                                                                                      next_state     = idle; 
                                                                                                end 
                                                                           
                                                      
                                 end

                default: 
                                 begin
                                                                    
                                            WINC          = 0;
                                            W_REG_EN      = 0;
                                            R_REG_EN      = 0;
                                            ALU_EN        = 0;
                                            CLK_GATE_EN   = 0;
                                            div_en        = 1;
                                            W_DATA        = 0;
                                            W_REG_DATA    = 0;
                                            REG_ADDRESS   = 0;
                                            ALU_FUNC      = 0;
                                            next_state     = idle;
                                 end
                  endcase

                  end

endmodule

