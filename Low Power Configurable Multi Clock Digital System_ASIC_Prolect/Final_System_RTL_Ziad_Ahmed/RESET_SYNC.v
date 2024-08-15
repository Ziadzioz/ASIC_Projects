module RESET_SYNC #(
    parameter NUM_STAGES = 3
                  )   (
                        input wire                    CLK,RST,
                        output reg                    RST_SYNC
                        
                     );
    
    reg [NUM_STAGES-1 : 0]  SYNC_BUS;
    integer                 i;

   always @(posedge CLK or negedge RST )
     begin
      if (!RST)
        begin
           RST_SYNC       <= 1'b0;
           SYNC_BUS       <=  'b0;
        end
     else
       begin
        SYNC_BUS[0] <= 1;
         for ( i = 1 ; i < NUM_STAGES ; i = i + 1 )
           begin
             SYNC_BUS[i] <= SYNC_BUS[i-1];
           end
        RST_SYNC       <= SYNC_BUS[NUM_STAGES - 1] ;
       end 
     end  


endmodule

