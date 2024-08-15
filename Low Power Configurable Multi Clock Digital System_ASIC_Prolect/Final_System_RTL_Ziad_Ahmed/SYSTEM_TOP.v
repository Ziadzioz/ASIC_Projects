module SYSTEM_TOP #(
                         parameter DATA_WIDTH   = 8,
                                   ADDRESS_BITS = 3,
                                   FIFO_DEPTH   = 8,
                                   NUM_STAGES   = 2
                    ) (

                          input  wire   REF_CLK,UART_CLK,RST,
                          input  wire   RX_IN,
                          output wire   Tx_OUT,Parity_error,Stop_error

                      );


                                                      wire                                   TX_CLK,RX_CLK,ALU_CLK,RST_SYNC_1,RST_SYNC_2;
                                                      wire  [5:0]                            PRESCALE;
                                                      wire  [7:0]                            DIV_RATIO;
                                                      wire                                   R_EMPTY,pulse_gen;
                                                      wire [DATA_WIDTH - 1 : 0]              UART_CONFIG,R_DATA,UNSYNC_BUS,SYNC_BUS,R_REG_DATA;
                                                      wire                                   DATA_VALID,PULSE_GEN;
                                                      wire [DATA_WIDTH - 1 : 0]              P_DATA,W_DATA,W_REG_DATA;
                                                      wire                                   W_FULL,R_DATA_VALID,ALU_OUT_VALID;
                                                      wire [DATA_WIDTH*2 - 1  : 0]           ALU_OUT;
                                                      wire                                   WINC,RINC,W_REG_EN,R_REG_EN,ALU_EN,CLK_GATE_EN,div_en;
                                                      wire [ADDRESS_BITS : 0]                REG_ADDRESS,ALU_FUNC;
                                                      wire [DATA_WIDTH - 1: 0]               REG0,REG1,REG2,REG3;

    



     RESET_SYNC #(.NUM_STAGES(NUM_STAGES)) RESET_SYNC_1   (

                                                           .CLK(UART_CLK),
                                                           .RST(RST),
                                                           .RST_SYNC(RST_SYNC_1)

                                                           );

     RESET_SYNC #(.NUM_STAGES(NUM_STAGES)) RESET_SYNC_2    (

                                                           .CLK(REF_CLK),
                                                           .RST(RST),
                                                           .RST_SYNC(RST_SYNC_2)

                                                           );

     PRESCALE_BLOCK                       PRESCALE_BLOCK   (
                                                           
                                                           .PRESCALE(UART_CONFIG[7:2]),
                                                           .DIV_RATIO(DIV_RATIO)

                                                            );                                                      

     CLK_DIV                                CLK_DIV_TX     (

                                                           .I_REF_CLK(UART_CLK),
                                                           .CLK_EN(div_en),
                                                           .RST_EN(RST_SYNC_1),
                                                           .DIV_RATIO(REG3),
                                                           .O_DIV_CLK(TX_CLK)

                                                           );
    
     CLK_DIV                                CLK_DIV_RX     (

                                                           .I_REF_CLK(UART_CLK),
                                                           .CLK_EN(div_en),
                                                           .RST_EN(RST_SYNC_1),
                                                           .DIV_RATIO(DIV_RATIO),
                                                           .O_DIV_CLK(RX_CLK)

                                                           );


     CLOCK_GATING                           CLOCK_GATING    (

                                                           .REF_CLK(REF_CLK),
                                                           .CLK_GATE_EN(CLK_GATE_EN),
                                                           .ALU_CLK(ALU_CLK)

                                                            );

     PULSE_GENRATOR_BLOCK           PULSE_GENRATOR_BLOCK    (
                                                             
                                                            .TX_CLK(TX_CLK),
                                                            .PULSE_GEN(PULSE_GEN),
                                                            .RINC(RINC)

                                                            );
     

     DATA_SYNC #(.NUM_STAGES(NUM_STAGES),
                 .BUS_WIDTH(DATA_WIDTH))  DATA_SYNC        (

                                                            .CLK(REF_CLK),
                                                            .RST(RST_SYNC_2),
                                                            .EN(DATA_VALID),
                                                            .UNSYNC_BUS(P_DATA),
                                                            .enable_pulse(pulse_gen),
                                                            .SYNC_BUS(SYNC_BUS)

                                                             );

     SYS_UART_TOP #(.DATA_WIDTH(DATA_WIDTH))  SYS_UART_TOP (

                                                            .TX_CLK(TX_CLK),
                                                            .RX_CLK(RX_CLK),
                                                            .RST_SYNC_1(RST_SYNC_1),
                                                            .RX_IN(RX_IN),
                                                            .R_EMPTY(R_EMPTY),
                                                            .UART_CONFIG(UART_CONFIG),
                                                            .R_DATA(R_DATA),
                                                            .Tx_OUT(Tx_OUT),
                                                            .DATA_VALID(DATA_VALID),
                                                            .Stop_error(Stop_error),
                                                            .Parity_error(Parity_error),
                                                            .PULSE_GEN(PULSE_GEN),
                                                            .P_DATA(P_DATA)

                                                             );

    SYSTEM_CONTROL #(.DATA_WIDTH(DATA_WIDTH)) SYSTEM_CONTROL (

                                                              .REF_CLK(REF_CLK),
                                                              .RST_SYNC_2(RST_SYNC_2),
                                                              .pulse_gen(pulse_gen),
                                                              .W_FULL(W_FULL),
                                                              .R_DATA_VALID(R_DATA_VALID),
                                                              .ALU_OUT_VALID(ALU_OUT_VALID),
                                                              .SYNC_BUS(SYNC_BUS),
                                                              .R_REG_DATA(R_REG_DATA),
                                                              .ALU_OUT(ALU_OUT),
                                                              .WINC(WINC),
                                                              .W_REG_EN(W_REG_EN),
                                                              .R_REG_EN(R_REG_EN),
                                                              .ALU_EN(ALU_EN),
                                                              .CLK_GATE_EN(CLK_GATE_EN),
                                                              .div_en(div_en),
                                                              .W_DATA(W_DATA),
                                                              .W_REG_DATA(W_REG_DATA),
                                                              .REG_ADDRESS(REG_ADDRESS),
                                                              .ALU_FUNC(ALU_FUNC)

                                                              );

    Reg_file   #(.DATA_WIDTH(DATA_WIDTH),
                 .ADDRESS_BITS(ADDRESS_BITS))   Reg_file      (
                                                               .CLK(REF_CLK),
                                                               .RST(RST_SYNC_2),
                                                               .R_REG_EN(R_REG_EN),
                                                               .W_REG_EN(W_REG_EN),
                                                               .REG_ADDRESS(REG_ADDRESS),
                                                               .W_REG_DATA(W_REG_DATA),
                                                               .R_DATA_VALID(R_DATA_VALID),
                                                               .R_REG_DATA(R_REG_DATA),
                                                               .REG0(REG0),
                                                               .REG1(REG1),
                                                               .REG2(UART_CONFIG),
                                                               .REG3(REG3)

                                                               ); 


     ALU_RTL  #(.DATA_WIDTH(DATA_WIDTH))     ALU_RTL            (

                                                                .ALU_CLK(ALU_CLK),
                                                                .RST_SYNC_2(RST_SYNC_2),
                                                                .ALU_EN(ALU_EN),
                                                                .REG0(REG0),
                                                                .REG1(REG1),
                                                                .ALU_FUNC(ALU_FUNC),
                                                                .ALU_OUT(ALU_OUT),
                                                                .ALU_OUT_VALID(ALU_OUT_VALID)

                                                                );
    
    FIFO_TOP   #(.FIFO_DEPTH_TOP(FIFO_DEPTH),
                 .DATA_WIDTH_TOP(DATA_WIDTH),
                 .ADDRESS_BITS_TOP(ADDRESS_BITS))   FIFO_TOP   (
                                                                
                                                                .W_CLK(REF_CLK),
                                                                .R_CLK(TX_CLK),
                                                                .W_RST(RST_SYNC_2),
                                                                .R_RST(RST_SYNC_1),
                                                                .WINC(WINC),
                                                                .RINC(RINC),
                                                                .W_DATA(W_DATA),
                                                                .W_FULL(W_FULL),
                                                                .R_EMPTY(R_EMPTY),
                                                                .R_DATA(R_DATA)
                                                                
                                                                );
    
    
endmodule

