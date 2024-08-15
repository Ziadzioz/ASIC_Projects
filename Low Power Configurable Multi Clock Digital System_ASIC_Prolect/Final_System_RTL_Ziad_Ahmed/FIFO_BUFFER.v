module FIFO_BUFFER #(parameter DATA_WIDTH = 8,
                               FIFO_DEPTH = 8,
                               ADDRESS_BITS  = 3
    
                    )  (
                        input wire                          W_CLK,W_RST,WINC,W_FULL,
                        input wire [DATA_WIDTH - 1 : 0]     W_DATA,
                        input wire [ADDRESS_BITS - 1 : 0]   W_ADDRESS,R_ADDRESS,
                        output reg [DATA_WIDTH - 1 : 0]     R_DATA
                       );
    
                        
                        reg [DATA_WIDTH - 1 : 0] REG [FIFO_DEPTH - 1 : 0];
                        integer                  i;
            
            always @(posedge W_CLK or negedge W_RST)
              begin
                if (!W_RST)
                  begin
                      R_DATA <= 0;
                      for (i = 0 ; i < FIFO_DEPTH ; i = i + 1 )
                       begin
                        REG[i] <= 'b0;                     
                      end
                        R_DATA <= 0;
                   end
               else
                begin
                        if (!W_FULL & WINC)
                        begin
                            REG[W_ADDRESS] <= W_DATA;
                        end
                       
                            R_DATA <= REG[R_ADDRESS];                             
                end
              end

endmodule
