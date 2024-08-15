module FIFO_TOP #(parameter    DATA_WIDTH_TOP    = 8,
                               FIFO_DEPTH_TOP    = 8,
                               ADDRESS_BITS_TOP  = 3
    
                    )  (
                        input wire                           W_CLK,W_RST,R_CLK,R_RST,WINC,RINC,
                        input wire  [DATA_WIDTH_TOP - 1 : 0] W_DATA,
                        output wire                          W_FULL,R_EMPTY,
                        output wire [DATA_WIDTH_TOP - 1 : 0] R_DATA
                       );
                       
                        wire [ADDRESS_BITS_TOP - 1 : 0]   W_ADDRESS,R_ADDRESS;
                        wire [ADDRESS_BITS_TOP  : 0]      RQ2_WPTR,WQ2_RPTR,W_PTR,R_PTR;
                    


     FIFO_BUFFER     #(.DATA_WIDTH(DATA_WIDTH_TOP),
                       .FIFO_DEPTH(FIFO_DEPTH_TOP),
                       .ADDRESS_BITS(ADDRESS_BITS_TOP)) FIFO_BUFFER (
                                                                  .W_CLK(W_CLK),
                                                                  .W_RST(W_RST),
                                                                  .WINC(WINC),
                                                                  .W_FULL(W_FULL),
                                                                  .W_DATA(W_DATA),
                                                                  .W_ADDRESS(W_ADDRESS),
                                                                  .R_ADDRESS(R_ADDRESS),
                                                                  .R_DATA(R_DATA)
                                                                   );
            
     FIFO_WR         #(
                       .ADDRESS_BITS(ADDRESS_BITS_TOP))    FIFO_WR    (
                                                                  .W_CLK(W_CLK),
                                                                  .W_RST(W_RST),
                                                                  .WINC(WINC),
                                                                  .RINC(RINC),
                                                                  .WQ2_RPTR(WQ2_RPTR),
                                                                  .W_FULL(W_FULL),
                                                                  .W_ADDRESS(W_ADDRESS),
                                                                  .W_PTR(W_PTR)
                                                                   );
      FIFO_RD         #(
                       .ADDRESS_BITS(ADDRESS_BITS_TOP))    FIFO_RD    (
                                                                  .R_CLK(R_CLK),
                                                                  .R_RST(R_RST),
                                                                  .RINC(RINC),
                                                                  .RQ2_WPTR(RQ2_WPTR),
                                                                  .R_EMPTY(R_EMPTY),
                                                                  .R_ADDRESS(R_ADDRESS),
                                                                  .R_PTR(R_PTR)
                                                                   );
      DF_SYNC         #(
                       .ADDRESS_BITS(ADDRESS_BITS_TOP))    DF_SYNC    (
                                                                  .R_CLK(R_CLK),
                                                                  .R_RST(R_RST),
                                                                  .W_CLK(W_CLK),
                                                                  .W_RST(W_RST),
                                                                  .RQ2_WPTR(RQ2_WPTR),
                                                                  .WQ2_RPTR(WQ2_RPTR),
                                                                  .W_PTR(W_PTR),
                                                                  .R_PTR(R_PTR)
                                                                   );

 endmodule