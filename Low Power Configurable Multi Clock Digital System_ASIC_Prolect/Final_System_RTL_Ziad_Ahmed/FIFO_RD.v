module FIFO_RD #(parameter     
                               ADDRESS_BITS  = 3
    
                    )  (
                        input wire                              R_CLK,R_RST,RINC,
                        input wire     [ADDRESS_BITS : 0]       RQ2_WPTR,
                        output wire                             R_EMPTY,
                        output wire    [ADDRESS_BITS - 1 : 0]   R_ADDRESS,
                        output wire    [ADDRESS_BITS  : 0]      R_PTR
                       );
    
                        wire [ADDRESS_BITS : 0]       R_GRAY_RPTR;
                        reg  [ADDRESS_BITS  : 0]      add_ptrr;
            
            always @(posedge R_CLK or negedge R_RST )
              begin
                if (!R_RST)
                  begin
                    
                    add_ptrr <= 'b0;
                  
                  end 
                else
                  begin
                       
                          if (RINC && !R_EMPTY)
                            begin
                            add_ptrr <= add_ptrr + 1;
                            end
                  

                  end
              end
     assign  R_GRAY_RPTR[0] = add_ptrr[0] ^ add_ptrr[1] ;
     assign  R_GRAY_RPTR[1] = add_ptrr[1] ^ add_ptrr[2] ;
     assign  R_GRAY_RPTR[2] = add_ptrr[2] ^ add_ptrr[3] ;
     assign  R_GRAY_RPTR[3] = add_ptrr[3] ;
     assign  R_ADDRESS      = add_ptrr[2:0];
     assign  R_PTR          = R_GRAY_RPTR ;   
     assign  R_EMPTY        = (R_PTR == RQ2_WPTR) ;
     

  
     
endmodule

