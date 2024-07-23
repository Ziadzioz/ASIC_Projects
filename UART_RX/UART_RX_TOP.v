module UART_RX_TOP (
                     input  wire        CLK,RST,
                     input  wire        RX_IN,Parity_en,Parity_type,
                     input  wire [5:0]  Prescale,
                     output wire        DATA_VALID,Stop_error,Parity_error,
                     output wire [7:0]  P_DATA     
                    );

                    wire    Data_samp_en,edge_count_en,parity_check_en,start_en,stop_en,desrializer_en,Start_glitch,Sampled_Bit,parity_flag;
                    wire [3:0] bit_count;
                    wire [5:0] edge_count;

      
      FSM  FSM               (
                               .CLK(CLK),
                               .RST(RST),
                               .RX_IN(RX_IN),
                               .Parity_error(Parity_error),
                               .Stop_error(Stop_error),
                               .Start_glitch(Start_glitch),
                               .Parity_en(Parity_en),
                               .bit_count(bit_count),
                               .edge_count(edge_count),
                               .Data_samp_en(Data_samp_en),
                               .edge_count_en(edge_count_en),
                               .desrializer_en(desrializer_en),
                               .stop_en(stop_en),
                               .start_en(start_en),
                               .parity_check_en(parity_check_en),
                               .DATA_VALID(DATA_VALID)
                              );

     Bit_counter  Bit_counter (
                               
                               .CLK(CLK),
                               .RST(RST),
                               .edge_count_en(edge_count_en),
                               .Prescale(Prescale),
                               .bit_count(bit_count),
                               .edge_count(edge_count)        
                               );

     Data_Sampling Data_Sampling (
                                   .CLK(CLK),
                                   .RST(RST),
                                   .Data_samp_en(Data_samp_en),
                                   .RX_IN(RX_IN),
                                   .Prescale(Prescale),
                                   .edge_count(edge_count),
                                   .Sampled_Bit(Sampled_Bit)
                                 );

     Start_Check Start_Check     (
                                   .CLK(CLK),
                                   .RST(RST),
                                   .start_en(start_en),
                                   .Sampled_Bit(Sampled_Bit),
                                   .Start_glitch(Start_glitch)
                                  );

     Stop_Check Stop_Check        (
                                    .CLK(CLK),
                                    .RST(RST),
                                    .stop_en(stop_en),
                                    .Sampled_Bit(Sampled_Bit),
                                    .Stop_error(Stop_error)
                                   );
                        
     Deserializer Deserializer     (
                                     .CLK(CLK),
                                     .RST(RST),
                                     .desrializer_en(desrializer_en),
                                     .Sampled_Bit(Sampled_Bit),
                                     .DATA_VALID(DATA_VALID),
                                     .bit_count(bit_count),
                                     .parity_flag(parity_flag),
                                     .P_DATA(P_DATA)
                                    );

     Parity_Check Parity_Check      (
                                     .CLK(CLK),
                                     .RST(RST),
                                     .parity_flag(parity_flag),
                                     .Parity_type(Parity_type),
                                     .parity_check_en(parity_check_en),
                                     .Sampled_Bit(Sampled_Bit),
                                     .Parity_error(Parity_error)
                                     );
                                 
endmodule
