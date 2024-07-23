module Start_Check (
               input wire CLK,RST,start_en,Sampled_Bit,
               output reg Start_glitch
              );
        
        always @(posedge CLK or negedge RST )
          begin
            if (!RST)
              begin
                  Start_glitch <= 0;
              end
            else
              begin
                 if (start_en)
                   begin
                     Start_glitch <= Sampled_Bit ;
                   end
                 else
                  begin
                      Start_glitch <= 0;
                  end
              end   
          end  
endmodule
