module Parity_Check (
               input wire       CLK,RST,Parity_type,parity_check_en,Sampled_Bit,parity_flag,
               output reg       Parity_error
              );
        
        always @(posedge CLK or negedge RST )
          begin
            if (!RST)
              begin
                  Parity_error <= 0;
              end
            else
              begin
                 if (parity_check_en)
                   begin
                     if (Parity_type)
                       begin
                         if (parity_flag == ~Sampled_Bit)
                            begin
                               Parity_error <= 0 ;
                            end
                         else
                            begin
                               Parity_error <= 1 ;
                            end
                       end
                     else
                       begin
                        if (parity_flag == Sampled_Bit)
                            begin
                               Parity_error <= 0 ;
                            end
                         else
                            begin
                               Parity_error <= 1 ;
                            end
                       end
                     
                   end
                 else
                  begin
                      Parity_error <= Parity_error;
                  end
              end   
          end  
endmodule
