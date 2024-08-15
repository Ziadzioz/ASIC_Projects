module serializer #( parameter DATA_WIDTH = 8)(
 input wire [DATA_WIDTH-1 : 0] P_DATA,
 input wire ser_en,RST,CLK,data_valid,
 output wire ser_done,
 output reg ser_data   
);

 reg [3:0] counter ;
 reg [DATA_WIDTH-1 : 0] P_DATA_COMP;
    always @(posedge CLK or negedge RST) 
        begin
         if (!RST)
          begin
            
            counter  <= 0 ;
          end
         
         else if (ser_en && counter == (DATA_WIDTH - 1))
          begin
          
                counter  <= 0 ;
               
          end
          else if (ser_en )
           begin
           
           
            counter <= counter + 1;
    
           end
         else
           begin
               counter  <= 0 ;
              
           end
      end
  always @(posedge CLK or negedge RST)
    begin

         if (!RST)
          begin 
            P_DATA_COMP  <= 0 ;
          end
    
    else if (data_valid && counter == 0)
       begin
         P_DATA_COMP <= P_DATA;
       end
      end

always @(*)
 begin
  if(ser_en)
   begin
     ser_data = P_DATA_COMP[counter] ;
   end
   else
    ser_data = 0 ;
    end

  


    assign  ser_done = (counter == 7) ;
    
endmodule

