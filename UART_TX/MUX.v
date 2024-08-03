module MUX (
             input wire [2:0] mux_sel,
             input wire ser_data,party_bit,
             output reg Tx_OUT
            );

   always @ (*)
          begin
            
                   case (mux_sel)
                     000: Tx_OUT = 0 ;  // Start bit
                     001: Tx_OUT = ser_data ;  // serrial Data
                     010: Tx_OUT = party_bit ;  // party bit
                     011: Tx_OUT = 1 ;  // Stop bit
                     101: Tx_OUT = 1 ;  // 1 in the idle state
                     default : Tx_OUT = 1 ;
                   endcase
           end
  endmodule

