module UART_TOP #( parameter DATA_WIDTH = 8)(
                                             input wire CLK,RST,party_en,data_valid,party_typ,SI,test_mode,SE,scan_clk,scan_rst,
                                             input wire [DATA_WIDTH-1:0] P_DATA,
                                             output wire busy,Tx_OUT,SO
                                             );
         
         wire ser_done,ser_en,party_bit,ser_data,scanrst,scanclk;
         wire [2:0] mux_sel;


    DFT_MUX DFT_MUX_0  (

                        .in_0(CLK),
                        .in_1(scan_clk),
                        .sel(test_mode),
                        .out(scanclk) 
                       );
    DFT_MUX DFT_MUX_1  (

                        .in_0(RST),
                        .in_1(scan_rst),
                        .sel(test_mode),
                        .out(scanrst) 
                       );







    serializer #(.DATA_WIDTH(8))  serial (
                                   
                                        .P_DATA(P_DATA),
                                        .ser_done(ser_done),
                                        .ser_en(ser_en),
                                        .CLK(scanclk),
                                        .RST(scanrst),
                                        .ser_data(ser_data)
                                         );
   FSM  FSM                            (
                                        .CLK(scanclk),
                                        .RST(scanrst),
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
                                         .ser_data(ser_data),
                                         .party_bit(party_bit),
                                         .Tx_OUT(Tx_OUT)
                                        );
endmodule

