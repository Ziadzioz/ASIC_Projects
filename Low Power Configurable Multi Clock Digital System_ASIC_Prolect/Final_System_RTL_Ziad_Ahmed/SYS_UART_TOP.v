module SYS_UART_TOP #(parameter DATA_WIDTH = 8)  ( 
                                                    input  wire                                   TX_CLK,RX_CLK,RST_SYNC_1,
                                                    input  wire                                   RX_IN,R_EMPTY,
                                                    input  wire [DATA_WIDTH - 1 : 0]              UART_CONFIG,R_DATA,
                                                    output wire                                   Tx_OUT,DATA_VALID,Stop_error,Parity_error,PULSE_GEN,
                                                    output wire [DATA_WIDTH - 1 : 0]              P_DATA     
                                                    );
                                                    
                                                    
    

     UART_RX_TOP   UART_RX_TOP                                     (
                                                                    .CLK(RX_CLK),
                                                                    .RST(RST_SYNC_1),
                                                                    .RX_IN(RX_IN),
                                                                    .Parity_en(UART_CONFIG[0]),
                                                                    .Parity_type(UART_CONFIG[1]),
                                                                    .Prescale(UART_CONFIG[7 : 2]),
                                                                    .DATA_VALID(DATA_VALID),
                                                                    .Stop_error(Stop_error),
                                                                    .Parity_error(Parity_error),
                                                                    .P_DATA(P_DATA)
                                                                    );
      
    UART_TX_TOP #(.DATA_WIDTH(DATA_WIDTH))  UART_TX_TOP           (
                                                                   .CLK(TX_CLK),
                                                                   .RST(RST_SYNC_1),
                                                                   .P_DATA(R_DATA),
                                                                   .party_en(UART_CONFIG[0]),
                                                                   .party_typ(UART_CONFIG[1]),
                                                                   .data_valid(!R_EMPTY),
                                                                   .busy(PULSE_GEN),
                                                                   .Tx_OUT(Tx_OUT)
                                                                   );


    
endmodule
