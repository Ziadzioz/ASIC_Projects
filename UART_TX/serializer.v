module serializer #( parameter DATA_WIDTH = 8)(
 input wire [DATA_WIDTH-1 : 0] P_DATA,
 input wire ser_en,RST,CLK,
 output wire ser_done,
 output reg ser_data   
);
 integer  i;
 reg [3:0] counter = 0;
    always @(posedge CLK or negedge RST) 
        begin
         if (!RST)
          begin
        ser_data<= 0;
       // ser_done<= 0;
        counter <=0 ;
          end
         else if (ser_en && counter == !7)
           begin
            for (i = 0; i < DATA_WIDTH ; i = i +1)
              begin
                @(posedge CLK)
                ser_data <= P_DATA[i] ;
                counter <= counter + 1;
              end
              //ser_done <= 0;
           end
         else if (ser_en && counter == 8)
          begin
          //  ser_done <= 1;
            counter <= 0 ;
          end
         else
           begin
          ser_data <= 0;
         // ser_done <= 0;
           end
      end
    assign  ser_done = (counter == 8) ;
    
endmodule
