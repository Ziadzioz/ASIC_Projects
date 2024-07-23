module Stop_Check (
               input wire CLK,RST,stop_en,Sampled_Bit,
               output reg Stop_error
              );
        
        always @(posedge CLK or negedge RST )
          begin
            if (!RST)
              begin
                  Stop_error <= 0;
              end
            else
              begin
                 if (stop_en)
                   begin
                     Stop_error <= ~Sampled_Bit ;
                   end
                 else
                  begin
                      Stop_error <= Stop_error;
                  end
              end   
          end  
endmodule

