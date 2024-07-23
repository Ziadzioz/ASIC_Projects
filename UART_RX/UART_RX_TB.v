`timescale 1us/1ns
module UART_RX_TB ();
    
    reg         CLK_TB,RST_TB;
    reg         RX_IN_TB,Parity_en_TB,Parity_type_TB;
    reg [5:0]   Prescale_TB;
    wire        Stop_error_TB,Parity_error_TB,DATA_VALID_TB;
    wire [7:0]  P_DATA_TB;

    
    parameter  TX_clock_period = ((1/115.2)*1000) ;
    parameter  RX_clock_period_8 = (TX_clock_period/8) ;


       initial
          begin
             $dumpfile("UART_RX.vcd") ;       
             $dumpvars; 


            initialization(); 
            RESET();
              


               $display ("Test Case 1 Testing odd parity with prescale 8");
                #(RX_clock_period_8/2)   
                   Pass_DATA_with_Parity (8,1,1,11'b10000001110);
                   Print_Result(8'b00000111);
               $display ("Test Case 2 Testing odd parity with prescale 16");
                #(RX_clock_period_8)   
                   Pass_DATA_with_Parity (16,1,1,11'b10000001110);
                   Print_Result(8'b00000111);
                $display ("Test Case 3 Testing odd parity with prescale 4");
                #(RX_clock_period_8)   
                   Pass_DATA_with_Parity (4,1,1,11'b10000001110);
                   Print_Result(8'b00000111);
                 RESET();
               $display ("Test Case 4 Testing odd parity with prescale 32");
                #(RX_clock_period_8/2)   
                  Pass_DATA_with_Parity (32,1,1,11'b10000001110);
                   Print_Result(8'b00000111);
              
                $display ("Test Case 5 Testing even parity with prescale 8");
                #(RX_clock_period_8/2)   
                   Pass_DATA_with_Parity (8,1,0,11'b11000111110);
                   Print_Result(8'b00011111);
                $display ("Test Case 6 Testing Data without parity and prescale 8");
                   #(RX_clock_period_8/2)   
                   Pass_DATA_without_Parity (8,10'b1000001110);
                   Print_Result(8'b00000111);
                   RESET();
                $display ("Test Case 7 Testing  receiving  2 consecutive frames with and without parity  and prescale 8");
                    #(RX_clock_period_8/2)
                   Pass_DATA_with_Parity (8,1,0,11'b11000011100);
                   Print_Result(8'b00001110);
                   Pass_DATA_without_Parity (8,10'b1000001110);
                   Print_Result(8'b00000111);
                    RESET();
                $display ("Test Case 8 Testing  Stop_error ");
                   #(RX_clock_period_8/2)
                   Pass_DATA_with_Parity (8,1,0,11'b00000011110);
                   Print_Result(8'b00001111); 
                   RESET();
                $display ("Test Case 9 Testing  parity_error ");   
                   #(RX_clock_period_8/2)
                   Pass_DATA_with_Parity (8,1,0,11'b11000011110);
                   Print_Result(8'b00001111); 
                $display ("Test Case 10 Testing  receiving  2 consecutive frames with and without parity  and prescale 8 // 16");
                   #(RX_clock_period_8/2)
                   Pass_DATA_with_Parity (8,1,0,11'b11000111110);
                   Print_Result(8'b00011111);
                   Pass_DATA_without_Parity (16,10'b1000001110);
                   Print_Result(8'b00000111);
                  $display ("THE PROJECT IS DONEEEEE"); // DONNNNNNNNNNE
                   #TX_clock_period
                   
                   $stop ;  


          end


   task   initialization ;
     begin
             RST_TB = 1;
             CLK_TB = 0;
             RX_IN_TB = 1;
             Parity_en_TB = 0;
             Parity_type_TB = 0;
             Prescale_TB = 8;
     end
   endtask


   task   RESET ;
      begin
        RST_TB  = 1'b1 ;
     #RX_clock_period_8
        RST_TB  = 1'b0 ;
     #RX_clock_period_8
        RST_TB  = 1'b1 ;
      end
   endtask 

   task Pass_DATA_with_Parity ;
      input reg [5:0] Scaling;
      input reg       Enable;
      input reg       Type;
      input reg [10:0]  Data_Vector;
      integer  i;
        begin
            Prescale_TB    = Scaling;
            Parity_en_TB   = Enable;
            Parity_type_TB = Type;
                 
                    for (i=0;i<12;i=i+1)
                     begin
                          #(TX_clock_period);
                           RX_IN_TB = Data_Vector[i] ;
                     end
                   RX_IN_TB = 1;
        end
     endtask


     task Pass_DATA_without_Parity ;
      input reg [5:0] Scaling;
      input reg [9:0]  Data_Vector;
      integer  i;
        begin
            Prescale_TB    = Scaling;
            Parity_en_TB   = 0;
            Parity_type_TB = 0;
                 
                    for (i=0;i<11;i=i+1)
                     begin
                          #(TX_clock_period);
                           RX_IN_TB = Data_Vector[i] ;
                     end
                   RX_IN_TB = 1;
        end
     endtask


   task  Print_Result ;
     input reg [7:0] R_DATA;
       begin
        case (Prescale_TB)
           4 : 
               begin
                    #((RX_clock_period_8*2)*3)

                     if(P_DATA_TB == R_DATA)
                         $display ("Test_Case Passed with OUTPUT_DATA is =  %0d   && parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
                     else
                         $display ("Test_Case Falled with OUTPUT_DATA is =  %0d   && parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
               end
           8  :
                begin
                    #((RX_clock_period_8)*3)

                     if(P_DATA_TB == R_DATA)
                         $display ("Test_Case Passed with OUTPUT_DATA is =  %0d   && parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
                     else
                         $display ("Test_Case Falled with OUTPUT_DATA is =  %0d   because parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
               end
           16  :
                begin
                    #((RX_clock_period_8/2)*3)

                     if(P_DATA_TB == R_DATA)
                         $display ("Test_Case Passed with OUTPUT_DATA is =  %0d   && parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
                     else
                         $display ("Test_Case Falled with OUTPUT_DATA is =  %0d   because parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
               end
           32  :
                begin
                    #((RX_clock_period_8/4)*3)

                     if(P_DATA_TB == R_DATA)
                         $display ("Test_Case Passed with OUTPUT_DATA is =  %0d   && parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
                     else
                         $display ("Test_Case Falled with OUTPUT_DATA is =  %0d   because parrity_error = %0d  && Stop_error = %0d   at time  ",P_DATA_TB,Parity_error_TB,Stop_error_TB,$time);
               end
        endcase

       end

    endtask








  //clock

    always #(TX_clock_period/(Prescale_TB*2))       CLK_TB = ~CLK_TB ;


 UART_RX_TOP  DUT (
                    .CLK(CLK_TB),
                    .RST(RST_TB),
                    .Parity_en(Parity_en_TB),   
                    .Parity_type(Parity_type_TB),
                    .RX_IN(RX_IN_TB),
                    .Prescale(Prescale_TB),
                    .Stop_error(Stop_error_TB),
                    .Parity_error(Parity_error_TB),
                    .P_DATA(P_DATA_TB),
                    .DATA_VALID(DATA_VALID_TB)
                   );


endmodule
