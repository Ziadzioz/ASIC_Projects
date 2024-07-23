module Bit_counter (
                      input wire CLK,RST,edge_count_en,
                      input wire [5:0] Prescale,
                      output reg [3:0] bit_count,
                      output reg [5:0] edge_count   
                     );
                
          always @(posedge CLK or negedge RST ) 
             begin

               if (!RST) 
                 begin
                     bit_count  <= 1'b0;
                     edge_count <= 1'b0;
                 end
               else
                begin
                      if (edge_count_en)
                        begin
                             if (edge_count == (Prescale-1))
                               begin                              
                                edge_count <= 1'b0;
                                bit_count  <= bit_count + 1;
                               end
                             else
                               begin
                                edge_count <= edge_count + 1;
                                bit_count  <= bit_count;
                               end
                        end
                      else
                       begin
                              bit_count  <= 1'b0;
                              edge_count <= 1'b0;
                        end
                end 
             end
    
endmodule
