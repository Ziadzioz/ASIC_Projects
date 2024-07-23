module Arithmtic_Unit #(parameter widthab=16,widtharthmtic=32)(
     input  wire signed [widthab-1:0]       A,B,
     input  wire        [3:0]               ALU_FUN,
     input  wire                            clock,arth_enable,rest,
     output reg                             arth_flag,
     output reg                             carry_out,
     output reg signed  [widtharthmtic-1:0] Arthmtic_out);
     
     reg flagarth;
     reg outcarry;
     reg [widtharthmtic-1:0] outarth;
     
      always @(*)
         begin 
           if (arth_enable)
             begin
               flagarth = 1;
               case (ALU_FUN[1:0])
                 2'b00: begin
                             outarth = A+B;
                             outcarry = outarth[widthab];
                        end
                 2'b01: begin
                             outarth = A-B;
                             outcarry = outarth[widthab];
                        end
                 2'b10: begin
                             outarth = A*B;
                             outcarry = outarth[widthab];
                        end
                 2'b11: begin
                             outarth = A/B;
                             outcarry = outarth[widthab];
                        end
               endcase
             end
           else
             begin
               flagarth = 0;
               outarth  = 'b0;
               outcarry = 0;
             end
       end
       always @(posedge clock or negedge rest)
          begin
            if(!rest)
              begin
               arth_flag<= 1'b0;
               Arthmtic_out <=  'b0;
              end
          else
            begin
               arth_flag<= flagarth;
               Arthmtic_out <= outarth;
               carry_out<= outcarry;
             end
           end
         endmodule
         
