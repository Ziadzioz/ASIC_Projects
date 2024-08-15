module ALU_RTL #(
                    parameter                                 DATA_WIDTH    = 8           
                  )(
                              input wire                      ALU_CLK,RST_SYNC_2,ALU_EN,
                              input wire [DATA_WIDTH - 1 : 0] REG0,REG1,
                              input wire [3:0]                ALU_FUNC,
                              output reg [15:0]               ALU_OUT,
                              output reg                      ALU_OUT_VALID
                     );
  
  reg [15:0] ALU_INT;
  reg        ALU_OUT_VALID_COMP;
  
  always@(*)
begin
  if (ALU_EN)
    begin
      case(ALU_FUNC)
              4'b0000:ALU_INT=REG0+REG1;
              4'b0001:ALU_INT=REG0-REG1;
              4'b0010:ALU_INT=REG0*REG1;
              4'b0011:ALU_INT=REG0/REG1;
              4'b0100:ALU_INT=REG0&REG1;
              4'b0101:ALU_INT=REG0|REG1;
              4'b0110:ALU_INT=~(REG0&REG1);
              4'b0111:ALU_INT=~(REG0|REG1);
              4'b1000:ALU_INT=REG0^REG1;
              4'b1001:ALU_INT=~(REG0^REG1);
              4'b1010:  begin
                              if (REG0==REG1)
                                ALU_INT=1;
                              else
                                ALU_INT=0;
                        end
              4'b1011: begin
                            if (REG0>REG1)
                              ALU_INT=2;
                            else
                              ALU_INT=0;
                      end
              4'b1100: begin
                              if (REG0<REG1)
                                ALU_INT=3;
                              else
                                ALU_INT=0;
                        end
              4'b1101:ALU_INT=REG0 >> 1 ;
              4'b1110:ALU_INT=REG0 << 1;
              default:ALU_INT=16'b0;
      endcase   
              ALU_OUT_VALID_COMP   = 1'b1  ;
    end
  else
    begin
              ALU_INT              = 'b0   ;
              ALU_OUT_VALID_COMP   = 1'b0  ;
     end
    
end

always @ (posedge ALU_CLK or negedge RST_SYNC_2)   
begin
       if (!RST_SYNC_2)
        begin
          ALU_OUT         <= 'b0   ;
          ALU_OUT_VALID   <= 1'b0  ;
        end
       else
        begin
           ALU_OUT         <= ALU_INT;
           ALU_OUT_VALID   <= ALU_OUT_VALID_COMP  ;
        end


end


endmodule
