module Logic_Unit #(parameter width=16)(
     input  wire [width-1:0] A,B,
     input  wire [3:0]       ALU_FUN,
     input  wire             clock,logic_enable,rest,
     output reg              logic_flag,
     output reg  [width-1:0] logic_out);
     
     reg             flaglogic;
     reg [width-1:0] outlogic;
     
      always @(*)
         begin 
           if (logic_enable)
             begin
               flaglogic = 1;
               case (ALU_FUN[1:0])
                 2'b00:outlogic=A&B;
                 2'b01:outlogic=A|B;
                 2'b10:outlogic=~(A&B);
                 2'b11:outlogic=~(A|B);
               endcase
             end
           else
             begin
               flaglogic = 0;
               outlogic  = 'b0;
             end
       end
       always @(posedge clock or negedge rest)
          begin
            if(!rest)
              begin
               logic_flag<= 1'b0;
               logic_out <=  'b0;
              end
          else
            begin
               logic_flag<= flaglogic;
               logic_out <= outlogic;
             end
           end
         endmodule