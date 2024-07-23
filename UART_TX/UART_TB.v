`timescale 1us/1ns
module UART_TOP_TB  #( parameter DATA_WIDTH = 8) ();


reg                            CLK_TB ;
reg                            RST_TB ;
reg     [DATA_WIDTH-1 : 0]     P_DATA_TB ;
reg                            data_valid_TB ;
reg                            party_en_TB  ; 
reg                            party_typ_TB;
wire                           Tx_OUT_TB;
wire                           Busy_TB;
reg    [DATA_WIDTH-1:0]     OUT ,EXPC_OUT ;
reg    [DATA_WIDTH+2:0]     OUT1 ,EXPC_OUT1 ;
reg    [DATA_WIDTH+1:0]     OUT2 ,EXPC_OUT2 ;
parameter clock_period = (1/115.2)*1000 ;



initial 
 begin
 $dumpfile("UART_TX.vcd") ;       
 $dumpvars; 

 
initialization () ;
Reset () ;

#clock_period
  $display("Test Case 1 test DATA_VALID signal");  ///  test DATA_VALID signal
   Pass_Data (0,'b00110011,1,0) ;
   Print_OUT () ;
   Reset () ;
 #clock_period
  $display("Test Case 2 test odd parity");  /// test odd parity
   Pass_Data (1,'b00010111,1,1) ;
   Print_OUT () ;
   Reset () ;
   
 #clock_period
  $display("Test Case 3 test odd parity");  /// test even parity
   Pass_Data (1,'b10110011,1,0) ;
   Print_OUT () ;
   Reset () ;
   
#clock_period
  $display("Test Case 4  test no parity");  ///  test no parity 
   Pass_Data (1,'b11101010,0,0) ;
   Print_OUT () ;
   Reset () ;

 #(10*clock_period)
 $finish ;
 
 end


/////initialization/// 
task initialization ;
begin
CLK_TB  = 1'b0 ;
RST_TB  = 1'b1 ;
data_valid_TB = 1'b0 ;
P_DATA_TB = 0;
party_en_TB = 0;
party_typ_TB = 0;

end
endtask

//////RST/////
task Reset ;
begin
RST_TB  = 1'b1 ;
#clock_period
RST_TB  = 1'b0 ;
#clock_period
RST_TB  = 1'b1 ;
data_valid_TB = 1'b0 ;
/*
EXPC_OUT1 = 0;
EXPC_OUT2 = 0;
OUT1 = 0;
OUT2 = 0;
OUT = 0;
*/
end
endtask


task Pass_Data ; 
input reg input_data_valid; 
input reg [DATA_WIDTH-1:0] input_data ;
input reg input_party_en;
input reg input_party_typ;
parameter zero = 0;
parameter one = 1; 
begin
  data_valid_TB = input_data_valid;
  P_DATA_TB = input_data;
  party_en_TB = input_party_en;
  party_typ_TB = input_party_typ;
  
  
 
  EXPC_OUT1 [DATA_WIDTH:1]  = input_data ;
  EXPC_OUT1 [0] = zero;
  
  EXPC_OUT1 [DATA_WIDTH+2] = one ;
 
 
  
  EXPC_OUT2 [DATA_WIDTH:1]  = input_data ;
  EXPC_OUT2 [0] = zero;
  EXPC_OUT2 [DATA_WIDTH+1] = one ;
  EXPC_OUT   = 8'b11111111 ;
end
endtask

task Print_OUT ;

integer j ;



begin 
#clock_period
  if (data_valid_TB)
    begin
     if (party_en_TB)
         begin
    
          for(j=0;j<(DATA_WIDTH+3);j=j+1)
             begin
              #clock_period 
                 OUT1[j] = Tx_OUT_TB ;
             end
           EXPC_OUT1 [DATA_WIDTH+1] = DUT.parity.party_bit ;
        if(OUT1 == EXPC_OUT1 )  
         begin
          $display("Test Case  is succeeded with OUTPUT = %d AND equal Expec_Data = %d at Time ",OUT1,EXPC_OUT1,$time);

        end 
       else
        begin
         $display("Test Case  is failed with OUTPUT = %d AND Expec_Data = %d at Time ",OUT1,EXPC_OUT1,$time);

        end
         end
     else
       begin
          
         for(j=0;j<DATA_WIDTH+2;j=j+1)
             begin
               #clock_period 
                 OUT2[j] = Tx_OUT_TB ;
             end
        
        if(OUT2 == EXPC_OUT2 )  
         begin
          $display("Test Case  is succeeded with OUTPUT = %d AND equal Expec_Data = %d at Time ",OUT2,EXPC_OUT2,$time);
         end 
        else
         begin
         $display("Test Case  is failed with OUTPUT = %d AND NOT equal Expec_Data = %d at Time ",OUT2,EXPC_OUT2,$time);
         end
       end
    end
   else
     begin
       for(j=0;j<DATA_WIDTH;j=j+1)
             begin
              #clock_period
                 OUT[j] = Tx_OUT_TB ;
             end
       
        if(OUT == EXPC_OUT )  
         begin
          $display("Test Case  is succeeded with OUTPUT = %d AND equal Expec_Data = %d at Time ",OUT,EXPC_OUT,$time);

         end 
        else
         begin
        $display("Test Case  is failed with OUTPUT = %d AND  Expec_Data = %d at Time ",OUT,EXPC_OUT,$time);

         end
        
      end
end

endtask


//clock
always #(clock_period/2)       CLK_TB = ~CLK_TB ;

UART_TOP #(.DATA_WIDTH (8)) DUT (
.CLK(CLK_TB),
.RST(RST_TB),
.P_DATA(P_DATA_TB),
.data_valid(data_valid_TB),
.party_en(party_en_TB),   
.party_typ(party_typ_TB),
.Tx_OUT(Tx_OUT_TB),
.busy(Busy_TB)
);





endmodule