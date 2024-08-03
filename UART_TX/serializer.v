module serializer #( parameter DATA_WIDTH = 8)(
 input wire [DATA_WIDTH-1 : 0] P_DATA,
 input wire ser_en,RST,CLK,
 output wire ser_done,
 output reg ser_data   
);

 reg [3:0] counter ;
    always @(posedge CLK or negedge RST) 
        begin
         if (!RST)
          begin
      //  ser_data<= 0;
       // ser_done<= 0;
        counter <=0 ;
          end
         
         else if (ser_en && counter == 7)
          begin
          //  ser_done <= 1;
            counter <= 0 ;
          end
          else if (ser_en )
           begin
           
                
          //      ser_data <= P_DATA[counter] ;
                counter <= counter + 1;
    
              //ser_done <= 0;
           end
         else
           begin
        //  ser_data <= 0;
         // ser_done <= 0;
           end
      end
  always @(*)
    begin
  if(ser_en)
   begin
     ser_data = P_DATA[counter] ;
   end
   else
    ser_data = 0 ;
    end


    assign  ser_done = (counter == 7) ;
    
endmodule
