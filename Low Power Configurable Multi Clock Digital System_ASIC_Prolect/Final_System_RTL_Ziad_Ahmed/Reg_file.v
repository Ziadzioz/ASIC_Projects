module Reg_file #(
                    parameter DATA_WIDTH    = 8,
                              ADDRESS_BITS  = 3
                  )( 
                      input wire                                  CLK,RST,R_REG_EN,W_REG_EN,
                      input wire  [ADDRESS_BITS : 0]              REG_ADDRESS,
                      input wire  [DATA_WIDTH - 1: 0]             W_REG_DATA,
                      output reg                                  R_DATA_VALID,
                      output reg  [DATA_WIDTH - 1: 0]             R_REG_DATA,
                      output wire [DATA_WIDTH - 1: 0]             REG0,REG1,REG2,REG3
                    );
  
                      reg [DATA_WIDTH - 1: 0]                    Reg_file [15:0];
                      integer                                    i;
  
  always @(posedge CLK or negedge RST)
    begin
      if (!RST)
       begin
                  for (i = 0;i < 16 ;i = i + 1 )
                   begin
                          Reg_file[i] <= 0;
                   end
         
                         R_DATA_VALID <=  1'b0;
                         Reg_file[2]  <=  'b10000001;
                         Reg_file[3]  <=  'b00100000;
       end
     else
       begin
       if ((!R_REG_EN)&&W_REG_EN)
         begin
                     Reg_file[REG_ADDRESS] <= W_REG_DATA;
                     R_DATA_VALID          <= 1'b0;
         end
       else if (R_REG_EN&&(!W_REG_EN))
         begin
             
              R_DATA_VALID <= 1'b1;
              R_REG_DATA   <= Reg_file[REG_ADDRESS];
             
         end
       else
        begin
              R_DATA_VALID <= 1'b0;
              R_REG_DATA <= 0;
        end
     end
    end


   assign  REG0 = Reg_file[0];
   assign  REG1 = Reg_file[1];
   assign  REG2 = Reg_file[2];
   assign  REG3 = Reg_file[3];



   endmodule
          
         
             
             
             
             
             
             
             
             
             
             
             
          
