module CLOCK_GATING (
                       input wire         REF_CLK,CLK_GATE_EN,
                       output wire        ALU_CLK
                     );
                       
  /*                            reg        latch;

        always @(REF_CLK or CLK_GATE_EN)
          begin
              if (!REF_CLK)
                begin
                      latch <= CLK_GATE_EN;
                 end
          end


 assign   ALU_CLK = (latch & REF_CLK ) ;

*/

TLATNCAX12M U0_TLATNCAX12M (
.E(CLK_GATE_EN),
.CK(REF_CLK),
.ECK(ALU_CLK)
);











endmodule
