module MUX (
             input wire [2:0] mux_sel,
             input wire ser_data,party_bit,
             output reg Tx_OUT
            );

   always @ (*)
          begin
            
             case(mux_sel)
                3'b000 : begin                 
                        Tx_OUT = 1'b0 ;       
                        end
                3'b001 : begin
                        Tx_OUT = ser_data ;      
                        end	
                3'b010 : begin
                        Tx_OUT = party_bit ;       
                        end	
                3'b011 : begin
                        Tx_OUT = 1'b1 ;      
                        end		
                3'b101 : begin
                        Tx_OUT = 1'b1 ;      
                        end		
                default : begin
                        Tx_OUT = 1'b1 ;      
                        end	
              endcase      
           end
  endmodule
