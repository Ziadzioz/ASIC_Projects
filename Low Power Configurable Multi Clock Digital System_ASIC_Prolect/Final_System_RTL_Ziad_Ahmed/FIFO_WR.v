module FIFO_WR #(parameter     
                               ADDRESS_BITS  = 3
    
                    )  (
                        input wire                             W_CLK,W_RST,WINC,RINC,
                        input wire    [ADDRESS_BITS : 0]       WQ2_RPTR,
                        output wire                            W_FULL,
                        output wire   [ADDRESS_BITS - 1 : 0]   W_ADDRESS,
                        output wire   [ADDRESS_BITS  : 0]      W_PTR
                       );
     
                        reg    [ADDRESS_BITS : 0]   add_ptr;
                        wire   [ADDRESS_BITS : 0]   W_GRAY_WPTR;

            
            always @(posedge W_CLK or negedge W_RST )
              begin
                if (!W_RST)
                  begin
             
                    add_ptr   <= 0;

                  end
                else
                  begin
                   if (!W_FULL & WINC )
                     begin
                      
                            add_ptr <= add_ptr + 1 ;
                       
                     end

                   
                  end
              end
     assign  W_ADDRESS      = add_ptr[2:0];
     assign  W_GRAY_WPTR[0] = add_ptr[0] ^ add_ptr[1] ;
     assign  W_GRAY_WPTR[1] = add_ptr[1] ^ add_ptr[2] ;
     assign  W_GRAY_WPTR[2] = add_ptr[2] ^ add_ptr[3] ;
     assign  W_GRAY_WPTR[3] = add_ptr[3] ;
     assign  W_PTR          = W_GRAY_WPTR ;
     assign  W_FULL         = ((W_PTR[1:0] == WQ2_RPTR[1:0]) && (W_PTR[2] == !WQ2_RPTR[2]) && (W_PTR[3] == !WQ2_RPTR[3]));







endmodule
