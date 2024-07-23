module CMP_Unit #(parameter width =16 )(
     input  wire [width-1:0] A,B,
     input  wire [3:0] ALU_FUN,
     input  wire  clock,CMP_enble,rest,
     output reg  CMP_flag,
     output reg  [width-1:0] CMP_OUT);
     
     reg flagcmp;
     reg [width-1:0] outcmp;
     
      always @(*)
         begin 
           if (CMP_enble)
             begin
              flagcmp = 1;
               case (ALU_FUN[1:0])
                 2'b00: outcmp  = 'b0;
                 2'b01: begin
                           if (A==B)
                              outcmp = 1;
                           else
                              outcmp = 0;
                         end
                         
                 2'b10: begin
                           if (A>B)
                              outcmp = 2;
                           else
                              outcmp = 0;
                         end
                 2'b11: begin
                           if (A<B)
                              outcmp = 3;
                           else
                              outcmp = 0;
                         end
               endcase
             end
           else
             begin
               flagcmp = 0;
               outcmp  = 'b0;
             end
       end
       always @(posedge clock or negedge rest)
          begin
            if(!rest)
              begin
               CMP_flag<= 1'b0;
               CMP_OUT <=  'b0;
              end
          else
            begin
               CMP_flag<= flagcmp;
               CMP_OUT <= outcmp;
             end
           end
         endmodule
         

