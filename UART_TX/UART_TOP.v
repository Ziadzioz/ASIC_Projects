module UART_TOP #( parameter DATA_WIDTH = 8)(
                                             input wire CLK,RST,party_en,data_valid,party_typ,
                                             input wire [DATA_WIDTH-1:0] P_DATA,
                                             output wire busy,Tx_OUT
                                             );
         
         wire ser_done,ser_en,party_bit,ser_data;
         wire [2:0] mux_sel;

    serializer #(.DATA_WIDTH(8))  serial (
                                   
                                        .P_DATA(P_DATA),
                                        .ser_done(ser_done),
                                        .ser_en(ser_en),
                                        .CLK(CLK),
                                        .RST(RST),
                                        .ser_data(ser_data)
                                         );
   FSM  FSM                            (
                                        .CLK(CLK),
                                        .RST(RST),
                                        .data_valid(data_valid),
                                        .ser_done(ser_done),
                                        .ser_en(ser_en),
                                        .mux_sel(mux_sel),
                                        .busy(busy),
                                        .party_en(party_en)
                                         ) ;    

parity_calc     #(.DATA_WIDTH(8))       parity         (
                                        .party_typ(party_typ),
                                        .data_valid(data_valid),
                                        .P_DATA(P_DATA),
                                        .party_bit(party_bit)
                                                        );
MUX MUX                                (
                                         .mux_sel(mux_sel),
                                         .CLK(CLK),
                                         .RST(RST),
                                         .ser_data(ser_data),
                                         .party_bit(party_bit),
                                         .Tx_OUT(Tx_OUT)
                                        );
endmodule

