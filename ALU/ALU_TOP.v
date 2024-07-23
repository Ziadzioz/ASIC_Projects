module ALU_TOP #(parameter widtha = 16,widthart = 32)(
  input wire [widtha-1:0] A,B,
  input wire CLK,RST,
  input wire [3:0] ALU_FUN,
  output wire carry_out,arith_flag,logic_flag,cmp_flag,shift_flag,
  output wire [widtha-1:0] shift_out,cmp_out,logic_out,
  output wire   signed [widthart-1:0] arith_out);
  
  wire enable_arithmtic,enable_logic,enable_cmp,enable_shift;
  
  
  Decoder_unit Decoder (.ALU_FUN(ALU_FUN),
                        .Arith_enable(enable_arithmtic),
                        .Logic_enable(enable_logic),
                        .CMP_enable(enable_cmp),
                        .Shift_enable(enable_shift)
                         );
 
  Shift_Unit  Shift   (.A(A),
                       .B(B),
                       .ALU_FUN(ALU_FUN),
                       .clock(CLK),
                       .rest(RST),
                       .shift_enable(enable_shift),
                       .shift_flag(shift_flag),
                       .shift_out(shift_out)
                         );
 
  CMP_Unit CMP (.A(A),
                .B(B),
                .ALU_FUN(ALU_FUN),
                .clock(CLK),
                .rest(RST),
                .CMP_enble(enable_cmp),
                .CMP_flag(cmp_flag),
                .CMP_OUT(cmp_out)
                );
                
  Logic_Unit Logic    (.A(A),
                       .B(B),
                       .ALU_FUN(ALU_FUN),
                       .clock(CLK),
                       .rest(RST),
                       .logic_enable(enable_logic),
                       .logic_flag(logic_flag),
                       .logic_out(logic_out)
                       );
                
  Arithmtic_Unit  Arithmtic (.A(A),
                             .B(B),
                             .ALU_FUN(ALU_FUN),
                             .clock(CLK),
                             .rest(RST),
                             .arth_enable(enable_arithmtic),
                             .arth_flag(arith_flag),
                             .carry_out(carry_out),
                             .Arthmtic_out(arith_out)
                              );
endmodule                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
  
