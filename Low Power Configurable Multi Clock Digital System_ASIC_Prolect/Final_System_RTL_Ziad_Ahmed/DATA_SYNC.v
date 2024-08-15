module DATA_SYNC #(
    parameter NUM_STAGES = 3,
              BUS_WIDTH  = 8
)   (
      input wire                    CLK,RST,EN,
      input wire [BUS_WIDTH-1 : 0]  UNSYNC_BUS,
      output reg                    enable_pulse,
      output reg [BUS_WIDTH-1 : 0]  SYNC_BUS
    
    );
    
   wire                    pulse_gen;
   reg                     pulse;
   reg [NUM_STAGES-1 : 0]  bus_en_sync;
   integer                 i;

   always @(posedge CLK or negedge RST )
     begin
      if (!RST)
        begin
          SYNC_BUS       <= 'b0;
          enable_pulse   <= 1'b0;
        end
     else
       begin
        bus_en_sync[0] <= EN;
         for ( i=1 ; i < NUM_STAGES ; i = i + 1 )
           begin
             bus_en_sync[i] <= bus_en_sync[i-1];
           end
        pulse           <= bus_en_sync[NUM_STAGES - 1];
        enable_pulse    <= pulse_gen;
        if (pulse_gen)
          begin
            SYNC_BUS <= UNSYNC_BUS;
          end
        else
          begin
            SYNC_BUS <= SYNC_BUS;
          end
       end 
     end  

assign pulse_gen = ((bus_en_sync[NUM_STAGES-1])&(!pulse));

endmodule
