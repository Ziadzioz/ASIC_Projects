`timescale  1ns/1ps
 
 module SYSTEM_TOP_TB #(
                         parameter DATA_WIDTH   = 8,
                                   ADDRESS_BITS = 3,
                                   FIFO_DEPTH   = 8,
                                   NUM_STAGES   = 2
                        ) ();

                        reg         REF_CLK_TB,UART_CLK_TB,RST_TB,RX_IN_TB;
                        wire        Tx_OUT_TB,Parity_error_TB,Stop_error_TB;
                        parameter   REF_CLK_PERIOD  = 20 ;
                        parameter   UART_CLK_PERIOD = 271.267 ;
                        parameter   UART_TX_CLK_PERIOD = 8680.55 ;
                                   
                           


                initial 
                            begin

                                   $dumpfile("SYSTEM_TOP.vcd");
                                   $dumpvars;
                                   
                                   initialization();
                                   RESET();

            
                           //wirte  OPERATION IN REG2   
                              $display("TEST CASE 1 WRITE OPERATION IN REG2  = 10000011 and REG3 = 00100000 ");
                              Pass_DATA(11'b10101010100);              
                              #(3*UART_TX_CLK_PERIOD)
                            WRITE_OPERATION(11'b11000000100,11'b11100000110); // CHANGE DEFUALT CONFG AND MAKING PRESCALE <<<<< 32 &&&  MAKEING PARITYY_TYPE 1 (ODD) INSTEAD OF EVEN 
                           //wirte  OPERATION IN REG3 
                             Pass_DATA(11'b11101010100);              
                             #(3*UART_TX_CLK_PERIOD)
                             WRITE_OPERATION(11'b11000000110,11'b10001000000); // MAKING DIV_RATIO <<<< 32 

                           // READ  OPERATION FOR REG2
                            $display("TEST CASE 2 READ OPERATION DATA inside REG2  && REG3 RESCPICTIVLY");
                            READ_OPERATION(11'b10000000100);
                            VERIFY_READ(11'b10100000110);
                            // READ  OPERATION FOR REG3
                            READ_OPERATION(11'b11000000110);
                            VERIFY_READ(11'b10001000000);


                            // ALU_WITH_OPERANDS
                            $display("TEST CASE 3 ALU OPERATION (A + B)  A = 00000001  && B = 00000010  ");
                            ALU_WITH_OPERNDS(11'b10000000010,11'b10000000100,11'b11000000000);  
                            $display("Testing the Least 8 bits from ALU_OUT &&  EXPECTED_RESULT = 00000011  ");  
                            $display("Testing the Most 8 bits from ALU_OUT &&  EXPECTED_RESULT = 00000000  "); 
                            VERIFY_ALU(23'b11000000000111000000110);
                       
                            //wirte  OPERATION IN REG0 VALUE 15 
                            $display("TEST CASE 4 WRITE OPERATION IN REG0  = 00001111 and REG1 = 00001111 ");
                            Pass_DATA(11'b11101010100);              
                             #(3*UART_TX_CLK_PERIOD)
                            WRITE_OPERATION(11'b11000000000,11'b11000011110);
                            //wirte  OPERATION IN REG1 VALUE 15 
                            Pass_DATA(11'b11101010100);              
                            #(3*UART_TX_CLK_PERIOD)
                            WRITE_OPERATION(11'b10000000010,11'b11000011110);


                            // ALU_WITH_OUT_OPERANDS
                            $display("TEST CASE 5 ALU OPERATION_WITHOUT_OPERANDS USIND DATA INSIDE REG0 && REG1 <<<  (A + B)  A = 00001111  && B = 00001111  ");
                             ALU_WITH_OUT_OPERANDS(11'b11000000000);
                             $display("Testing the Least 8 bits from ALU_OUT &&  EXPECTED_RESULT = 00011110  ");  
                             $display("Testing the Most 8 bits from ALU_OUT &&  EXPECTED_RESULT  = 00000000  "); 
                             VERIFY_ALU(23'b11000000000111000111100);
                            
                            #(3*UART_TX_CLK_PERIOD)  ;          



                                 $stop ;

                            end

    

   
   task   initialization ;
     begin
             RST_TB = 1;
             REF_CLK_TB = 0;
             UART_CLK_TB = 0;
             RX_IN_TB = 1;
     end
   endtask                       

 

   task   RESET ;
      begin
        RST_TB  = 1'b1 ;
     #UART_CLK_PERIOD
        RST_TB  = 1'b0 ;
     #UART_CLK_PERIOD
        RST_TB  = 1'b1 ;
      end
   endtask    


   
   task Pass_DATA ;
    
      input reg [10:0]  Data_Vector;
      integer  i;
        begin
               
                    for (i=0;i<12;i=i+1)
                     begin
                          #(UART_TX_CLK_PERIOD);
                           RX_IN_TB = Data_Vector[i] ;
                     end
                   RX_IN_TB = 1;
        end
     endtask

  task  WRITE_OPERATION ;
      
      input reg [10:0]  REG_Address,WRITE_DATA;
       begin
                  // DO_WRITE_OPERATION  0xAA
                
                 Pass_DATA(REG_Address);
                 #(3*UART_TX_CLK_PERIOD);
                  Pass_DATA(WRITE_DATA);
                  #(3*UART_TX_CLK_PERIOD);

       end
 endtask

 task  READ_OPERATION ;
      
      input reg [10:0]  REG_Address;
       begin
                  // DO_READ_OPERATION  0xBB
                 Pass_DATA(11'b11101110110);              
                 #(3*UART_TX_CLK_PERIOD)
                  Pass_DATA(REG_Address);
                 #(3*UART_TX_CLK_PERIOD)  ;
                 

       end
 endtask


task  ALU_WITH_OPERNDS ;
   
   input reg [10:0]  A,B,ALU_FUN;
    

    begin 
                    // DO_ALU_OPERATION_with_OPERANDS  0xCC
                      Pass_DATA(11'b11110011000);              
                     #(3*UART_TX_CLK_PERIOD)
                      Pass_DATA(A);
                    #(3*UART_TX_CLK_PERIOD);
                      Pass_DATA(B);
                    #(3*UART_TX_CLK_PERIOD);
                      Pass_DATA(ALU_FUN);
                      #(3*UART_TX_CLK_PERIOD);
    end

endtask

task  ALU_WITH_OUT_OPERANDS ;
   
   input reg [10:0] ALU_FUN;
    

    begin 
                    // DO_ALU_OPERATION_without_OPERANDS  0xDD
                             Pass_DATA(11'b11110111010);              
                             #(3*UART_TX_CLK_PERIOD)
                             Pass_DATA(ALU_FUN);
                             #(3*UART_TX_CLK_PERIOD);
    end

endtask







 task VERIFY_READ ;
input reg [10:0]  READ_DATA ;
      reg [10:0]  R_READED_DATA;
      integer  i;

begin


  wait(DUT.SYS_UART_TOP.UART_TX_TOP.data_valid);
   @(posedge DUT.SYS_UART_TOP.TX_CLK);
          
        for (i = 0;i<11 ;i = i + 1 )
             begin
                
                R_READED_DATA[i] = Tx_OUT_TB ;
                @(posedge DUT.SYS_UART_TOP.TX_CLK);
              // #(UART_TX_CLK_PERIOD);
              
              end
     
   
         // #(3*UART_TX_CLK_PERIOD);
          if (READ_DATA == R_READED_DATA)
          begin
            $display("TEST CASE PASSED and readed data from REG_FILE = %b at time  ",R_READED_DATA[8:1],$time);   
          end
       else
         begin
            $display("TEST CASE FALLED and readed data from REG_FILE = %b at time  ",R_READED_DATA[8:1],$time);  
          end   
          
           
end
  endtask



  task VERIFY_ALU ;
input reg [22:0]  READ_DATA ;
      reg [22:0]  READED_DATA;
      integer  i;

begin

    wait(DUT.SYS_UART_TOP.UART_TX_TOP.data_valid);
   @(negedge DUT.SYS_UART_TOP.TX_CLK);
    
    
        for (i = 0;i<24 ;i = i + 1 )
             begin
               
                READED_DATA[i] = Tx_OUT_TB ;
                 @(negedge DUT.SYS_UART_TOP.TX_CLK);
              
              end
     
         // #(3*UART_TX_CLK_PERIOD);
          if (READ_DATA == READED_DATA)
          begin
            $display("TEST CASE PASSED and readed data LEST_8_BITS from REG_FILE = %b at time  ",READ_DATA[8:1],$time);   
            $display("TEST CASE PASSED and readed data MOST_8_BITS from REG_FILE = %b at time  ",READ_DATA[20:13],$time);  
          end
       else
         begin
            $display("TEST CASE FALLED and readed data LEST_8_BITS from REG_FILE = %b at time  ",READ_DATA[8:1],$time);  
            $display("TEST CASE FALLED and readed data MOST_8_BITS from REG_FILE = %b at time  ",READ_DATA[20:13],$time);  

          end   
          READED_DATA = 0;
           
end
  endtask









      


 always #(UART_CLK_PERIOD/2)       UART_CLK_TB = ~UART_CLK_TB ;

 always #(REF_CLK_PERIOD/2)        REF_CLK_TB = ~REF_CLK_TB ;


SYSTEM_TOP     #(.NUM_STAGES(NUM_STAGES),
                 .DATA_WIDTH(DATA_WIDTH),
                 .FIFO_DEPTH(FIFO_DEPTH),
                 .ADDRESS_BITS(ADDRESS_BITS))   DUT (

                                                     .REF_CLK(REF_CLK_TB),
                                                     .UART_CLK(UART_CLK_TB),
                                                     .RST(RST_TB),
                                                     .RX_IN(RX_IN_TB),
                                                     .Tx_OUT(Tx_OUT_TB),
                                                     .Parity_error(Parity_error_TB),
                                                     .Stop_error(Stop_error_TB)

                                                     );


    
 endmodule
