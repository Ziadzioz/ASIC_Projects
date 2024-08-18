/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sat Aug 17 18:02:08 2024
/////////////////////////////////////////////////////////////


module DFT_MUX_0 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module DFT_MUX_6 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module DFT_MUX_5 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module DFT_MUX_4 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module DFT_MUX_3 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module DFT_MUX_2 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module DFT_MUX_1 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  AO2B2X2M U1 ( .B0(sel), .B1(in_1), .A0(in_0), .A1N(sel), .Y(out) );
endmodule


module RESET_SYNC_NUM_STAGES2_test_0 ( CLK, RST, RST_SYNC, test_si, test_so, 
        test_se );
  input CLK, RST, test_si, test_se;
  output RST_SYNC, test_so;

  wire   [1:0] SYNC_BUS;
  assign test_so = SYNC_BUS[1];

  SDFFRQX2M RST_SYNC_reg ( .D(SYNC_BUS[1]), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(RST_SYNC) );
  SDFFRQX2M \SYNC_BUS_reg[0]  ( .D(1'b1), .SI(RST_SYNC), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_BUS[0]) );
  SDFFRQX2M \SYNC_BUS_reg[1]  ( .D(SYNC_BUS[0]), .SI(SYNC_BUS[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_BUS[1]) );
endmodule


module RESET_SYNC_NUM_STAGES2_test_1 ( CLK, RST, RST_SYNC, test_si, test_so, 
        test_se );
  input CLK, RST, test_si, test_se;
  output RST_SYNC, test_so;

  wire   [1:0] SYNC_BUS;
  assign test_so = SYNC_BUS[1];

  SDFFRQX2M RST_SYNC_reg ( .D(SYNC_BUS[1]), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(RST_SYNC) );
  SDFFRQX2M \SYNC_BUS_reg[0]  ( .D(1'b1), .SI(RST_SYNC), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_BUS[0]) );
  SDFFRQX2M \SYNC_BUS_reg[1]  ( .D(SYNC_BUS[0]), .SI(SYNC_BUS[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_BUS[1]) );
endmodule


module PRESCALE_BLOCK ( PRESCALE, DIV_RATIO );
  input [5:0] PRESCALE;
  output [7:0] DIV_RATIO;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign DIV_RATIO[4] = 1'b0;
  assign DIV_RATIO[5] = 1'b0;
  assign DIV_RATIO[6] = 1'b0;
  assign DIV_RATIO[7] = 1'b0;

  NOR4X1M U3 ( .A(n5), .B(PRESCALE[3]), .C(PRESCALE[5]), .D(PRESCALE[4]), .Y(
        DIV_RATIO[3]) );
  NOR3X2M U4 ( .A(n6), .B(PRESCALE[1]), .C(PRESCALE[0]), .Y(DIV_RATIO[2]) );
  NAND4BX1M U5 ( .AN(PRESCALE[4]), .B(PRESCALE[3]), .C(n2), .D(n1), .Y(n6) );
  NAND4BX1M U6 ( .AN(PRESCALE[3]), .B(PRESCALE[4]), .C(n2), .D(n1), .Y(n7) );
  NOR3X2M U7 ( .A(n7), .B(PRESCALE[1]), .C(PRESCALE[0]), .Y(DIV_RATIO[1]) );
  NAND3X2M U8 ( .A(n4), .B(n3), .C(PRESCALE[2]), .Y(n5) );
  OAI211X2M U9 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(DIV_RATIO[0]) );
  NAND2X2M U10 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U11 ( .A(PRESCALE[5]), .B(PRESCALE[4]), .C(PRESCALE[3]), .D(n2), .Y(
        n8) );
  INVX2M U12 ( .A(PRESCALE[1]), .Y(n3) );
  INVX2M U13 ( .A(PRESCALE[2]), .Y(n2) );
  INVX2M U14 ( .A(PRESCALE[0]), .Y(n4) );
  INVX2M U15 ( .A(PRESCALE[5]), .Y(n1) );
endmodule


module CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLK_DIV_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_test_1 ( RST_EN, I_REF_CLK, CLK_EN, DIV_RATIO, O_DIV_CLK, 
        test_si, test_so, test_se );
  input [7:0] DIV_RATIO;
  input RST_EN, I_REF_CLK, CLK_EN, test_si, test_se;
  output O_DIV_CLK, test_so;
  wire   out_clk, flag, N13, N14, N15, N16, N17, N18, N19, N20, N25, N26, N27,
         N28, N29, N30, N31, N32, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n1, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51;
  wire   [7:0] counter;
  assign test_so = out_clk;

  SDFFSQX2M flag_reg ( .D(n29), .SI(counter[7]), .SE(test_se), .CK(I_REF_CLK), 
        .SN(RST_EN), .Q(flag) );
  SDFFRQX2M out_clk_reg ( .D(n30), .SI(flag), .SE(test_se), .CK(I_REF_CLK), 
        .RN(RST_EN), .Q(out_clk) );
  SDFFRQX2M \counter_reg[7]  ( .D(n31), .SI(counter[6]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n38), .SI(test_si), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[6]  ( .D(n32), .SI(counter[5]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[5]  ( .D(n33), .SI(counter[4]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[4]  ( .D(n34), .SI(counter[3]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n35), .SI(counter[2]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n36), .SI(counter[1]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n37), .SI(counter[0]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[1]) );
  NOR2BX2M U5 ( .AN(CLK_EN), .B(n18), .Y(n51) );
  MX2X2M U7 ( .A(I_REF_CLK), .B(out_clk), .S0(n51), .Y(O_DIV_CLK) );
  AO2B2X1M U12 ( .B0(N25), .B1(n1), .A0(counter[0]), .A1N(n51), .Y(n38) );
  AO2B2X1M U17 ( .B0(N26), .B1(n1), .A0(counter[1]), .A1N(n51), .Y(n37) );
  AO2B2X1M U18 ( .B0(N27), .B1(n1), .A0(counter[2]), .A1N(n51), .Y(n36) );
  AO2B2X1M U19 ( .B0(N28), .B1(n1), .A0(counter[3]), .A1N(n51), .Y(n35) );
  AO2B2X1M U20 ( .B0(N29), .B1(n1), .A0(counter[4]), .A1N(n51), .Y(n34) );
  AO2B2X1M U21 ( .B0(N30), .B1(n1), .A0(counter[5]), .A1N(n51), .Y(n33) );
  AO2B2X1M U22 ( .B0(N31), .B1(n1), .A0(counter[6]), .A1N(n51), .Y(n32) );
  AO2B2X1M U23 ( .B0(N32), .B1(n1), .A0(counter[7]), .A1N(n51), .Y(n31) );
  AND3X1M U24 ( .A(n3), .B(n4), .C(n51), .Y(n1) );
  CLKXOR2X2M U25 ( .A(out_clk), .B(n5), .Y(n30) );
  AOI21BX1M U26 ( .A0(n4), .A1(n3), .B0N(n51), .Y(n5) );
  OR2X1M U27 ( .A(n6), .B(DIV_RATIO[0]), .Y(n3) );
  XNOR2X1M U28 ( .A(flag), .B(n7), .Y(n29) );
  NAND2BX1M U29 ( .AN(n4), .B(n51), .Y(n7) );
  NOR4BX1M U30 ( .AN(n19), .B(DIV_RATIO[2]), .C(DIV_RATIO[3]), .D(DIV_RATIO[1]), .Y(n18) );
  NOR4X1M U31 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n19) );
  CLKNAND2X2M U32 ( .A(n20), .B(DIV_RATIO[0]), .Y(n4) );
  MXI2X1M U33 ( .A(n21), .B(n6), .S0(flag), .Y(n20) );
  CLKNAND2X2M U34 ( .A(n22), .B(n23), .Y(n6) );
  NOR4X1M U35 ( .A(counter[7]), .B(n24), .C(n25), .D(n26), .Y(n23) );
  CLKXOR2X2M U36 ( .A(counter[2]), .B(DIV_RATIO[3]), .Y(n26) );
  CLKXOR2X2M U37 ( .A(counter[1]), .B(DIV_RATIO[2]), .Y(n25) );
  CLKXOR2X2M U38 ( .A(counter[0]), .B(DIV_RATIO[1]), .Y(n24) );
  NOR4X1M U39 ( .A(n27), .B(n28), .C(n39), .D(n40), .Y(n22) );
  CLKXOR2X2M U40 ( .A(counter[6]), .B(DIV_RATIO[7]), .Y(n40) );
  CLKXOR2X2M U41 ( .A(counter[5]), .B(DIV_RATIO[6]), .Y(n39) );
  CLKXOR2X2M U42 ( .A(counter[4]), .B(DIV_RATIO[5]), .Y(n28) );
  CLKXOR2X2M U43 ( .A(counter[3]), .B(DIV_RATIO[4]), .Y(n27) );
  CLKNAND2X2M U44 ( .A(n41), .B(n42), .Y(n21) );
  NOR4X1M U45 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n42) );
  CLKXOR2X2M U46 ( .A(counter[3]), .B(N16), .Y(n46) );
  CLKXOR2X2M U47 ( .A(counter[2]), .B(N15), .Y(n45) );
  CLKXOR2X2M U48 ( .A(counter[1]), .B(N14), .Y(n44) );
  CLKXOR2X2M U49 ( .A(counter[0]), .B(N13), .Y(n43) );
  NOR4X1M U50 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n41) );
  CLKXOR2X2M U51 ( .A(counter[7]), .B(N20), .Y(n50) );
  CLKXOR2X2M U52 ( .A(counter[6]), .B(N19), .Y(n49) );
  CLKXOR2X2M U53 ( .A(counter[5]), .B(N18), .Y(n48) );
  CLKXOR2X2M U54 ( .A(counter[4]), .B(N17), .Y(n47) );
  CLK_DIV_0_DW01_inc_0 add_43 ( .A(counter), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25}) );
  CLK_DIV_0_DW01_inc_1 add_36 ( .A({1'b0, DIV_RATIO[7:1]}), .SUM({N20, N19, 
        N18, N17, N16, N15, N14, N13}) );
endmodule


module CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLK_DIV_1_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_test_0 ( RST_EN, I_REF_CLK, CLK_EN, DIV_RATIO, O_DIV_CLK, 
        test_si, test_so, test_se );
  input [7:0] DIV_RATIO;
  input RST_EN, I_REF_CLK, CLK_EN, test_si, test_se;
  output O_DIV_CLK, test_so;
  wire   out_clk, flag, N13, N14, N15, N16, N17, N18, N19, N20, N25, N26, N27,
         N28, N29, N30, N31, N32, n1, n3, n4, n5, n6, n7, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61;
  wire   [7:0] counter;
  assign test_so = out_clk;

  SDFFSQX2M flag_reg ( .D(n61), .SI(counter[7]), .SE(test_se), .CK(I_REF_CLK), 
        .SN(RST_EN), .Q(flag) );
  SDFFRQX2M out_clk_reg ( .D(n60), .SI(flag), .SE(test_se), .CK(I_REF_CLK), 
        .RN(RST_EN), .Q(out_clk) );
  SDFFRQX2M \counter_reg[7]  ( .D(n59), .SI(counter[6]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n52), .SI(test_si), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[6]  ( .D(n58), .SI(counter[5]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[5]  ( .D(n57), .SI(counter[4]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[4]  ( .D(n56), .SI(counter[3]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n55), .SI(counter[2]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n54), .SI(counter[1]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n53), .SI(counter[0]), .SE(test_se), .CK(
        I_REF_CLK), .RN(RST_EN), .Q(counter[1]) );
  NOR2BX2M U5 ( .AN(CLK_EN), .B(n18), .Y(n51) );
  MX2X2M U7 ( .A(I_REF_CLK), .B(out_clk), .S0(n51), .Y(O_DIV_CLK) );
  AO2B2X1M U12 ( .B0(N25), .B1(n1), .A0(counter[0]), .A1N(n51), .Y(n52) );
  AO2B2X1M U17 ( .B0(N26), .B1(n1), .A0(counter[1]), .A1N(n51), .Y(n53) );
  AO2B2X1M U18 ( .B0(N27), .B1(n1), .A0(counter[2]), .A1N(n51), .Y(n54) );
  AO2B2X1M U19 ( .B0(N28), .B1(n1), .A0(counter[3]), .A1N(n51), .Y(n55) );
  AO2B2X1M U20 ( .B0(N29), .B1(n1), .A0(counter[4]), .A1N(n51), .Y(n56) );
  AO2B2X1M U21 ( .B0(N30), .B1(n1), .A0(counter[5]), .A1N(n51), .Y(n57) );
  AO2B2X1M U22 ( .B0(N31), .B1(n1), .A0(counter[6]), .A1N(n51), .Y(n58) );
  AO2B2X1M U23 ( .B0(N32), .B1(n1), .A0(counter[7]), .A1N(n51), .Y(n59) );
  AND3X1M U24 ( .A(n3), .B(n4), .C(n51), .Y(n1) );
  CLKXOR2X2M U25 ( .A(out_clk), .B(n5), .Y(n60) );
  AOI21BX1M U26 ( .A0(n4), .A1(n3), .B0N(n51), .Y(n5) );
  OR2X1M U27 ( .A(n6), .B(DIV_RATIO[0]), .Y(n3) );
  XNOR2X1M U28 ( .A(flag), .B(n7), .Y(n61) );
  NAND2BX1M U29 ( .AN(n4), .B(n51), .Y(n7) );
  NOR4BX1M U30 ( .AN(n19), .B(DIV_RATIO[2]), .C(DIV_RATIO[3]), .D(DIV_RATIO[1]), .Y(n18) );
  NOR4X1M U31 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n19) );
  CLKNAND2X2M U32 ( .A(n20), .B(DIV_RATIO[0]), .Y(n4) );
  MXI2X1M U33 ( .A(n21), .B(n6), .S0(flag), .Y(n20) );
  CLKNAND2X2M U34 ( .A(n22), .B(n23), .Y(n6) );
  NOR4X1M U35 ( .A(counter[7]), .B(n24), .C(n25), .D(n26), .Y(n23) );
  CLKXOR2X2M U36 ( .A(counter[2]), .B(DIV_RATIO[3]), .Y(n26) );
  CLKXOR2X2M U37 ( .A(counter[1]), .B(DIV_RATIO[2]), .Y(n25) );
  CLKXOR2X2M U38 ( .A(counter[0]), .B(DIV_RATIO[1]), .Y(n24) );
  NOR4X1M U39 ( .A(n27), .B(n28), .C(n39), .D(n40), .Y(n22) );
  CLKXOR2X2M U40 ( .A(counter[6]), .B(DIV_RATIO[7]), .Y(n40) );
  CLKXOR2X2M U41 ( .A(counter[5]), .B(DIV_RATIO[6]), .Y(n39) );
  CLKXOR2X2M U42 ( .A(counter[4]), .B(DIV_RATIO[5]), .Y(n28) );
  CLKXOR2X2M U43 ( .A(counter[3]), .B(DIV_RATIO[4]), .Y(n27) );
  CLKNAND2X2M U44 ( .A(n41), .B(n42), .Y(n21) );
  NOR4X1M U45 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n42) );
  CLKXOR2X2M U46 ( .A(counter[3]), .B(N16), .Y(n46) );
  CLKXOR2X2M U47 ( .A(counter[2]), .B(N15), .Y(n45) );
  CLKXOR2X2M U48 ( .A(counter[1]), .B(N14), .Y(n44) );
  CLKXOR2X2M U49 ( .A(counter[0]), .B(N13), .Y(n43) );
  NOR4X1M U50 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n41) );
  CLKXOR2X2M U51 ( .A(counter[7]), .B(N20), .Y(n50) );
  CLKXOR2X2M U52 ( .A(counter[6]), .B(N19), .Y(n49) );
  CLKXOR2X2M U53 ( .A(counter[5]), .B(N18), .Y(n48) );
  CLKXOR2X2M U54 ( .A(counter[4]), .B(N17), .Y(n47) );
  CLK_DIV_1_DW01_inc_0 add_43 ( .A(counter), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25}) );
  CLK_DIV_1_DW01_inc_1 add_36 ( .A({1'b0, DIV_RATIO[7:1]}), .SUM({N20, N19, 
        N18, N17, N16, N15, N14, N13}) );
endmodule


module CLOCK_GATING ( REF_CLK, CLK_GATE_EN, ALU_CLK );
  input REF_CLK, CLK_GATE_EN;
  output ALU_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_GATE_EN), .CK(REF_CLK), .ECK(ALU_CLK) );
endmodule


module PULSE_GENRATOR_BLOCK_test_1 ( TX_CLK, PULSE_GEN, RINC, test_si, test_se
 );
  input TX_CLK, PULSE_GEN, test_si, test_se;
  output RINC;
  wire   BEFORE_INV, AFTER_INV;

  SDFFQX2M BEFORE_INV_reg ( .D(PULSE_GEN), .SI(test_si), .SE(test_se), .CK(
        TX_CLK), .Q(BEFORE_INV) );
  SDFFQX2M RINC_reg ( .D(AFTER_INV), .SI(BEFORE_INV), .SE(test_se), .CK(TX_CLK), .Q(RINC) );
  NOR2BX2M U5 ( .AN(PULSE_GEN), .B(BEFORE_INV), .Y(AFTER_INV) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 ( CLK, RST, EN, UNSYNC_BUS, 
        enable_pulse, SYNC_BUS, test_si, test_so, test_se );
  input [7:0] UNSYNC_BUS;
  output [7:0] SYNC_BUS;
  input CLK, RST, EN, test_si, test_se;
  output enable_pulse, test_so;
  wire   n1, n2, n4, n6, n8, n10, n12, n14, n16, n18, n23;
  wire   [1:0] bus_en_sync;

  SEDFFX2M pulse_reg ( .D(bus_en_sync[1]), .SI(enable_pulse), .E(RST), .SE(
        test_se), .CK(CLK), .Q(test_so), .QN(n2) );
  SEDFFX2M \bus_en_sync_reg[1]  ( .D(bus_en_sync[0]), .SI(bus_en_sync[0]), .E(
        RST), .SE(test_se), .CK(CLK), .Q(bus_en_sync[1]) );
  SDFFRQX2M \SYNC_BUS_reg[7]  ( .D(n18), .SI(SYNC_BUS[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[7]) );
  SDFFRQX2M \SYNC_BUS_reg[4]  ( .D(n12), .SI(SYNC_BUS[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[4]) );
  SDFFRQX2M \SYNC_BUS_reg[3]  ( .D(n10), .SI(SYNC_BUS[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[3]) );
  SDFFRQX2M \SYNC_BUS_reg[1]  ( .D(n6), .SI(SYNC_BUS[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[1]) );
  SDFFRQX2M \SYNC_BUS_reg[5]  ( .D(n14), .SI(SYNC_BUS[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[5]) );
  SDFFRQX2M \SYNC_BUS_reg[0]  ( .D(n4), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC_BUS[0]) );
  SDFFRQX2M \SYNC_BUS_reg[2]  ( .D(n8), .SI(SYNC_BUS[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[2]) );
  SDFFRQX2M \SYNC_BUS_reg[6]  ( .D(n16), .SI(SYNC_BUS[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_BUS[6]) );
  SDFFRQX2M enable_pulse_reg ( .D(n23), .SI(bus_en_sync[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(enable_pulse) );
  SEDFFX2M \bus_en_sync_reg[0]  ( .D(EN), .SI(SYNC_BUS[7]), .E(RST), .SE(
        test_se), .CK(CLK), .Q(bus_en_sync[0]) );
  INVX2M U3 ( .A(n1), .Y(n23) );
  NAND2X2M U4 ( .A(bus_en_sync[1]), .B(n2), .Y(n1) );
  AO22X1M U5 ( .A0(UNSYNC_BUS[0]), .A1(n23), .B0(SYNC_BUS[0]), .B1(n1), .Y(n4)
         );
  AO22X1M U6 ( .A0(UNSYNC_BUS[1]), .A1(n23), .B0(SYNC_BUS[1]), .B1(n1), .Y(n6)
         );
  AO22X1M U7 ( .A0(UNSYNC_BUS[2]), .A1(n23), .B0(SYNC_BUS[2]), .B1(n1), .Y(n8)
         );
  AO22X1M U8 ( .A0(UNSYNC_BUS[3]), .A1(n23), .B0(SYNC_BUS[3]), .B1(n1), .Y(n10) );
  AO22X1M U9 ( .A0(UNSYNC_BUS[4]), .A1(n23), .B0(SYNC_BUS[4]), .B1(n1), .Y(n12) );
  AO22X1M U10 ( .A0(UNSYNC_BUS[5]), .A1(n23), .B0(SYNC_BUS[5]), .B1(n1), .Y(
        n14) );
  AO22X1M U11 ( .A0(UNSYNC_BUS[6]), .A1(n23), .B0(SYNC_BUS[6]), .B1(n1), .Y(
        n16) );
  AO22X1M U12 ( .A0(UNSYNC_BUS[7]), .A1(n23), .B0(SYNC_BUS[7]), .B1(n1), .Y(
        n18) );
endmodule


module FSM_test_1 ( CLK, RST, RX_IN, Parity_error, Stop_error, Start_glitch, 
        Parity_en, bit_count, edge_count, Data_samp_en, edge_count_en, 
        desrializer_en, stop_en, start_en, parity_check_en, DATA_VALID, 
        test_si, test_so, test_se );
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, RX_IN, Parity_error, Stop_error, Start_glitch, Parity_en,
         test_si, test_se;
  output Data_samp_en, edge_count_en, desrializer_en, stop_en, start_en,
         parity_check_en, DATA_VALID, test_so;
  wire   Data_samp_en, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign edge_count_en = Data_samp_en;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  INVX2M U6 ( .A(n26), .Y(n7) );
  NOR2X2M U7 ( .A(n37), .B(n36), .Y(DATA_VALID) );
  NAND2X2M U8 ( .A(n40), .B(n8), .Y(n22) );
  NAND2X2M U9 ( .A(parity_check_en), .B(n22), .Y(n26) );
  INVX2M U10 ( .A(n20), .Y(n14) );
  OAI21X2M U11 ( .A0(n17), .A1(n37), .B0(n14), .Y(desrializer_en) );
  INVX2M U12 ( .A(n29), .Y(n6) );
  OAI21X2M U13 ( .A0(current_state[2]), .A1(n38), .B0(n36), .Y(Data_samp_en)
         );
  NOR3X2M U14 ( .A(n9), .B(bit_count[2]), .C(n11), .Y(n40) );
  NOR3X2M U15 ( .A(n12), .B(current_state[2]), .C(n15), .Y(parity_check_en) );
  NOR3X2M U16 ( .A(current_state[0]), .B(current_state[2]), .C(n15), .Y(n20)
         );
  NOR3X2M U17 ( .A(bit_count[1]), .B(bit_count[2]), .C(n8), .Y(n28) );
  NOR3X2M U18 ( .A(current_state[1]), .B(current_state[2]), .C(n12), .Y(
        start_en) );
  OAI31X1M U19 ( .A0(n17), .A1(n4), .A2(n18), .B0(n19), .Y(next_state[2]) );
  INVX2M U20 ( .A(n24), .Y(n4) );
  AOI32X1M U21 ( .A0(n6), .A1(n16), .A2(n20), .B0(n21), .B1(parity_check_en), 
        .Y(n19) );
  AOI221XLM U22 ( .A0(Parity_en), .A1(n23), .B0(n22), .B1(n16), .C0(n5), .Y(
        n18) );
  NAND2X2M U23 ( .A(n33), .B(n5), .Y(n24) );
  OAI32X1M U24 ( .A0(n34), .A1(n16), .A2(n10), .B0(Parity_en), .B1(n23), .Y(
        n33) );
  INVX2M U25 ( .A(bit_count[2]), .Y(n10) );
  NAND3X2M U26 ( .A(n8), .B(n9), .C(bit_count[3]), .Y(n34) );
  NOR2X2M U27 ( .A(current_state[0]), .B(current_state[1]), .Y(n38) );
  OAI211X2M U28 ( .A0(n25), .A1(n14), .B0(n26), .C0(n27), .Y(next_state[1]) );
  NOR2X2M U29 ( .A(Parity_en), .B(n29), .Y(n25) );
  NAND4BX1M U30 ( .AN(Start_glitch), .B(n11), .C(start_en), .D(n28), .Y(n27)
         );
  INVX2M U31 ( .A(bit_count[0]), .Y(n8) );
  NAND2X2M U32 ( .A(bit_count[0]), .B(n40), .Y(n23) );
  NAND2X2M U33 ( .A(n38), .B(current_state[2]), .Y(n36) );
  NAND2X2M U34 ( .A(n28), .B(bit_count[3]), .Y(n29) );
  INVX2M U35 ( .A(n36), .Y(stop_en) );
  NAND2X2M U36 ( .A(n39), .B(n5), .Y(n37) );
  OAI22X1M U37 ( .A0(Parity_en), .A1(n22), .B0(n16), .B1(n23), .Y(n39) );
  INVX2M U38 ( .A(bit_count[1]), .Y(n9) );
  INVX2M U39 ( .A(Stop_error), .Y(n5) );
  AOI21X2M U40 ( .A0(current_state[2]), .A1(n24), .B0(RX_IN), .Y(n32) );
  NAND3X2M U41 ( .A(n12), .B(n15), .C(current_state[2]), .Y(n17) );
  INVX2M U42 ( .A(current_state[1]), .Y(n15) );
  INVX2M U43 ( .A(current_state[0]), .Y(n12) );
  NOR2X2M U44 ( .A(Parity_error), .B(n22), .Y(n21) );
  INVX2M U45 ( .A(bit_count[3]), .Y(n11) );
  NAND2X2M U46 ( .A(n30), .B(n31), .Y(next_state[0]) );
  AOI31X2M U47 ( .A0(n20), .A1(n6), .A2(Parity_en), .B0(n35), .Y(n30) );
  AOI31X2M U48 ( .A0(n12), .A1(n15), .A2(n32), .B0(n7), .Y(n31) );
  AOI21BX2M U49 ( .A0(n28), .A1(n11), .B0N(start_en), .Y(n35) );
  INVX2M U50 ( .A(Parity_en), .Y(n16) );
endmodule


module Bit_counter_test_1 ( CLK, RST, edge_count_en, Prescale, bit_count, 
        edge_count, test_si, test_se );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, edge_count_en, test_si, test_se;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N20, N21, N22, N23, N24, N25,
         N36, N37, N38, N39, N40, N41, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, \add_27/carry[5] , \add_27/carry[4] , \add_27/carry[3] ,
         \add_27/carry[2] , n1, n2, n3, n4, n15, n16, n17, n18, n19, n20, n21,
         n32, n33, n34, n35, n36, n37, n38, n39, n40;

  SDFFRQX2M \edge_count_reg[5]  ( .D(N41), .SI(edge_count[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[5]) );
  SDFFRQX2M \edge_count_reg[3]  ( .D(N39), .SI(edge_count[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[3]) );
  SDFFRQX2M \edge_count_reg[2]  ( .D(N38), .SI(edge_count[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  SDFFRQX2M \edge_count_reg[0]  ( .D(N36), .SI(bit_count[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  SDFFRQX2M \edge_count_reg[4]  ( .D(N40), .SI(edge_count[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[4]) );
  SDFFRQX2M \edge_count_reg[1]  ( .D(N37), .SI(edge_count[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  SDFFRQX2M \bit_count_reg[3]  ( .D(n28), .SI(bit_count[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_count[3]) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(n29), .SI(bit_count[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_count[2]) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(n30), .SI(bit_count[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_count[1]) );
  SDFFRQX2M \bit_count_reg[0]  ( .D(n31), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(bit_count[0]) );
  INVX2M U6 ( .A(n27), .Y(n34) );
  NOR2X2M U7 ( .A(n40), .B(N14), .Y(n27) );
  NOR3X2M U15 ( .A(n37), .B(n36), .C(n38), .Y(n23) );
  AOI21X2M U16 ( .A0(n36), .A1(edge_count_en), .B0(n27), .Y(n26) );
  INVX2M U17 ( .A(edge_count_en), .Y(n40) );
  AND2X2M U18 ( .A(N21), .B(n27), .Y(N37) );
  AND2X2M U19 ( .A(N22), .B(n27), .Y(N38) );
  AND2X2M U20 ( .A(N23), .B(n27), .Y(N39) );
  AND2X2M U21 ( .A(N24), .B(n27), .Y(N40) );
  OAI32X1M U22 ( .A0(n40), .A1(bit_count[0]), .A2(n27), .B0(n36), .B1(n34), 
        .Y(n31) );
  OAI32X1M U23 ( .A0(n24), .A1(bit_count[2]), .A2(n37), .B0(n25), .B1(n38), 
        .Y(n29) );
  OA21X2M U24 ( .A0(n40), .A1(bit_count[1]), .B0(n26), .Y(n25) );
  OAI22X1M U25 ( .A0(n39), .A1(n34), .B0(n22), .B1(n40), .Y(n28) );
  AOI32X1M U26 ( .A0(n23), .A1(n39), .A2(N14), .B0(bit_count[3]), .B1(n35), 
        .Y(n22) );
  INVX2M U27 ( .A(n23), .Y(n35) );
  INVX2M U28 ( .A(bit_count[3]), .Y(n39) );
  OAI22X1M U29 ( .A0(n26), .A1(n37), .B0(bit_count[1]), .B1(n24), .Y(n30) );
  NAND3X2M U30 ( .A(bit_count[0]), .B(n34), .C(edge_count_en), .Y(n24) );
  INVX2M U31 ( .A(bit_count[0]), .Y(n36) );
  INVX2M U32 ( .A(bit_count[1]), .Y(n37) );
  INVX2M U33 ( .A(bit_count[2]), .Y(n38) );
  INVX2M U34 ( .A(Prescale[0]), .Y(N7) );
  ADDHX1M U35 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_27/carry[2] ), 
        .S(N21) );
  ADDHX1M U36 ( .A(edge_count[2]), .B(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(N22) );
  ADDHX1M U37 ( .A(edge_count[3]), .B(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(N23) );
  AND2X2M U38 ( .A(N25), .B(n27), .Y(N41) );
  AND2X2M U39 ( .A(N20), .B(n27), .Y(N36) );
  INVX2M U40 ( .A(edge_count[0]), .Y(N20) );
  ADDHX1M U41 ( .A(edge_count[4]), .B(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(N24) );
  NAND2BX1M U42 ( .AN(Prescale[1]), .B(N7), .Y(n1) );
  OAI2BB1X1M U43 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n1), .Y(N8) );
  OR2X1M U44 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  OAI2BB1X1M U45 ( .A0N(n1), .A1N(Prescale[2]), .B0(n2), .Y(N9) );
  OR2X1M U46 ( .A(n2), .B(Prescale[3]), .Y(n3) );
  OAI2BB1X1M U47 ( .A0N(n2), .A1N(Prescale[3]), .B0(n3), .Y(N10) );
  OR2X1M U48 ( .A(n3), .B(Prescale[4]), .Y(n4) );
  OAI2BB1X1M U49 ( .A0N(n3), .A1N(Prescale[4]), .B0(n4), .Y(N11) );
  NOR2X1M U50 ( .A(n4), .B(Prescale[5]), .Y(N13) );
  AO21XLM U51 ( .A0(n4), .A1(Prescale[5]), .B0(N13), .Y(N12) );
  CLKXOR2X2M U52 ( .A(\add_27/carry[5] ), .B(edge_count[5]), .Y(N25) );
  NOR2BX1M U53 ( .AN(N7), .B(edge_count[0]), .Y(n15) );
  OAI2B2X1M U54 ( .A1N(edge_count[1]), .A0(n15), .B0(N8), .B1(n15), .Y(n19) );
  XNOR2X1M U55 ( .A(N12), .B(edge_count[5]), .Y(n18) );
  NOR2BX1M U56 ( .AN(edge_count[0]), .B(N7), .Y(n16) );
  OAI2B2X1M U57 ( .A1N(N8), .A0(n16), .B0(edge_count[1]), .B1(n16), .Y(n17) );
  NAND4BX1M U58 ( .AN(N13), .B(n19), .C(n18), .D(n17), .Y(n33) );
  CLKXOR2X2M U59 ( .A(N11), .B(edge_count[4]), .Y(n32) );
  CLKXOR2X2M U60 ( .A(N9), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U61 ( .A(N10), .B(edge_count[3]), .Y(n20) );
  NOR4X1M U62 ( .A(n33), .B(n32), .C(n21), .D(n20), .Y(N14) );
endmodule


module Data_Sampling_test_1 ( CLK, RST, Data_samp_en, RX_IN, Prescale, 
        edge_count, Sampled_Bit, test_so, test_se );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, Data_samp_en, RX_IN, test_se;
  output Sampled_Bit, test_so;
  wire   sampled_bit_1, sampled_bit_2, sampled_bit_3, N7, N8, N9, N10, N11,
         N12, N13, N16, N17, N18, N19, N20, n29, n30, n31, n32,
         \add_33/carry[4] , \add_33/carry[3] , \add_33/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46;
  assign test_so = sampled_bit_3;

  SDFFRQX2M sampled_bit_3_reg ( .D(n30), .SI(sampled_bit_2), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sampled_bit_3) );
  SDFFRQX2M sampled_bit_1_reg ( .D(n31), .SI(Sampled_Bit), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sampled_bit_1) );
  SDFFRQX2M sampled_bit_2_reg ( .D(n32), .SI(sampled_bit_1), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sampled_bit_2) );
  SDFFRQX2M Sampled_Bit_reg ( .D(n29), .SI(edge_count[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Sampled_Bit) );
  XNOR2X2M U4 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n37) );
  INVX2M U5 ( .A(Prescale[1]), .Y(N7) );
  ADDHX1M U6 ( .A(Prescale[4]), .B(\add_33/carry[3] ), .CO(\add_33/carry[4] ), 
        .S(N18) );
  ADDHX1M U7 ( .A(Prescale[2]), .B(Prescale[1]), .CO(\add_33/carry[2] ), .S(
        N16) );
  ADDHX1M U8 ( .A(Prescale[3]), .B(\add_33/carry[2] ), .CO(\add_33/carry[3] ), 
        .S(N17) );
  ADDHX1M U12 ( .A(Prescale[5]), .B(\add_33/carry[4] ), .CO(N20), .S(N19) );
  NAND2BX1M U13 ( .AN(Prescale[2]), .B(N7), .Y(n1) );
  OAI2BB1X1M U14 ( .A0N(Prescale[1]), .A1N(Prescale[2]), .B0(n1), .Y(N8) );
  OR2X1M U15 ( .A(n1), .B(Prescale[3]), .Y(n2) );
  OAI2BB1X1M U16 ( .A0N(n1), .A1N(Prescale[3]), .B0(n2), .Y(N9) );
  XNOR2X1M U17 ( .A(Prescale[4]), .B(n2), .Y(N10) );
  NOR3X1M U18 ( .A(Prescale[4]), .B(Prescale[5]), .C(n2), .Y(N12) );
  OAI21X1M U19 ( .A0(Prescale[4]), .A1(n2), .B0(Prescale[5]), .Y(n3) );
  NAND2BX1M U20 ( .AN(N12), .B(n3), .Y(N11) );
  NOR2BX1M U21 ( .AN(edge_count[0]), .B(N7), .Y(n4) );
  OAI2B2X1M U22 ( .A1N(N8), .A0(n4), .B0(edge_count[1]), .B1(n4), .Y(n7) );
  NOR2BX1M U23 ( .AN(N7), .B(edge_count[0]), .Y(n5) );
  OAI2B2X1M U24 ( .A1N(edge_count[1]), .A0(n5), .B0(N8), .B1(n5), .Y(n6) );
  NAND4BBX1M U25 ( .AN(N12), .BN(edge_count[5]), .C(n7), .D(n6), .Y(n15) );
  CLKXOR2X2M U26 ( .A(N11), .B(edge_count[4]), .Y(n10) );
  CLKXOR2X2M U27 ( .A(N9), .B(edge_count[2]), .Y(n9) );
  CLKXOR2X2M U28 ( .A(N10), .B(edge_count[3]), .Y(n8) );
  NOR4X1M U29 ( .A(n15), .B(n10), .C(n9), .D(n8), .Y(N13) );
  MXI2X1M U30 ( .A(n16), .B(n17), .S0(n18), .Y(n32) );
  CLKNAND2X2M U31 ( .A(sampled_bit_2), .B(Data_samp_en), .Y(n16) );
  MXI2X1M U32 ( .A(n17), .B(n19), .S0(n20), .Y(n31) );
  CLKNAND2X2M U33 ( .A(sampled_bit_1), .B(Data_samp_en), .Y(n19) );
  MXI2X1M U34 ( .A(n17), .B(n21), .S0(n22), .Y(n30) );
  AOI31X1M U35 ( .A0(n23), .A1(n20), .A2(n24), .B0(n25), .Y(n22) );
  CLKINVX1M U36 ( .A(N13), .Y(n20) );
  CLKINVX1M U37 ( .A(sampled_bit_3), .Y(n21) );
  CLKNAND2X2M U38 ( .A(RX_IN), .B(Data_samp_en), .Y(n17) );
  NOR2X1M U39 ( .A(n25), .B(n26), .Y(n29) );
  MXI2X1M U40 ( .A(Sampled_Bit), .B(n27), .S0(n28), .Y(n26) );
  NOR3X1M U41 ( .A(n18), .B(N13), .C(n24), .Y(n28) );
  AND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n24) );
  NOR3X1M U43 ( .A(n37), .B(n38), .C(n39), .Y(n36) );
  CLKXOR2X2M U44 ( .A(edge_count[4]), .B(N19), .Y(n39) );
  CLKXOR2X2M U45 ( .A(edge_count[1]), .B(N16), .Y(n38) );
  XNOR2X1M U46 ( .A(edge_count[2]), .B(N17), .Y(n35) );
  XNOR2X1M U47 ( .A(edge_count[3]), .B(N18), .Y(n34) );
  XNOR2X1M U48 ( .A(edge_count[5]), .B(N20), .Y(n33) );
  NOR2X1M U49 ( .A(n23), .B(N13), .Y(n18) );
  NAND4X1M U50 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n23) );
  NOR3X1M U51 ( .A(n44), .B(edge_count[5]), .C(n45), .Y(n43) );
  CLKXOR2X2M U52 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n45) );
  CLKXOR2X2M U53 ( .A(edge_count[4]), .B(Prescale[5]), .Y(n44) );
  XNOR2X1M U54 ( .A(edge_count[2]), .B(Prescale[3]), .Y(n42) );
  XNOR2X1M U55 ( .A(edge_count[3]), .B(Prescale[4]), .Y(n41) );
  XNOR2X1M U56 ( .A(edge_count[1]), .B(Prescale[2]), .Y(n40) );
  OAI2BB1X1M U57 ( .A0N(sampled_bit_2), .A1N(sampled_bit_1), .B0(n46), .Y(n27)
         );
  OAI21X1M U58 ( .A0(sampled_bit_1), .A1(sampled_bit_2), .B0(sampled_bit_3), 
        .Y(n46) );
  CLKINVX1M U59 ( .A(Data_samp_en), .Y(n25) );
endmodule


module Start_Check_test_1 ( CLK, RST, start_en, Sampled_Bit, Start_glitch, 
        test_si, test_se );
  input CLK, RST, start_en, Sampled_Bit, test_si, test_se;
  output Start_glitch;
  wire   N4;

  SDFFRQX2M Start_glitch_reg ( .D(N4), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Start_glitch) );
  AND2X2M U4 ( .A(start_en), .B(Sampled_Bit), .Y(N4) );
endmodule


module Stop_Check_test_1 ( CLK, RST, stop_en, Sampled_Bit, Stop_error, test_si, 
        test_se );
  input CLK, RST, stop_en, Sampled_Bit, test_si, test_se;
  output Stop_error;
  wire   n3, n1;

  SDFFRQX2M Stop_error_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Stop_error) );
  OAI2BB2X1M U2 ( .B0(Sampled_Bit), .B1(n1), .A0N(Stop_error), .A1N(n1), .Y(n3) );
  INVX2M U3 ( .A(stop_en), .Y(n1) );
endmodule


module Deserializer_test_1 ( CLK, RST, desrializer_en, Sampled_Bit, DATA_VALID, 
        bit_count, parity_flag, P_DATA, test_si, test_se );
  input [3:0] bit_count;
  output [7:0] P_DATA;
  input CLK, RST, desrializer_en, Sampled_Bit, DATA_VALID, test_si, test_se;
  output parity_flag;
  wire   n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n10,
         n11, n12, n13, n14, n15, n16;
  wire   [7:0] DATA;

  SDFFQX2M \DATA_reg[5]  ( .D(n41), .SI(DATA[4]), .SE(test_se), .CK(CLK), .Q(
        DATA[5]) );
  SDFFQX2M \DATA_reg[1]  ( .D(n37), .SI(DATA[0]), .SE(test_se), .CK(CLK), .Q(
        DATA[1]) );
  SDFFQX2M \DATA_reg[4]  ( .D(n40), .SI(DATA[3]), .SE(test_se), .CK(CLK), .Q(
        DATA[4]) );
  SDFFQX2M \DATA_reg[0]  ( .D(n36), .SI(test_si), .SE(test_se), .CK(CLK), .Q(
        DATA[0]) );
  SDFFRQX2M parity_flag_reg ( .D(n35), .SI(DATA[7]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(parity_flag) );
  SDFFQX2M \DATA_reg[2]  ( .D(n38), .SI(DATA[1]), .SE(test_se), .CK(CLK), .Q(
        DATA[2]) );
  SDFFQX2M \DATA_reg[3]  ( .D(n39), .SI(DATA[2]), .SE(test_se), .CK(CLK), .Q(
        DATA[3]) );
  SDFFQX2M \DATA_reg[6]  ( .D(n42), .SI(DATA[5]), .SE(test_se), .CK(CLK), .Q(
        DATA[6]) );
  SDFFQX2M \DATA_reg[7]  ( .D(n43), .SI(DATA[6]), .SE(test_se), .CK(CLK), .Q(
        DATA[7]) );
  INVX2M U12 ( .A(RST), .Y(n10) );
  NOR2X2M U13 ( .A(n12), .B(DATA_VALID), .Y(n32) );
  INVX2M U14 ( .A(DATA_VALID), .Y(n11) );
  NOR2BX2M U15 ( .AN(n23), .B(n16), .Y(n28) );
  INVX2M U16 ( .A(desrializer_en), .Y(n12) );
  NOR3BX2M U17 ( .AN(n23), .B(bit_count[2]), .C(n15), .Y(n25) );
  NOR3BX2M U18 ( .AN(n32), .B(n10), .C(bit_count[3]), .Y(n23) );
  XNOR2X2M U19 ( .A(DATA[2]), .B(DATA[3]), .Y(n21) );
  INVX2M U20 ( .A(bit_count[0]), .Y(n14) );
  INVX2M U21 ( .A(bit_count[1]), .Y(n15) );
  INVX2M U22 ( .A(Sampled_Bit), .Y(n13) );
  OAI2BB2X1M U23 ( .B0(n17), .B1(n12), .A0N(parity_flag), .A1N(n12), .Y(n35)
         );
  CLKXOR2X2M U24 ( .A(n18), .B(n19), .Y(n17) );
  XOR3XLM U25 ( .A(DATA[5]), .B(DATA[4]), .C(n20), .Y(n19) );
  XOR3XLM U26 ( .A(DATA[1]), .B(DATA[0]), .C(n21), .Y(n18) );
  OAI2BB2X1M U27 ( .B0(n13), .B1(n27), .A0N(n27), .A1N(DATA[3]), .Y(n39) );
  NAND3X2M U28 ( .A(n14), .B(n15), .C(n28), .Y(n27) );
  OAI2BB2X1M U29 ( .B0(n13), .B1(n24), .A0N(n24), .A1N(DATA[1]), .Y(n37) );
  NAND2X2M U30 ( .A(n25), .B(n14), .Y(n24) );
  OAI2BB2X1M U31 ( .B0(n13), .B1(n26), .A0N(n26), .A1N(DATA[2]), .Y(n38) );
  NAND2X2M U32 ( .A(n25), .B(bit_count[0]), .Y(n26) );
  OAI2BB2X1M U33 ( .B0(n22), .B1(n13), .A0N(n22), .A1N(DATA[0]), .Y(n36) );
  NAND4X2M U34 ( .A(bit_count[0]), .B(n23), .C(n15), .D(n16), .Y(n22) );
  OAI2BB2X1M U35 ( .B0(n13), .B1(n29), .A0N(n29), .A1N(DATA[4]), .Y(n40) );
  NAND3X2M U36 ( .A(bit_count[0]), .B(n15), .C(n28), .Y(n29) );
  OAI2BB2X1M U37 ( .B0(n13), .B1(n30), .A0N(n30), .A1N(DATA[5]), .Y(n41) );
  NAND3X2M U38 ( .A(bit_count[1]), .B(n14), .C(n28), .Y(n30) );
  OAI2BB2X1M U39 ( .B0(n13), .B1(n31), .A0N(n31), .A1N(DATA[6]), .Y(n42) );
  NAND3X2M U40 ( .A(bit_count[1]), .B(bit_count[0]), .C(n28), .Y(n31) );
  OAI2BB2X1M U41 ( .B0(n13), .B1(n33), .A0N(n33), .A1N(DATA[7]), .Y(n43) );
  NAND4X2M U42 ( .A(n32), .B(RST), .C(bit_count[3]), .D(n34), .Y(n33) );
  NOR3X2M U43 ( .A(bit_count[0]), .B(bit_count[2]), .C(bit_count[1]), .Y(n34)
         );
  INVX2M U44 ( .A(bit_count[2]), .Y(n16) );
  AND2X2M U45 ( .A(DATA[0]), .B(DATA_VALID), .Y(P_DATA[0]) );
  AND2X2M U46 ( .A(DATA[1]), .B(DATA_VALID), .Y(P_DATA[1]) );
  NOR2BX2M U47 ( .AN(DATA[2]), .B(n11), .Y(P_DATA[2]) );
  NOR2BX2M U48 ( .AN(DATA[3]), .B(n11), .Y(P_DATA[3]) );
  AND2X2M U49 ( .A(DATA[4]), .B(DATA_VALID), .Y(P_DATA[4]) );
  AND2X2M U50 ( .A(DATA[5]), .B(DATA_VALID), .Y(P_DATA[5]) );
  NOR2BX2M U51 ( .AN(DATA[6]), .B(n11), .Y(P_DATA[6]) );
  AND2X2M U52 ( .A(DATA[7]), .B(DATA_VALID), .Y(P_DATA[7]) );
  CLKXOR2X2M U53 ( .A(DATA[7]), .B(DATA[6]), .Y(n20) );
endmodule


module Parity_Check_test_1 ( CLK, RST, Parity_type, parity_check_en, 
        Sampled_Bit, parity_flag, Parity_error, test_si, test_se );
  input CLK, RST, Parity_type, parity_check_en, Sampled_Bit, parity_flag,
         test_si, test_se;
  output Parity_error;
  wire   n1, n3;

  SDFFRQX2M Parity_error_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Parity_error) );
  AO2B2X2M U3 ( .B0(parity_check_en), .B1(n1), .A0(Parity_error), .A1N(
        parity_check_en), .Y(n3) );
  XOR3XLM U4 ( .A(parity_flag), .B(Sampled_Bit), .C(Parity_type), .Y(n1) );
endmodule


module UART_RX_TOP_test_1 ( CLK, RST, RX_IN, Parity_en, Parity_type, Prescale, 
        DATA_VALID, Stop_error, Parity_error, P_DATA, test_si2, test_si1, 
        test_so1, test_se );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, Parity_en, Parity_type, test_si2, test_si1, test_se;
  output DATA_VALID, Stop_error, Parity_error, test_so1;
  wire   Start_glitch, Data_samp_en, edge_count_en, desrializer_en, stop_en,
         start_en, parity_check_en, Sampled_Bit, parity_flag, n1, n2, n3, n4;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;
  assign test_so1 = Start_glitch;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  FSM_test_1 FSM ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .Parity_error(
        Parity_error), .Stop_error(Stop_error), .Start_glitch(Start_glitch), 
        .Parity_en(Parity_en), .bit_count(bit_count), .edge_count(edge_count), 
        .Data_samp_en(Data_samp_en), .edge_count_en(edge_count_en), 
        .desrializer_en(desrializer_en), .stop_en(stop_en), .start_en(start_en), .parity_check_en(parity_check_en), .DATA_VALID(DATA_VALID), .test_si(
        parity_flag), .test_so(n3), .test_se(test_se) );
  Bit_counter_test_1 Bit_counter ( .CLK(CLK), .RST(n1), .edge_count_en(
        edge_count_en), .Prescale(Prescale), .bit_count(bit_count), 
        .edge_count(edge_count), .test_si(test_si1), .test_se(test_se) );
  Data_Sampling_test_1 Data_Sampling ( .CLK(CLK), .RST(n1), .Data_samp_en(
        Data_samp_en), .RX_IN(RX_IN), .Prescale(Prescale), .edge_count(
        edge_count), .Sampled_Bit(Sampled_Bit), .test_so(n4), .test_se(test_se) );
  Start_Check_test_1 Start_Check ( .CLK(CLK), .RST(n1), .start_en(start_en), 
        .Sampled_Bit(Sampled_Bit), .Start_glitch(Start_glitch), .test_si(
        Parity_error), .test_se(test_se) );
  Stop_Check_test_1 Stop_Check ( .CLK(CLK), .RST(n1), .stop_en(stop_en), 
        .Sampled_Bit(Sampled_Bit), .Stop_error(Stop_error), .test_si(test_si2), 
        .test_se(test_se) );
  Deserializer_test_1 Deserializer ( .CLK(CLK), .RST(n1), .desrializer_en(
        desrializer_en), .Sampled_Bit(Sampled_Bit), .DATA_VALID(DATA_VALID), 
        .bit_count(bit_count), .parity_flag(parity_flag), .P_DATA(P_DATA), 
        .test_si(n4), .test_se(test_se) );
  Parity_Check_test_1 Parity_Check ( .CLK(CLK), .RST(n1), .Parity_type(
        Parity_type), .parity_check_en(parity_check_en), .Sampled_Bit(
        Sampled_Bit), .parity_flag(parity_flag), .Parity_error(Parity_error), 
        .test_si(n3), .test_se(test_se) );
endmodule


module serializer_DATA_WIDTH8_test_1 ( P_DATA, ser_en, RST, CLK, data_valid, 
        ser_done, ser_data, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input ser_en, RST, CLK, data_valid, test_si, test_se;
  output ser_done, ser_data, test_so;
  wire   N3, N4, N5, N16, N17, N18, N24, n2, n7, n8, n10, n12, n14, n16, n18,
         n20, n22, n24, n1, n3, n4, n5, n6, n28, n29;
  wire   [7:0] P_DATA_COMP;
  assign test_so = N5;

  SDFFRQX2M \P_DATA_COMP_reg[5]  ( .D(n20), .SI(P_DATA_COMP[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[5]) );
  SDFFRQX2M \P_DATA_COMP_reg[1]  ( .D(n12), .SI(P_DATA_COMP[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[1]) );
  SDFFRQX2M \P_DATA_COMP_reg[7]  ( .D(n24), .SI(P_DATA_COMP[6]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[7]) );
  SDFFRQX2M \P_DATA_COMP_reg[3]  ( .D(n16), .SI(P_DATA_COMP[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[3]) );
  SDFFRQX2M \P_DATA_COMP_reg[6]  ( .D(n22), .SI(P_DATA_COMP[5]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[6]) );
  SDFFRQX2M \P_DATA_COMP_reg[2]  ( .D(n14), .SI(P_DATA_COMP[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[2]) );
  SDFFRQX2M \P_DATA_COMP_reg[4]  ( .D(n18), .SI(P_DATA_COMP[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(P_DATA_COMP[4]) );
  SDFFRQX2M \P_DATA_COMP_reg[0]  ( .D(n10), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(P_DATA_COMP[0]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N17), .SI(N3), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(N4) );
  SDFFRQX2M \counter_reg[2]  ( .D(N18), .SI(N4), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(N5) );
  SDFFRQX2M \counter_reg[0]  ( .D(N16), .SI(P_DATA_COMP[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(N3) );
  INVX2M U3 ( .A(n2), .Y(n5) );
  NAND4X2M U4 ( .A(data_valid), .B(n6), .C(n28), .D(n29), .Y(n2) );
  AOI211X2M U5 ( .A0(n6), .A1(n28), .B0(n4), .C0(n7), .Y(N17) );
  NOR2X2M U6 ( .A(n28), .B(n6), .Y(n7) );
  INVX2M U7 ( .A(ser_en), .Y(n4) );
  NOR2BX2M U8 ( .AN(N24), .B(n4), .Y(ser_data) );
  MX2X2M U9 ( .A(n3), .B(n1), .S0(N5), .Y(N24) );
  MX4X1M U10 ( .A(P_DATA_COMP[4]), .B(P_DATA_COMP[5]), .C(P_DATA_COMP[6]), .D(
        P_DATA_COMP[7]), .S0(N3), .S1(N4), .Y(n1) );
  MX4X1M U11 ( .A(P_DATA_COMP[0]), .B(P_DATA_COMP[1]), .C(P_DATA_COMP[2]), .D(
        P_DATA_COMP[3]), .S0(N3), .S1(N4), .Y(n3) );
  OAI2BB2X1M U12 ( .B0(n8), .B1(n4), .A0N(N5), .A1N(N16), .Y(N18) );
  AOI22X1M U13 ( .A0(n7), .A1(n29), .B0(N5), .B1(n28), .Y(n8) );
  NOR2X2M U14 ( .A(n4), .B(N3), .Y(N16) );
  INVX2M U15 ( .A(N3), .Y(n6) );
  INVX2M U16 ( .A(N4), .Y(n28) );
  INVX2M U17 ( .A(N5), .Y(n29) );
  AND2X2M U18 ( .A(n7), .B(N5), .Y(ser_done) );
  AO22X1M U19 ( .A0(P_DATA_COMP[0]), .A1(n2), .B0(P_DATA[0]), .B1(n5), .Y(n10)
         );
  AO22X1M U20 ( .A0(P_DATA_COMP[1]), .A1(n2), .B0(P_DATA[1]), .B1(n5), .Y(n12)
         );
  AO22X1M U21 ( .A0(P_DATA_COMP[2]), .A1(n2), .B0(P_DATA[2]), .B1(n5), .Y(n14)
         );
  AO22X1M U22 ( .A0(P_DATA_COMP[3]), .A1(n2), .B0(P_DATA[3]), .B1(n5), .Y(n16)
         );
  AO22X1M U23 ( .A0(P_DATA_COMP[4]), .A1(n2), .B0(P_DATA[4]), .B1(n5), .Y(n18)
         );
  AO22X1M U35 ( .A0(P_DATA_COMP[5]), .A1(n2), .B0(P_DATA[5]), .B1(n5), .Y(n20)
         );
  AO22X1M U36 ( .A0(P_DATA_COMP[6]), .A1(n2), .B0(P_DATA[6]), .B1(n5), .Y(n22)
         );
  AO22X1M U37 ( .A0(P_DATA_COMP[7]), .A1(n2), .B0(P_DATA[7]), .B1(n5), .Y(n24)
         );
endmodule


module FSM_TX_test_1 ( CLK, RST, party_en, ser_done, data_valid, busy, ser_en, 
        mux_sel, test_si, test_so, test_se );
  output [2:0] mux_sel;
  input CLK, RST, party_en, ser_done, data_valid, test_si, test_se;
  output busy, ser_en, test_so;
  wire   n7, n8, n9, n10, n5, n6;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  INVX2M U6 ( .A(busy), .Y(mux_sel[2]) );
  AOI22X1M U7 ( .A0(current_state[0]), .A1(current_state[2]), .B0(n6), .B1(n5), 
        .Y(busy) );
  NOR3X2M U8 ( .A(n5), .B(current_state[2]), .C(n6), .Y(ser_en) );
  AOI21X2M U9 ( .A0(n6), .A1(current_state[0]), .B0(mux_sel[1]), .Y(n8) );
  NOR2X2M U10 ( .A(n6), .B(current_state[0]), .Y(mux_sel[1]) );
  OAI21BX1M U11 ( .A0(current_state[2]), .A1(n8), .B0N(ser_en), .Y(
        next_state[1]) );
  AOI2B1X1M U12 ( .A1N(mux_sel[1]), .A0(n7), .B0(current_state[2]), .Y(
        next_state[2]) );
  NAND3BX2M U13 ( .AN(party_en), .B(current_state[1]), .C(ser_done), .Y(n7) );
  AOI21X2M U14 ( .A0(n9), .A1(n10), .B0(current_state[2]), .Y(next_state[0])
         );
  OR2X2M U15 ( .A(ser_done), .B(n5), .Y(n9) );
  OAI21X2M U16 ( .A0(current_state[0]), .A1(data_valid), .B0(n6), .Y(n10) );
  INVX2M U17 ( .A(current_state[1]), .Y(n6) );
  INVX2M U18 ( .A(current_state[0]), .Y(n5) );
  OR2X2M U19 ( .A(n8), .B(current_state[2]), .Y(mux_sel[0]) );
endmodule


module parity_calc_DATA_WIDTH8 ( party_typ, data_valid, CLK, RST, busy, P_DATA, 
        party_bit );
  input [7:0] P_DATA;
  input party_typ, data_valid, CLK, RST, busy;
  output party_bit;
  wire   n1, n2, n3, n4, n5, n6, n8;

  SDFFRQX2M party_bit_reg ( .D(n8), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(RST), 
        .Q(party_bit) );
  XOR3XLM U2 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
  XNOR2X2M U3 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  OAI2BB2X1M U4 ( .B0(n1), .B1(n2), .A0N(party_bit), .A1N(n2), .Y(n8) );
  NAND2BX2M U5 ( .AN(busy), .B(data_valid), .Y(n2) );
  XOR3XLM U6 ( .A(n3), .B(party_typ), .C(n4), .Y(n1) );
  XOR3XLM U7 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
endmodule


module MUX ( mux_sel, ser_data, party_bit, Tx_OUT );
  input [2:0] mux_sel;
  input ser_data, party_bit;
  output Tx_OUT;
  wire   n1, n2;

  NAND3BX2M U3 ( .AN(mux_sel[2]), .B(n1), .C(n2), .Y(Tx_OUT) );
  NAND2X2M U4 ( .A(ser_data), .B(mux_sel[0]), .Y(n2) );
  OAI21X2M U5 ( .A0(mux_sel[0]), .A1(party_bit), .B0(mux_sel[1]), .Y(n1) );
endmodule


module UART_TX_TOP_DATA_WIDTH8_test_1 ( CLK, RST, party_en, data_valid, 
        party_typ, P_DATA, busy, Tx_OUT, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, party_en, data_valid, party_typ, test_si, test_se;
  output busy, Tx_OUT, test_so;
  wire   ser_done, ser_en, ser_data, party_bit, n2;
  wire   [2:0] mux_sel;

  serializer_DATA_WIDTH8_test_1 serial ( .P_DATA(P_DATA), .ser_en(ser_en), 
        .RST(RST), .CLK(CLK), .data_valid(data_valid), .ser_done(ser_done), 
        .ser_data(ser_data), .test_si(n2), .test_so(test_so), .test_se(test_se) );
  FSM_TX_test_1 FSM ( .CLK(CLK), .RST(RST), .party_en(party_en), .ser_done(
        ser_done), .data_valid(data_valid), .busy(busy), .ser_en(ser_en), 
        .mux_sel(mux_sel), .test_si(test_si), .test_so(n2), .test_se(test_se)
         );
  parity_calc_DATA_WIDTH8 parity ( .party_typ(party_typ), .data_valid(
        data_valid), .CLK(1'b0), .RST(1'b0), .busy(1'b0), .P_DATA(P_DATA), 
        .party_bit(party_bit) );
  MUX MUX ( .mux_sel(mux_sel), .ser_data(ser_data), .party_bit(party_bit), 
        .Tx_OUT(Tx_OUT) );
endmodule


module SYS_UART_TOP_DATA_WIDTH8_test_1 ( TX_CLK, RX_CLK, RST_SYNC_1, RX_IN, 
        R_EMPTY, UART_CONFIG, R_DATA, Tx_OUT, DATA_VALID, Stop_error, 
        Parity_error, PULSE_GEN, P_DATA, test_si, test_se );
  input [7:0] UART_CONFIG;
  input [7:0] R_DATA;
  output [7:0] P_DATA;
  input TX_CLK, RX_CLK, RST_SYNC_1, RX_IN, R_EMPTY, test_si, test_se;
  output Tx_OUT, DATA_VALID, Stop_error, Parity_error, PULSE_GEN;
  wire   n1, n2, n3;

  INVX2M U1 ( .A(R_EMPTY), .Y(n1) );
  UART_RX_TOP_test_1 UART_RX_TOP ( .CLK(RX_CLK), .RST(RST_SYNC_1), .RX_IN(
        RX_IN), .Parity_en(UART_CONFIG[0]), .Parity_type(UART_CONFIG[1]), 
        .Prescale(UART_CONFIG[7:2]), .DATA_VALID(DATA_VALID), .Stop_error(
        Stop_error), .Parity_error(Parity_error), .P_DATA(P_DATA), .test_si2(
        n2), .test_si1(test_si), .test_so1(n3), .test_se(test_se) );
  UART_TX_TOP_DATA_WIDTH8_test_1 UART_TX_TOP ( .CLK(TX_CLK), .RST(RST_SYNC_1), 
        .party_en(UART_CONFIG[0]), .data_valid(n1), .party_typ(UART_CONFIG[1]), 
        .P_DATA(R_DATA), .busy(PULSE_GEN), .Tx_OUT(Tx_OUT), .test_si(n3), 
        .test_so(n2), .test_se(test_se) );
endmodule


module SYSTEM_CONTROL_DATA_WIDTH8_test_1 ( REF_CLK, RST_SYNC_2, pulse_gen, 
        W_FULL, R_DATA_VALID, ALU_OUT_VALID, SYNC_BUS, R_REG_DATA, ALU_OUT, 
        WINC, W_REG_EN, R_REG_EN, ALU_EN, CLK_GATE_EN, div_en, W_DATA, 
        W_REG_DATA, REG_ADDRESS, ALU_FUNC, test_si, test_so, test_se );
  input [7:0] SYNC_BUS;
  input [7:0] R_REG_DATA;
  input [15:0] ALU_OUT;
  output [7:0] W_DATA;
  output [7:0] W_REG_DATA;
  output [3:0] REG_ADDRESS;
  output [3:0] ALU_FUNC;
  input REF_CLK, RST_SYNC_2, pulse_gen, W_FULL, R_DATA_VALID, ALU_OUT_VALID,
         test_si, test_se;
  output WINC, W_REG_EN, R_REG_EN, ALU_EN, CLK_GATE_EN, div_en, test_so;
  wire   \comb_reg_address[0] , n27, n28, n29, n41, n42, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n69, n70, n71, n73, n74, n75, n76, n77,
         n78, n79, n80, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n26, n30, n32, n33, n35, n36, n37, n38, n39, n40, n43, n68, n72,
         n81, n99, n100, n101, n102, n103;
  wire   [3:0] current_state;
  wire   [2:0] next_state;
  wire   [7:0] W_DATA_2;
  assign div_en = 1'b1;
  assign test_so = current_state[2];

  SDFFRX1M \comb_reg_address_reg[3]  ( .D(n90), .SI(n102), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(n101), .QN(n27) );
  SDFFRX1M \comb_reg_address_reg[2]  ( .D(n89), .SI(n103), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(n102), .QN(n28) );
  SDFFRX1M \comb_reg_address_reg[1]  ( .D(n88), .SI(\comb_reg_address[0] ), 
        .SE(test_se), .CK(REF_CLK), .RN(n20), .Q(n103), .QN(n29) );
  SDFFRQX2M \W_DATA_2_reg[7]  ( .D(n98), .SI(W_DATA_2[6]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[7]) );
  SDFFRQX2M \W_DATA_2_reg[6]  ( .D(n97), .SI(W_DATA_2[5]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[6]) );
  SDFFRQX2M \W_DATA_2_reg[5]  ( .D(n96), .SI(W_DATA_2[4]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[5]) );
  SDFFRQX2M \W_DATA_2_reg[4]  ( .D(n95), .SI(W_DATA_2[3]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[4]) );
  SDFFRQX2M \W_DATA_2_reg[3]  ( .D(n94), .SI(W_DATA_2[2]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[3]) );
  SDFFRQX2M \W_DATA_2_reg[2]  ( .D(n93), .SI(W_DATA_2[1]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[2]) );
  SDFFRQX2M \W_DATA_2_reg[1]  ( .D(n92), .SI(W_DATA_2[0]), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[1]) );
  SDFFRQX2M \W_DATA_2_reg[0]  ( .D(n91), .SI(test_si), .SE(test_se), .CK(
        REF_CLK), .RN(n20), .Q(W_DATA_2[0]) );
  SDFFRQX2M \comb_reg_address_reg[0]  ( .D(n87), .SI(W_DATA_2[7]), .SE(test_se), .CK(REF_CLK), .RN(n20), .Q(\comb_reg_address[0] ) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(REF_CLK), .RN(n20), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(REF_CLK), .RN(n20), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(n101), .SE(test_se), .CK(REF_CLK), .RN(n20), .Q(current_state[0]) );
  NOR2X2M U18 ( .A(n81), .B(n86), .Y(ALU_FUNC[2]) );
  NOR2X2M U19 ( .A(n100), .B(n86), .Y(ALU_FUNC[0]) );
  OAI22X2M U20 ( .A0(n81), .A1(n83), .B0(n28), .B1(n84), .Y(REG_ADDRESS[2]) );
  BUFX2M U21 ( .A(n70), .Y(n19) );
  INVX2M U22 ( .A(n67), .Y(n24) );
  NAND2X2M U23 ( .A(n33), .B(n30), .Y(CLK_GATE_EN) );
  INVX2M U24 ( .A(n71), .Y(n30) );
  INVX2M U25 ( .A(W_FULL), .Y(n23) );
  NOR3X2M U26 ( .A(n60), .B(n32), .C(n38), .Y(n67) );
  NOR4X1M U27 ( .A(n38), .B(n39), .C(n72), .D(n60), .Y(n45) );
  NOR2X2M U28 ( .A(n100), .B(n19), .Y(W_REG_DATA[0]) );
  NOR2X2M U29 ( .A(n81), .B(n19), .Y(W_REG_DATA[2]) );
  NOR2X2M U30 ( .A(n72), .B(n19), .Y(W_REG_DATA[3]) );
  NOR2X2M U31 ( .A(n68), .B(n19), .Y(W_REG_DATA[4]) );
  NOR2X2M U32 ( .A(n43), .B(n19), .Y(W_REG_DATA[5]) );
  NOR2X2M U33 ( .A(n40), .B(n19), .Y(W_REG_DATA[6]) );
  NOR2X2M U34 ( .A(n39), .B(n19), .Y(W_REG_DATA[7]) );
  NOR2X2M U35 ( .A(n99), .B(n19), .Y(W_REG_DATA[1]) );
  NOR2X2M U36 ( .A(n99), .B(n86), .Y(ALU_FUNC[1]) );
  OAI21BX1M U37 ( .A0(n32), .A1(n60), .B0N(n61), .Y(n51) );
  OAI21X2M U38 ( .A0(n62), .A1(n33), .B0(n82), .Y(WINC) );
  OAI21X2M U39 ( .A0(n35), .A1(n16), .B0(n23), .Y(n82) );
  NOR4BX1M U40 ( .AN(n45), .B(n59), .C(n43), .D(n99), .Y(n58) );
  NAND4X2M U41 ( .A(n44), .B(n81), .C(n40), .D(n32), .Y(n59) );
  INVX2M U42 ( .A(n53), .Y(n33) );
  NAND2X2M U43 ( .A(n37), .B(n36), .Y(n60) );
  INVX2M U44 ( .A(n86), .Y(ALU_EN) );
  NOR2X2M U45 ( .A(n72), .B(n86), .Y(ALU_FUNC[3]) );
  INVX2M U46 ( .A(n66), .Y(n35) );
  OR2X2M U47 ( .A(n63), .B(n61), .Y(n71) );
  INVX2M U48 ( .A(n83), .Y(R_REG_EN) );
  INVX2M U49 ( .A(n19), .Y(W_REG_EN) );
  INVX2M U50 ( .A(n21), .Y(n20) );
  INVX2M U51 ( .A(RST_SYNC_2), .Y(n21) );
  OAI22X4M U52 ( .A0(n72), .A1(n83), .B0(n27), .B1(n84), .Y(REG_ADDRESS[3]) );
  NOR3X2M U53 ( .A(current_state[0]), .B(current_state[2]), .C(n37), .Y(n49)
         );
  NOR3X2M U54 ( .A(n36), .B(current_state[0]), .C(n37), .Y(n53) );
  NOR3X2M U55 ( .A(n32), .B(current_state[2]), .C(n37), .Y(n64) );
  OAI2B2X1M U56 ( .A1N(n64), .A0(n65), .B0(n66), .B1(n23), .Y(n50) );
  NOR2BX2M U57 ( .AN(R_DATA_VALID), .B(W_FULL), .Y(n65) );
  NOR3X2M U58 ( .A(n32), .B(current_state[1]), .C(n36), .Y(n61) );
  NOR3X2M U59 ( .A(current_state[0]), .B(current_state[1]), .C(n36), .Y(n63)
         );
  OAI221X1M U60 ( .A0(n41), .A1(n42), .B0(n66), .B1(n23), .C0(n26), .Y(
        next_state[2]) );
  INVX2M U61 ( .A(CLK_GATE_EN), .Y(n26) );
  NAND3X2M U62 ( .A(n43), .B(n32), .C(n99), .Y(n41) );
  NAND4X2M U63 ( .A(SYNC_BUS[6]), .B(SYNC_BUS[2]), .C(n44), .D(n45), .Y(n42)
         );
  NAND2X2M U64 ( .A(pulse_gen), .B(n53), .Y(n86) );
  OAI22X1M U65 ( .A0(n99), .A1(n24), .B0(n67), .B1(n29), .Y(n88) );
  OAI22X1M U66 ( .A0(n81), .A1(n24), .B0(n67), .B1(n28), .Y(n89) );
  OAI22X1M U67 ( .A0(n72), .A1(n24), .B0(n67), .B1(n27), .Y(n90) );
  NAND2X2M U68 ( .A(pulse_gen), .B(n64), .Y(n83) );
  NOR2BX2M U69 ( .AN(ALU_OUT_VALID), .B(n33), .Y(n18) );
  NOR2BX2M U70 ( .AN(ALU_OUT_VALID), .B(n33), .Y(n69) );
  NOR2BX2M U71 ( .AN(ALU_OUT_VALID), .B(n33), .Y(n17) );
  INVX2M U72 ( .A(current_state[0]), .Y(n32) );
  INVX2M U73 ( .A(pulse_gen), .Y(n38) );
  NAND2X2M U74 ( .A(pulse_gen), .B(n49), .Y(n84) );
  INVX2M U75 ( .A(SYNC_BUS[1]), .Y(n99) );
  INVX2M U76 ( .A(SYNC_BUS[2]), .Y(n81) );
  NAND3X2M U77 ( .A(current_state[2]), .B(current_state[0]), .C(
        current_state[1]), .Y(n66) );
  OAI2BB1X2M U78 ( .A0N(R_REG_DATA[0]), .A1N(n16), .B0(n80), .Y(W_DATA[0]) );
  AOI22X1M U79 ( .A0(W_DATA_2[0]), .A1(n35), .B0(ALU_OUT[0]), .B1(n18), .Y(n80) );
  OAI2BB1X2M U80 ( .A0N(R_REG_DATA[1]), .A1N(n16), .B0(n79), .Y(W_DATA[1]) );
  AOI22X1M U81 ( .A0(W_DATA_2[1]), .A1(n35), .B0(ALU_OUT[1]), .B1(n69), .Y(n79) );
  OAI2BB1X2M U82 ( .A0N(R_REG_DATA[2]), .A1N(n16), .B0(n78), .Y(W_DATA[2]) );
  AOI22X1M U83 ( .A0(W_DATA_2[2]), .A1(n35), .B0(ALU_OUT[2]), .B1(n17), .Y(n78) );
  OAI2BB1X2M U84 ( .A0N(R_REG_DATA[3]), .A1N(n16), .B0(n77), .Y(W_DATA[3]) );
  AOI22X1M U85 ( .A0(W_DATA_2[3]), .A1(n35), .B0(ALU_OUT[3]), .B1(n18), .Y(n77) );
  OAI2BB1X2M U86 ( .A0N(R_REG_DATA[4]), .A1N(n16), .B0(n76), .Y(W_DATA[4]) );
  AOI22X1M U87 ( .A0(W_DATA_2[4]), .A1(n35), .B0(ALU_OUT[4]), .B1(n69), .Y(n76) );
  OAI2BB1X2M U88 ( .A0N(R_REG_DATA[5]), .A1N(n16), .B0(n75), .Y(W_DATA[5]) );
  AOI22X1M U89 ( .A0(W_DATA_2[5]), .A1(n35), .B0(ALU_OUT[5]), .B1(n17), .Y(n75) );
  OAI2BB1X2M U90 ( .A0N(R_REG_DATA[6]), .A1N(n16), .B0(n74), .Y(W_DATA[6]) );
  AOI22X1M U91 ( .A0(W_DATA_2[6]), .A1(n35), .B0(ALU_OUT[6]), .B1(n18), .Y(n74) );
  OAI2BB1X2M U92 ( .A0N(R_REG_DATA[7]), .A1N(n16), .B0(n73), .Y(W_DATA[7]) );
  AOI22X1M U93 ( .A0(W_DATA_2[7]), .A1(n35), .B0(ALU_OUT[7]), .B1(n69), .Y(n73) );
  INVX2M U94 ( .A(SYNC_BUS[3]), .Y(n72) );
  OAI2BB2X1M U95 ( .B0(n100), .B1(n24), .A0N(n24), .A1N(\comb_reg_address[0] ), 
        .Y(n87) );
  INVX2M U96 ( .A(current_state[1]), .Y(n37) );
  INVX2M U97 ( .A(current_state[2]), .Y(n36) );
  OAI21X2M U98 ( .A0(n49), .A1(n71), .B0(pulse_gen), .Y(n70) );
  AOI21X2M U99 ( .A0(n54), .A1(n55), .B0(n68), .Y(n52) );
  NAND4X2M U100 ( .A(SYNC_BUS[5]), .B(SYNC_BUS[1]), .C(n81), .D(n40), .Y(n54)
         );
  NAND4X2M U101 ( .A(SYNC_BUS[6]), .B(SYNC_BUS[2]), .C(n99), .D(n43), .Y(n55)
         );
  NAND2X2M U102 ( .A(n56), .B(n57), .Y(next_state[0]) );
  AOI21X2M U103 ( .A0(n63), .A1(pulse_gen), .B0(n50), .Y(n56) );
  AOI221XLM U104 ( .A0(n22), .A1(n53), .B0(n51), .B1(n38), .C0(n58), .Y(n57)
         );
  INVX2M U105 ( .A(n62), .Y(n22) );
  NAND2X2M U106 ( .A(ALU_OUT_VALID), .B(n23), .Y(n62) );
  INVX2M U107 ( .A(SYNC_BUS[6]), .Y(n40) );
  INVX2M U108 ( .A(SYNC_BUS[5]), .Y(n43) );
  INVX2M U109 ( .A(SYNC_BUS[0]), .Y(n100) );
  CLKXOR2X2M U110 ( .A(n68), .B(SYNC_BUS[0]), .Y(n44) );
  NAND3X2M U111 ( .A(n47), .B(n48), .C(n46), .Y(next_state[1]) );
  NAND2X2M U112 ( .A(pulse_gen), .B(n51), .Y(n47) );
  AOI21X2M U113 ( .A0(n49), .A1(n38), .B0(n50), .Y(n48) );
  AOI31X2M U114 ( .A0(n45), .A1(SYNC_BUS[0]), .A2(n52), .B0(n53), .Y(n46) );
  INVX2M U115 ( .A(SYNC_BUS[7]), .Y(n39) );
  INVX2M U116 ( .A(SYNC_BUS[4]), .Y(n68) );
  AO2B2X2M U117 ( .B0(ALU_OUT[8]), .B1(n17), .A0(W_DATA_2[0]), .A1N(n18), .Y(
        n91) );
  AO2B2X2M U118 ( .B0(ALU_OUT[9]), .B1(n69), .A0(W_DATA_2[1]), .A1N(n17), .Y(
        n92) );
  AO2B2X2M U119 ( .B0(ALU_OUT[10]), .B1(n18), .A0(W_DATA_2[2]), .A1N(n69), .Y(
        n93) );
  AO2B2X2M U120 ( .B0(ALU_OUT[11]), .B1(n17), .A0(W_DATA_2[3]), .A1N(n18), .Y(
        n94) );
  AO2B2X2M U121 ( .B0(ALU_OUT[12]), .B1(n69), .A0(W_DATA_2[4]), .A1N(n17), .Y(
        n95) );
  AO2B2X2M U122 ( .B0(ALU_OUT[13]), .B1(n18), .A0(W_DATA_2[5]), .A1N(n17), .Y(
        n96) );
  AO2B2X2M U123 ( .B0(ALU_OUT[14]), .B1(n17), .A0(W_DATA_2[6]), .A1N(n18), .Y(
        n97) );
  AO2B2X2M U124 ( .B0(ALU_OUT[15]), .B1(n69), .A0(W_DATA_2[7]), .A1N(n17), .Y(
        n98) );
  AND2X2M U125 ( .A(R_DATA_VALID), .B(n64), .Y(n16) );
  OAI22X1M U126 ( .A0(n100), .A1(n83), .B0(n85), .B1(n38), .Y(REG_ADDRESS[0])
         );
  AOI21X2M U127 ( .A0(\comb_reg_address[0] ), .A1(n49), .B0(n61), .Y(n85) );
  OAI22X1M U128 ( .A0(n99), .A1(n83), .B0(n29), .B1(n84), .Y(REG_ADDRESS[1])
         );
endmodule


module Reg_file_DATA_WIDTH8_ADDRESS_BITS3_test_1 ( CLK, RST, R_REG_EN, 
        W_REG_EN, REG_ADDRESS, W_REG_DATA, R_DATA_VALID, R_REG_DATA, REG0, 
        REG1, REG2, REG3, test_si, test_so, test_se );
  input [3:0] REG_ADDRESS;
  input [7:0] W_REG_DATA;
  output [7:0] R_REG_DATA;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, R_REG_EN, W_REG_EN, test_si, test_se;
  output R_DATA_VALID, test_so;
  wire   N10, N11, N12, N13, \Reg_file[15][7] , \Reg_file[15][6] ,
         \Reg_file[15][5] , \Reg_file[15][4] , \Reg_file[15][3] ,
         \Reg_file[15][2] , \Reg_file[15][1] , \Reg_file[15][0] ,
         \Reg_file[14][7] , \Reg_file[14][6] , \Reg_file[14][5] ,
         \Reg_file[14][4] , \Reg_file[14][3] , \Reg_file[14][2] ,
         \Reg_file[14][1] , \Reg_file[14][0] , \Reg_file[13][7] ,
         \Reg_file[13][6] , \Reg_file[13][5] , \Reg_file[13][4] ,
         \Reg_file[13][3] , \Reg_file[13][2] , \Reg_file[13][1] ,
         \Reg_file[13][0] , \Reg_file[12][7] , \Reg_file[12][6] ,
         \Reg_file[12][5] , \Reg_file[12][4] , \Reg_file[12][3] ,
         \Reg_file[12][2] , \Reg_file[12][1] , \Reg_file[12][0] ,
         \Reg_file[11][7] , \Reg_file[11][6] , \Reg_file[11][5] ,
         \Reg_file[11][4] , \Reg_file[11][3] , \Reg_file[11][2] ,
         \Reg_file[11][1] , \Reg_file[11][0] , \Reg_file[10][7] ,
         \Reg_file[10][6] , \Reg_file[10][5] , \Reg_file[10][4] ,
         \Reg_file[10][3] , \Reg_file[10][2] , \Reg_file[10][1] ,
         \Reg_file[10][0] , \Reg_file[9][7] , \Reg_file[9][6] ,
         \Reg_file[9][5] , \Reg_file[9][4] , \Reg_file[9][3] ,
         \Reg_file[9][2] , \Reg_file[9][1] , \Reg_file[9][0] ,
         \Reg_file[8][7] , \Reg_file[8][6] , \Reg_file[8][5] ,
         \Reg_file[8][4] , \Reg_file[8][3] , \Reg_file[8][2] ,
         \Reg_file[8][1] , \Reg_file[8][0] , \Reg_file[7][7] ,
         \Reg_file[7][6] , \Reg_file[7][5] , \Reg_file[7][4] ,
         \Reg_file[7][3] , \Reg_file[7][2] , \Reg_file[7][1] ,
         \Reg_file[7][0] , \Reg_file[6][7] , \Reg_file[6][6] ,
         \Reg_file[6][5] , \Reg_file[6][4] , \Reg_file[6][3] ,
         \Reg_file[6][2] , \Reg_file[6][1] , \Reg_file[6][0] ,
         \Reg_file[5][7] , \Reg_file[5][6] , \Reg_file[5][5] ,
         \Reg_file[5][4] , \Reg_file[5][3] , \Reg_file[5][2] ,
         \Reg_file[5][1] , \Reg_file[5][0] , \Reg_file[4][7] ,
         \Reg_file[4][6] , \Reg_file[4][5] , \Reg_file[4][4] ,
         \Reg_file[4][3] , \Reg_file[4][2] , \Reg_file[4][1] ,
         \Reg_file[4][0] , N35, N36, N37, N38, N39, N40, N41, N42, N59, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373;
  assign N10 = REG_ADDRESS[0];
  assign N11 = REG_ADDRESS[1];
  assign N12 = REG_ADDRESS[2];
  assign N13 = REG_ADDRESS[3];
  assign test_so = \Reg_file[15][7] ;

  SDFFQX2M \R_REG_DATA_reg[7]  ( .D(n185), .SI(R_REG_DATA[6]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[7]) );
  SDFFQX2M \R_REG_DATA_reg[6]  ( .D(n184), .SI(R_REG_DATA[5]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[6]) );
  SDFFQX2M \R_REG_DATA_reg[5]  ( .D(n183), .SI(R_REG_DATA[4]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[5]) );
  SDFFQX2M \R_REG_DATA_reg[4]  ( .D(n182), .SI(R_REG_DATA[3]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[4]) );
  SDFFQX2M \R_REG_DATA_reg[3]  ( .D(n181), .SI(R_REG_DATA[2]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[3]) );
  SDFFQX2M \R_REG_DATA_reg[2]  ( .D(n180), .SI(R_REG_DATA[1]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[2]) );
  SDFFQX2M \R_REG_DATA_reg[1]  ( .D(n179), .SI(R_REG_DATA[0]), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[1]) );
  SDFFQX2M \R_REG_DATA_reg[0]  ( .D(n178), .SI(R_DATA_VALID), .SE(test_se), 
        .CK(n356), .Q(R_REG_DATA[0]) );
  SDFFRQX2M \Reg_file_reg[13][7]  ( .D(n297), .SI(\Reg_file[13][6] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[13][7] ) );
  SDFFRQX2M \Reg_file_reg[13][6]  ( .D(n296), .SI(\Reg_file[13][5] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[13][6] ) );
  SDFFRQX2M \Reg_file_reg[13][5]  ( .D(n295), .SI(\Reg_file[13][4] ), .SE(
        test_se), .CK(n361), .RN(n350), .Q(\Reg_file[13][5] ) );
  SDFFRQX2M \Reg_file_reg[13][4]  ( .D(n294), .SI(\Reg_file[13][3] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[13][4] ) );
  SDFFRQX2M \Reg_file_reg[13][3]  ( .D(n293), .SI(\Reg_file[13][2] ), .SE(
        test_se), .CK(n361), .RN(n344), .Q(\Reg_file[13][3] ) );
  SDFFRQX2M \Reg_file_reg[13][2]  ( .D(n292), .SI(\Reg_file[13][1] ), .SE(
        test_se), .CK(n361), .RN(n350), .Q(\Reg_file[13][2] ) );
  SDFFRQX2M \Reg_file_reg[13][1]  ( .D(n291), .SI(\Reg_file[13][0] ), .SE(
        test_se), .CK(n361), .RN(n348), .Q(\Reg_file[13][1] ) );
  SDFFRQX2M \Reg_file_reg[13][0]  ( .D(n290), .SI(\Reg_file[12][7] ), .SE(
        test_se), .CK(n361), .RN(n347), .Q(\Reg_file[13][0] ) );
  SDFFRQX2M \Reg_file_reg[9][7]  ( .D(n265), .SI(\Reg_file[9][6] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][7] ) );
  SDFFRQX2M \Reg_file_reg[9][6]  ( .D(n264), .SI(\Reg_file[9][5] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][6] ) );
  SDFFRQX2M \Reg_file_reg[9][5]  ( .D(n263), .SI(\Reg_file[9][4] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][5] ) );
  SDFFRQX2M \Reg_file_reg[9][4]  ( .D(n262), .SI(\Reg_file[9][3] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][4] ) );
  SDFFRQX2M \Reg_file_reg[9][3]  ( .D(n261), .SI(\Reg_file[9][2] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][3] ) );
  SDFFRQX2M \Reg_file_reg[9][2]  ( .D(n260), .SI(\Reg_file[9][1] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][2] ) );
  SDFFRQX2M \Reg_file_reg[9][1]  ( .D(n259), .SI(\Reg_file[9][0] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][1] ) );
  SDFFRQX2M \Reg_file_reg[9][0]  ( .D(n258), .SI(\Reg_file[8][7] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[9][0] ) );
  SDFFRQX2M \Reg_file_reg[5][7]  ( .D(n233), .SI(\Reg_file[5][6] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][7] ) );
  SDFFRQX2M \Reg_file_reg[5][6]  ( .D(n232), .SI(\Reg_file[5][5] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][6] ) );
  SDFFRQX2M \Reg_file_reg[5][5]  ( .D(n231), .SI(\Reg_file[5][4] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][5] ) );
  SDFFRQX2M \Reg_file_reg[5][4]  ( .D(n230), .SI(\Reg_file[5][3] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][4] ) );
  SDFFRQX2M \Reg_file_reg[5][3]  ( .D(n229), .SI(\Reg_file[5][2] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][3] ) );
  SDFFRQX2M \Reg_file_reg[5][2]  ( .D(n228), .SI(\Reg_file[5][1] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][2] ) );
  SDFFRQX2M \Reg_file_reg[5][1]  ( .D(n227), .SI(\Reg_file[5][0] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][1] ) );
  SDFFRQX2M \Reg_file_reg[5][0]  ( .D(n226), .SI(\Reg_file[4][7] ), .SE(
        test_se), .CK(n358), .RN(n346), .Q(\Reg_file[5][0] ) );
  SDFFRQX2M \Reg_file_reg[15][7]  ( .D(n313), .SI(\Reg_file[15][6] ), .SE(
        test_se), .CK(n356), .RN(n344), .Q(\Reg_file[15][7] ) );
  SDFFRQX2M \Reg_file_reg[15][6]  ( .D(n312), .SI(\Reg_file[15][5] ), .SE(
        test_se), .CK(n362), .RN(n345), .Q(\Reg_file[15][6] ) );
  SDFFRQX2M \Reg_file_reg[15][5]  ( .D(n311), .SI(\Reg_file[15][4] ), .SE(
        test_se), .CK(n362), .RN(n348), .Q(\Reg_file[15][5] ) );
  SDFFRQX2M \Reg_file_reg[15][4]  ( .D(n310), .SI(\Reg_file[15][3] ), .SE(
        test_se), .CK(n362), .RN(n347), .Q(\Reg_file[15][4] ) );
  SDFFRQX2M \Reg_file_reg[15][3]  ( .D(n309), .SI(\Reg_file[15][2] ), .SE(
        test_se), .CK(n362), .RN(n346), .Q(\Reg_file[15][3] ) );
  SDFFRQX2M \Reg_file_reg[15][2]  ( .D(n308), .SI(\Reg_file[15][1] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[15][2] ) );
  SDFFRQX2M \Reg_file_reg[15][1]  ( .D(n307), .SI(\Reg_file[15][0] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[15][1] ) );
  SDFFRQX2M \Reg_file_reg[15][0]  ( .D(n306), .SI(\Reg_file[14][7] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[15][0] ) );
  SDFFRQX2M \Reg_file_reg[11][7]  ( .D(n281), .SI(\Reg_file[11][6] ), .SE(
        test_se), .CK(n361), .RN(n346), .Q(\Reg_file[11][7] ) );
  SDFFRQX2M \Reg_file_reg[11][6]  ( .D(n280), .SI(\Reg_file[11][5] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[11][6] ) );
  SDFFRQX2M \Reg_file_reg[11][5]  ( .D(n279), .SI(\Reg_file[11][4] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[11][5] ) );
  SDFFRQX2M \Reg_file_reg[11][4]  ( .D(n278), .SI(\Reg_file[11][3] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[11][4] ) );
  SDFFRQX2M \Reg_file_reg[11][3]  ( .D(n277), .SI(\Reg_file[11][2] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[11][3] ) );
  SDFFRQX2M \Reg_file_reg[11][2]  ( .D(n276), .SI(\Reg_file[11][1] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[11][2] ) );
  SDFFRQX2M \Reg_file_reg[11][1]  ( .D(n275), .SI(\Reg_file[11][0] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[11][1] ) );
  SDFFRQX2M \Reg_file_reg[11][0]  ( .D(n274), .SI(\Reg_file[10][7] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[11][0] ) );
  SDFFRQX2M \Reg_file_reg[7][7]  ( .D(n249), .SI(\Reg_file[7][6] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][7] ) );
  SDFFRQX2M \Reg_file_reg[7][6]  ( .D(n248), .SI(\Reg_file[7][5] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][6] ) );
  SDFFRQX2M \Reg_file_reg[7][5]  ( .D(n247), .SI(\Reg_file[7][4] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][5] ) );
  SDFFRQX2M \Reg_file_reg[7][4]  ( .D(n246), .SI(\Reg_file[7][3] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][4] ) );
  SDFFRQX2M \Reg_file_reg[7][3]  ( .D(n245), .SI(\Reg_file[7][2] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][3] ) );
  SDFFRQX2M \Reg_file_reg[7][2]  ( .D(n244), .SI(\Reg_file[7][1] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][2] ) );
  SDFFRQX2M \Reg_file_reg[7][1]  ( .D(n243), .SI(\Reg_file[7][0] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][1] ) );
  SDFFRQX2M \Reg_file_reg[7][0]  ( .D(n242), .SI(\Reg_file[6][7] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[7][0] ) );
  SDFFRQX2M \Reg_file_reg[14][7]  ( .D(n305), .SI(\Reg_file[14][6] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][7] ) );
  SDFFRQX2M \Reg_file_reg[14][6]  ( .D(n304), .SI(\Reg_file[14][5] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][6] ) );
  SDFFRQX2M \Reg_file_reg[14][5]  ( .D(n303), .SI(\Reg_file[14][4] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][5] ) );
  SDFFRQX2M \Reg_file_reg[14][4]  ( .D(n302), .SI(\Reg_file[14][3] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][4] ) );
  SDFFRQX2M \Reg_file_reg[14][3]  ( .D(n301), .SI(\Reg_file[14][2] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][3] ) );
  SDFFRQX2M \Reg_file_reg[14][2]  ( .D(n300), .SI(\Reg_file[14][1] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][2] ) );
  SDFFRQX2M \Reg_file_reg[14][1]  ( .D(n299), .SI(\Reg_file[14][0] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][1] ) );
  SDFFRQX2M \Reg_file_reg[14][0]  ( .D(n298), .SI(\Reg_file[13][7] ), .SE(
        test_se), .CK(n362), .RN(n350), .Q(\Reg_file[14][0] ) );
  SDFFRQX2M \Reg_file_reg[10][7]  ( .D(n273), .SI(\Reg_file[10][6] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][7] ) );
  SDFFRQX2M \Reg_file_reg[10][6]  ( .D(n272), .SI(\Reg_file[10][5] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][6] ) );
  SDFFRQX2M \Reg_file_reg[10][5]  ( .D(n271), .SI(\Reg_file[10][4] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][5] ) );
  SDFFRQX2M \Reg_file_reg[10][4]  ( .D(n270), .SI(\Reg_file[10][3] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][4] ) );
  SDFFRQX2M \Reg_file_reg[10][3]  ( .D(n269), .SI(\Reg_file[10][2] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][3] ) );
  SDFFRQX2M \Reg_file_reg[10][2]  ( .D(n268), .SI(\Reg_file[10][1] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][2] ) );
  SDFFRQX2M \Reg_file_reg[10][1]  ( .D(n267), .SI(\Reg_file[10][0] ), .SE(
        test_se), .CK(n360), .RN(n349), .Q(\Reg_file[10][1] ) );
  SDFFRQX2M \Reg_file_reg[10][0]  ( .D(n266), .SI(\Reg_file[9][7] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[10][0] ) );
  SDFFRQX2M \Reg_file_reg[6][7]  ( .D(n241), .SI(\Reg_file[6][6] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[6][7] ) );
  SDFFRQX2M \Reg_file_reg[6][6]  ( .D(n240), .SI(\Reg_file[6][5] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[6][6] ) );
  SDFFRQX2M \Reg_file_reg[6][5]  ( .D(n239), .SI(\Reg_file[6][4] ), .SE(
        test_se), .CK(n359), .RN(n346), .Q(\Reg_file[6][5] ) );
  SDFFRQX2M \Reg_file_reg[6][4]  ( .D(n238), .SI(\Reg_file[6][3] ), .SE(
        test_se), .CK(n359), .RN(n346), .Q(\Reg_file[6][4] ) );
  SDFFRQX2M \Reg_file_reg[6][3]  ( .D(n237), .SI(\Reg_file[6][2] ), .SE(
        test_se), .CK(n359), .RN(n346), .Q(\Reg_file[6][3] ) );
  SDFFRQX2M \Reg_file_reg[6][2]  ( .D(n236), .SI(\Reg_file[6][1] ), .SE(
        test_se), .CK(n359), .RN(n346), .Q(\Reg_file[6][2] ) );
  SDFFRQX2M \Reg_file_reg[6][1]  ( .D(n235), .SI(\Reg_file[6][0] ), .SE(
        test_se), .CK(n359), .RN(n346), .Q(\Reg_file[6][1] ) );
  SDFFRQX2M \Reg_file_reg[6][0]  ( .D(n234), .SI(\Reg_file[5][7] ), .SE(
        test_se), .CK(n359), .RN(n346), .Q(\Reg_file[6][0] ) );
  SDFFRQX2M \Reg_file_reg[12][7]  ( .D(n289), .SI(\Reg_file[12][6] ), .SE(
        test_se), .CK(n361), .RN(n345), .Q(\Reg_file[12][7] ) );
  SDFFRQX2M \Reg_file_reg[12][6]  ( .D(n288), .SI(\Reg_file[12][5] ), .SE(
        test_se), .CK(n361), .RN(n345), .Q(\Reg_file[12][6] ) );
  SDFFRQX2M \Reg_file_reg[12][5]  ( .D(n287), .SI(\Reg_file[12][4] ), .SE(
        test_se), .CK(n361), .RN(n349), .Q(\Reg_file[12][5] ) );
  SDFFRQX2M \Reg_file_reg[12][4]  ( .D(n286), .SI(\Reg_file[12][3] ), .SE(
        test_se), .CK(n361), .RN(n344), .Q(\Reg_file[12][4] ) );
  SDFFRQX2M \Reg_file_reg[12][3]  ( .D(n285), .SI(\Reg_file[12][2] ), .SE(
        test_se), .CK(n361), .RN(n350), .Q(\Reg_file[12][3] ) );
  SDFFRQX2M \Reg_file_reg[12][2]  ( .D(n284), .SI(\Reg_file[12][1] ), .SE(
        test_se), .CK(n361), .RN(n348), .Q(\Reg_file[12][2] ) );
  SDFFRQX2M \Reg_file_reg[12][1]  ( .D(n283), .SI(\Reg_file[12][0] ), .SE(
        test_se), .CK(n361), .RN(n347), .Q(\Reg_file[12][1] ) );
  SDFFRQX2M \Reg_file_reg[12][0]  ( .D(n282), .SI(\Reg_file[11][7] ), .SE(
        test_se), .CK(n361), .RN(n346), .Q(\Reg_file[12][0] ) );
  SDFFRQX2M \Reg_file_reg[8][7]  ( .D(n257), .SI(\Reg_file[8][6] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[8][7] ) );
  SDFFRQX2M \Reg_file_reg[8][6]  ( .D(n256), .SI(\Reg_file[8][5] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[8][6] ) );
  SDFFRQX2M \Reg_file_reg[8][5]  ( .D(n255), .SI(\Reg_file[8][4] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[8][5] ) );
  SDFFRQX2M \Reg_file_reg[8][4]  ( .D(n254), .SI(\Reg_file[8][3] ), .SE(
        test_se), .CK(n360), .RN(n348), .Q(\Reg_file[8][4] ) );
  SDFFRQX2M \Reg_file_reg[8][3]  ( .D(n253), .SI(\Reg_file[8][2] ), .SE(
        test_se), .CK(n359), .RN(n348), .Q(\Reg_file[8][3] ) );
  SDFFRQX2M \Reg_file_reg[8][2]  ( .D(n252), .SI(\Reg_file[8][1] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[8][2] ) );
  SDFFRQX2M \Reg_file_reg[8][1]  ( .D(n251), .SI(\Reg_file[8][0] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[8][1] ) );
  SDFFRQX2M \Reg_file_reg[8][0]  ( .D(n250), .SI(\Reg_file[7][7] ), .SE(
        test_se), .CK(n359), .RN(n347), .Q(\Reg_file[8][0] ) );
  SDFFRQX2M \Reg_file_reg[4][7]  ( .D(n225), .SI(\Reg_file[4][6] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][7] ) );
  SDFFRQX2M \Reg_file_reg[4][6]  ( .D(n224), .SI(\Reg_file[4][5] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][6] ) );
  SDFFRQX2M \Reg_file_reg[4][5]  ( .D(n223), .SI(\Reg_file[4][4] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][5] ) );
  SDFFRQX2M \Reg_file_reg[4][4]  ( .D(n222), .SI(\Reg_file[4][3] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][4] ) );
  SDFFRQX2M \Reg_file_reg[4][3]  ( .D(n221), .SI(\Reg_file[4][2] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][3] ) );
  SDFFRQX2M \Reg_file_reg[4][2]  ( .D(n220), .SI(\Reg_file[4][1] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][2] ) );
  SDFFRQX2M \Reg_file_reg[4][1]  ( .D(n219), .SI(\Reg_file[4][0] ), .SE(
        test_se), .CK(n358), .RN(n345), .Q(\Reg_file[4][1] ) );
  SDFFRQX2M \Reg_file_reg[4][0]  ( .D(n218), .SI(REG3[7]), .SE(test_se), .CK(
        n358), .RN(n345), .Q(\Reg_file[4][0] ) );
  SDFFRQX2M \Reg_file_reg[3][0]  ( .D(n210), .SI(REG2[7]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG3[0]) );
  SDFFRQX2M \Reg_file_reg[2][1]  ( .D(n203), .SI(REG2[0]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG2[1]) );
  SDFFRQX2M \Reg_file_reg[1][6]  ( .D(n200), .SI(REG1[5]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[6]) );
  SDFFRQX2M \Reg_file_reg[0][7]  ( .D(n193), .SI(REG0[6]), .SE(test_se), .CK(
        n357), .RN(n349), .Q(REG0[7]) );
  SDFFRQX2M \Reg_file_reg[0][6]  ( .D(n192), .SI(REG0[5]), .SE(test_se), .CK(
        n357), .RN(n350), .Q(REG0[6]) );
  SDFFRQX2M \Reg_file_reg[0][5]  ( .D(n191), .SI(REG0[4]), .SE(test_se), .CK(
        n357), .RN(n348), .Q(REG0[5]) );
  SDFFRQX2M \Reg_file_reg[0][4]  ( .D(n190), .SI(REG0[3]), .SE(test_se), .CK(
        n357), .RN(n347), .Q(REG0[4]) );
  SDFFRQX2M \Reg_file_reg[0][3]  ( .D(n189), .SI(REG0[2]), .SE(test_se), .CK(
        n357), .RN(n346), .Q(REG0[3]) );
  SDFFRQX2M \Reg_file_reg[0][2]  ( .D(n188), .SI(REG0[1]), .SE(test_se), .CK(
        n357), .RN(n345), .Q(REG0[2]) );
  SDFFRQX2M \Reg_file_reg[0][1]  ( .D(n187), .SI(REG0[0]), .SE(test_se), .CK(
        n356), .RN(n344), .Q(REG0[1]) );
  SDFFRQX2M \Reg_file_reg[0][0]  ( .D(n186), .SI(R_REG_DATA[7]), .SE(test_se), 
        .CK(n356), .RN(n349), .Q(REG0[0]) );
  SDFFRQX2M R_DATA_VALID_reg ( .D(N59), .SI(test_si), .SE(test_se), .CK(n356), 
        .RN(n347), .Q(R_DATA_VALID) );
  SDFFSQX2M \Reg_file_reg[3][5]  ( .D(n215), .SI(REG3[4]), .SE(test_se), .CK(
        n356), .SN(n347), .Q(REG3[5]) );
  SDFFRQX2M \Reg_file_reg[3][1]  ( .D(n211), .SI(REG3[0]), .SE(test_se), .CK(
        n359), .RN(n345), .Q(REG3[1]) );
  SDFFRQX2M \Reg_file_reg[3][4]  ( .D(n214), .SI(REG3[3]), .SE(test_se), .CK(
        n358), .RN(n345), .Q(REG3[4]) );
  SDFFRQX2M \Reg_file_reg[3][6]  ( .D(n216), .SI(REG3[5]), .SE(test_se), .CK(
        n358), .RN(n345), .Q(REG3[6]) );
  SDFFRQX2M \Reg_file_reg[3][3]  ( .D(n213), .SI(REG3[2]), .SE(test_se), .CK(
        n358), .RN(n345), .Q(REG3[3]) );
  SDFFRQX2M \Reg_file_reg[3][2]  ( .D(n212), .SI(REG3[1]), .SE(test_se), .CK(
        n358), .RN(n345), .Q(REG3[2]) );
  SDFFRQX2M \Reg_file_reg[3][7]  ( .D(n217), .SI(REG3[6]), .SE(test_se), .CK(
        n358), .RN(n345), .Q(REG3[7]) );
  SDFFSQX2M \Reg_file_reg[2][0]  ( .D(n202), .SI(REG1[7]), .SE(test_se), .CK(
        n356), .SN(n346), .Q(REG2[0]) );
  SDFFRQX2M \Reg_file_reg[2][4]  ( .D(n206), .SI(REG2[3]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG2[4]) );
  SDFFRQX2M \Reg_file_reg[2][2]  ( .D(n204), .SI(REG2[1]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG2[2]) );
  SDFFRQX2M \Reg_file_reg[1][1]  ( .D(n195), .SI(REG1[0]), .SE(test_se), .CK(
        n357), .RN(n350), .Q(REG1[1]) );
  SDFFRQX2M \Reg_file_reg[1][5]  ( .D(n199), .SI(REG1[4]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[5]) );
  SDFFRQX2M \Reg_file_reg[1][4]  ( .D(n198), .SI(REG1[3]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[4]) );
  SDFFRQX2M \Reg_file_reg[1][7]  ( .D(n201), .SI(REG1[6]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[7]) );
  SDFFSQX2M \Reg_file_reg[2][7]  ( .D(n209), .SI(REG2[6]), .SE(test_se), .CK(
        n356), .SN(n345), .Q(REG2[7]) );
  SDFFRQX2M \Reg_file_reg[2][3]  ( .D(n205), .SI(REG2[2]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG2[3]) );
  SDFFRQX2M \Reg_file_reg[1][3]  ( .D(n197), .SI(REG1[2]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[3]) );
  SDFFRQX2M \Reg_file_reg[1][2]  ( .D(n196), .SI(REG1[1]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[2]) );
  SDFFRQX2M \Reg_file_reg[2][5]  ( .D(n207), .SI(REG2[4]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG2[5]) );
  SDFFRQX2M \Reg_file_reg[2][6]  ( .D(n208), .SI(REG2[5]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG2[6]) );
  SDFFRQX2M \Reg_file_reg[1][0]  ( .D(n194), .SI(REG0[7]), .SE(test_se), .CK(
        n357), .RN(n344), .Q(REG1[0]) );
  NOR2BX2M U140 ( .AN(n176), .B(n341), .Y(n170) );
  NOR2BX2M U141 ( .AN(N12), .B(N11), .Y(n161) );
  NOR2BX2M U142 ( .AN(N12), .B(n342), .Y(n164) );
  NOR2X2M U143 ( .A(n342), .B(N12), .Y(n158) );
  NOR2X2M U144 ( .A(N11), .B(N12), .Y(n153) );
  NOR2BX2M U145 ( .AN(n165), .B(n341), .Y(n156) );
  INVX2M U146 ( .A(n337), .Y(n339) );
  INVX2M U147 ( .A(n337), .Y(n338) );
  INVX2M U148 ( .A(n335), .Y(n336) );
  INVX2M U149 ( .A(n351), .Y(n350) );
  INVX2M U150 ( .A(n355), .Y(n344) );
  INVX2M U151 ( .A(n354), .Y(n345) );
  INVX2M U152 ( .A(n354), .Y(n346) );
  INVX2M U153 ( .A(n353), .Y(n347) );
  INVX2M U154 ( .A(n353), .Y(n348) );
  INVX2M U155 ( .A(n352), .Y(n349) );
  NOR2BX2M U156 ( .AN(N59), .B(n149), .Y(n150) );
  OR2X2M U157 ( .A(n151), .B(n351), .Y(n149) );
  INVX2M U158 ( .A(n337), .Y(n340) );
  BUFX2M U159 ( .A(n343), .Y(n351) );
  BUFX2M U160 ( .A(n341), .Y(n337) );
  BUFX2M U161 ( .A(n342), .Y(n335) );
  BUFX2M U162 ( .A(n343), .Y(n352) );
  BUFX2M U163 ( .A(n343), .Y(n354) );
  BUFX2M U164 ( .A(n343), .Y(n353) );
  BUFX2M U165 ( .A(n352), .Y(n355) );
  NOR2BX2M U166 ( .AN(n165), .B(N10), .Y(n154) );
  NOR2BX2M U167 ( .AN(n176), .B(N10), .Y(n168) );
  NAND2X2M U168 ( .A(n156), .B(n153), .Y(n155) );
  NAND2X2M U169 ( .A(n168), .B(n153), .Y(n167) );
  NAND2X2M U170 ( .A(n170), .B(n153), .Y(n169) );
  NAND2X2M U171 ( .A(n168), .B(n158), .Y(n171) );
  NAND2X2M U172 ( .A(n170), .B(n158), .Y(n172) );
  NAND2X2M U173 ( .A(n158), .B(n154), .Y(n157) );
  NAND2X2M U174 ( .A(n158), .B(n156), .Y(n159) );
  NAND2X2M U175 ( .A(n161), .B(n154), .Y(n160) );
  NAND2X2M U176 ( .A(n161), .B(n156), .Y(n162) );
  NAND2X2M U177 ( .A(n164), .B(n154), .Y(n163) );
  NAND2X2M U178 ( .A(n164), .B(n156), .Y(n166) );
  NAND2X2M U179 ( .A(n168), .B(n161), .Y(n173) );
  NAND2X2M U180 ( .A(n170), .B(n161), .Y(n174) );
  NAND2X2M U181 ( .A(n168), .B(n164), .Y(n175) );
  NAND2X2M U182 ( .A(n170), .B(n164), .Y(n177) );
  NAND2X2M U183 ( .A(n153), .B(n154), .Y(n152) );
  NOR2BX2M U184 ( .AN(W_REG_EN), .B(R_REG_EN), .Y(n151) );
  NOR2BX2M U185 ( .AN(R_REG_EN), .B(W_REG_EN), .Y(N59) );
  BUFX2M U186 ( .A(n364), .Y(n357) );
  BUFX2M U187 ( .A(n364), .Y(n358) );
  BUFX2M U188 ( .A(n364), .Y(n359) );
  BUFX2M U189 ( .A(n363), .Y(n360) );
  BUFX2M U190 ( .A(n363), .Y(n361) );
  BUFX2M U191 ( .A(n363), .Y(n362) );
  INVX2M U192 ( .A(W_REG_DATA[0]), .Y(n366) );
  INVX2M U193 ( .A(W_REG_DATA[2]), .Y(n368) );
  INVX2M U194 ( .A(W_REG_DATA[3]), .Y(n369) );
  INVX2M U195 ( .A(W_REG_DATA[4]), .Y(n370) );
  INVX2M U196 ( .A(W_REG_DATA[5]), .Y(n371) );
  INVX2M U197 ( .A(W_REG_DATA[6]), .Y(n372) );
  INVX2M U198 ( .A(W_REG_DATA[7]), .Y(n373) );
  INVX2M U199 ( .A(W_REG_DATA[1]), .Y(n367) );
  NOR2BX2M U200 ( .AN(n151), .B(N13), .Y(n165) );
  AND2X2M U201 ( .A(N13), .B(n151), .Y(n176) );
  BUFX2M U202 ( .A(n365), .Y(n356) );
  BUFX2M U203 ( .A(CLK), .Y(n365) );
  BUFX2M U204 ( .A(CLK), .Y(n364) );
  BUFX2M U205 ( .A(CLK), .Y(n363) );
  INVX2M U206 ( .A(RST), .Y(n343) );
  OAI2BB2X1M U207 ( .B0(n152), .B1(n366), .A0N(REG0[0]), .A1N(n152), .Y(n186)
         );
  OAI2BB2X1M U208 ( .B0(n152), .B1(n367), .A0N(REG0[1]), .A1N(n152), .Y(n187)
         );
  OAI2BB2X1M U209 ( .B0(n152), .B1(n368), .A0N(REG0[2]), .A1N(n152), .Y(n188)
         );
  OAI2BB2X1M U210 ( .B0(n152), .B1(n369), .A0N(REG0[3]), .A1N(n152), .Y(n189)
         );
  OAI2BB2X1M U211 ( .B0(n152), .B1(n370), .A0N(REG0[4]), .A1N(n152), .Y(n190)
         );
  OAI2BB2X1M U212 ( .B0(n152), .B1(n371), .A0N(REG0[5]), .A1N(n152), .Y(n191)
         );
  OAI2BB2X1M U213 ( .B0(n152), .B1(n372), .A0N(REG0[6]), .A1N(n152), .Y(n192)
         );
  OAI2BB2X1M U214 ( .B0(n152), .B1(n373), .A0N(REG0[7]), .A1N(n152), .Y(n193)
         );
  OAI2BB2X1M U215 ( .B0(n366), .B1(n155), .A0N(REG1[0]), .A1N(n155), .Y(n194)
         );
  OAI2BB2X1M U216 ( .B0(n367), .B1(n155), .A0N(REG1[1]), .A1N(n155), .Y(n195)
         );
  OAI2BB2X1M U217 ( .B0(n368), .B1(n155), .A0N(REG1[2]), .A1N(n155), .Y(n196)
         );
  OAI2BB2X1M U218 ( .B0(n369), .B1(n155), .A0N(REG1[3]), .A1N(n155), .Y(n197)
         );
  OAI2BB2X1M U219 ( .B0(n370), .B1(n155), .A0N(REG1[4]), .A1N(n155), .Y(n198)
         );
  OAI2BB2X1M U220 ( .B0(n371), .B1(n155), .A0N(REG1[5]), .A1N(n155), .Y(n199)
         );
  OAI2BB2X1M U221 ( .B0(n372), .B1(n155), .A0N(REG1[6]), .A1N(n155), .Y(n200)
         );
  OAI2BB2X1M U222 ( .B0(n373), .B1(n155), .A0N(REG1[7]), .A1N(n155), .Y(n201)
         );
  OAI2BB2X1M U223 ( .B0(n366), .B1(n160), .A0N(\Reg_file[4][0] ), .A1N(n160), 
        .Y(n218) );
  OAI2BB2X1M U224 ( .B0(n367), .B1(n160), .A0N(\Reg_file[4][1] ), .A1N(n160), 
        .Y(n219) );
  OAI2BB2X1M U225 ( .B0(n368), .B1(n160), .A0N(\Reg_file[4][2] ), .A1N(n160), 
        .Y(n220) );
  OAI2BB2X1M U226 ( .B0(n369), .B1(n160), .A0N(\Reg_file[4][3] ), .A1N(n160), 
        .Y(n221) );
  OAI2BB2X1M U227 ( .B0(n370), .B1(n160), .A0N(\Reg_file[4][4] ), .A1N(n160), 
        .Y(n222) );
  OAI2BB2X1M U228 ( .B0(n371), .B1(n160), .A0N(\Reg_file[4][5] ), .A1N(n160), 
        .Y(n223) );
  OAI2BB2X1M U229 ( .B0(n372), .B1(n160), .A0N(\Reg_file[4][6] ), .A1N(n160), 
        .Y(n224) );
  OAI2BB2X1M U230 ( .B0(n373), .B1(n160), .A0N(\Reg_file[4][7] ), .A1N(n160), 
        .Y(n225) );
  OAI2BB2X1M U231 ( .B0(n366), .B1(n162), .A0N(\Reg_file[5][0] ), .A1N(n162), 
        .Y(n226) );
  OAI2BB2X1M U232 ( .B0(n367), .B1(n162), .A0N(\Reg_file[5][1] ), .A1N(n162), 
        .Y(n227) );
  OAI2BB2X1M U233 ( .B0(n368), .B1(n162), .A0N(\Reg_file[5][2] ), .A1N(n162), 
        .Y(n228) );
  OAI2BB2X1M U234 ( .B0(n369), .B1(n162), .A0N(\Reg_file[5][3] ), .A1N(n162), 
        .Y(n229) );
  OAI2BB2X1M U235 ( .B0(n370), .B1(n162), .A0N(\Reg_file[5][4] ), .A1N(n162), 
        .Y(n230) );
  OAI2BB2X1M U236 ( .B0(n371), .B1(n162), .A0N(\Reg_file[5][5] ), .A1N(n162), 
        .Y(n231) );
  OAI2BB2X1M U237 ( .B0(n372), .B1(n162), .A0N(\Reg_file[5][6] ), .A1N(n162), 
        .Y(n232) );
  OAI2BB2X1M U238 ( .B0(n373), .B1(n162), .A0N(\Reg_file[5][7] ), .A1N(n162), 
        .Y(n233) );
  OAI2BB2X1M U239 ( .B0(n366), .B1(n163), .A0N(\Reg_file[6][0] ), .A1N(n163), 
        .Y(n234) );
  OAI2BB2X1M U240 ( .B0(n367), .B1(n163), .A0N(\Reg_file[6][1] ), .A1N(n163), 
        .Y(n235) );
  OAI2BB2X1M U241 ( .B0(n368), .B1(n163), .A0N(\Reg_file[6][2] ), .A1N(n163), 
        .Y(n236) );
  OAI2BB2X1M U242 ( .B0(n369), .B1(n163), .A0N(\Reg_file[6][3] ), .A1N(n163), 
        .Y(n237) );
  OAI2BB2X1M U243 ( .B0(n370), .B1(n163), .A0N(\Reg_file[6][4] ), .A1N(n163), 
        .Y(n238) );
  OAI2BB2X1M U244 ( .B0(n371), .B1(n163), .A0N(\Reg_file[6][5] ), .A1N(n163), 
        .Y(n239) );
  OAI2BB2X1M U245 ( .B0(n372), .B1(n163), .A0N(\Reg_file[6][6] ), .A1N(n163), 
        .Y(n240) );
  OAI2BB2X1M U246 ( .B0(n373), .B1(n163), .A0N(\Reg_file[6][7] ), .A1N(n163), 
        .Y(n241) );
  OAI2BB2X1M U247 ( .B0(n366), .B1(n166), .A0N(\Reg_file[7][0] ), .A1N(n166), 
        .Y(n242) );
  OAI2BB2X1M U248 ( .B0(n367), .B1(n166), .A0N(\Reg_file[7][1] ), .A1N(n166), 
        .Y(n243) );
  OAI2BB2X1M U249 ( .B0(n368), .B1(n166), .A0N(\Reg_file[7][2] ), .A1N(n166), 
        .Y(n244) );
  OAI2BB2X1M U250 ( .B0(n369), .B1(n166), .A0N(\Reg_file[7][3] ), .A1N(n166), 
        .Y(n245) );
  OAI2BB2X1M U251 ( .B0(n370), .B1(n166), .A0N(\Reg_file[7][4] ), .A1N(n166), 
        .Y(n246) );
  OAI2BB2X1M U252 ( .B0(n371), .B1(n166), .A0N(\Reg_file[7][5] ), .A1N(n166), 
        .Y(n247) );
  OAI2BB2X1M U253 ( .B0(n372), .B1(n166), .A0N(\Reg_file[7][6] ), .A1N(n166), 
        .Y(n248) );
  OAI2BB2X1M U254 ( .B0(n373), .B1(n166), .A0N(\Reg_file[7][7] ), .A1N(n166), 
        .Y(n249) );
  OAI2BB2X1M U255 ( .B0(n366), .B1(n167), .A0N(\Reg_file[8][0] ), .A1N(n167), 
        .Y(n250) );
  OAI2BB2X1M U256 ( .B0(n367), .B1(n167), .A0N(\Reg_file[8][1] ), .A1N(n167), 
        .Y(n251) );
  OAI2BB2X1M U257 ( .B0(n368), .B1(n167), .A0N(\Reg_file[8][2] ), .A1N(n167), 
        .Y(n252) );
  OAI2BB2X1M U258 ( .B0(n369), .B1(n167), .A0N(\Reg_file[8][3] ), .A1N(n167), 
        .Y(n253) );
  OAI2BB2X1M U259 ( .B0(n370), .B1(n167), .A0N(\Reg_file[8][4] ), .A1N(n167), 
        .Y(n254) );
  OAI2BB2X1M U260 ( .B0(n371), .B1(n167), .A0N(\Reg_file[8][5] ), .A1N(n167), 
        .Y(n255) );
  OAI2BB2X1M U261 ( .B0(n372), .B1(n167), .A0N(\Reg_file[8][6] ), .A1N(n167), 
        .Y(n256) );
  OAI2BB2X1M U262 ( .B0(n373), .B1(n167), .A0N(\Reg_file[8][7] ), .A1N(n167), 
        .Y(n257) );
  OAI2BB2X1M U263 ( .B0(n366), .B1(n169), .A0N(\Reg_file[9][0] ), .A1N(n169), 
        .Y(n258) );
  OAI2BB2X1M U264 ( .B0(n367), .B1(n169), .A0N(\Reg_file[9][1] ), .A1N(n169), 
        .Y(n259) );
  OAI2BB2X1M U265 ( .B0(n368), .B1(n169), .A0N(\Reg_file[9][2] ), .A1N(n169), 
        .Y(n260) );
  OAI2BB2X1M U266 ( .B0(n369), .B1(n169), .A0N(\Reg_file[9][3] ), .A1N(n169), 
        .Y(n261) );
  OAI2BB2X1M U267 ( .B0(n370), .B1(n169), .A0N(\Reg_file[9][4] ), .A1N(n169), 
        .Y(n262) );
  OAI2BB2X1M U268 ( .B0(n371), .B1(n169), .A0N(\Reg_file[9][5] ), .A1N(n169), 
        .Y(n263) );
  OAI2BB2X1M U269 ( .B0(n372), .B1(n169), .A0N(\Reg_file[9][6] ), .A1N(n169), 
        .Y(n264) );
  OAI2BB2X1M U270 ( .B0(n373), .B1(n169), .A0N(\Reg_file[9][7] ), .A1N(n169), 
        .Y(n265) );
  OAI2BB2X1M U271 ( .B0(n366), .B1(n171), .A0N(\Reg_file[10][0] ), .A1N(n171), 
        .Y(n266) );
  OAI2BB2X1M U272 ( .B0(n367), .B1(n171), .A0N(\Reg_file[10][1] ), .A1N(n171), 
        .Y(n267) );
  OAI2BB2X1M U273 ( .B0(n368), .B1(n171), .A0N(\Reg_file[10][2] ), .A1N(n171), 
        .Y(n268) );
  OAI2BB2X1M U274 ( .B0(n369), .B1(n171), .A0N(\Reg_file[10][3] ), .A1N(n171), 
        .Y(n269) );
  OAI2BB2X1M U275 ( .B0(n370), .B1(n171), .A0N(\Reg_file[10][4] ), .A1N(n171), 
        .Y(n270) );
  OAI2BB2X1M U276 ( .B0(n371), .B1(n171), .A0N(\Reg_file[10][5] ), .A1N(n171), 
        .Y(n271) );
  OAI2BB2X1M U277 ( .B0(n372), .B1(n171), .A0N(\Reg_file[10][6] ), .A1N(n171), 
        .Y(n272) );
  OAI2BB2X1M U278 ( .B0(n373), .B1(n171), .A0N(\Reg_file[10][7] ), .A1N(n171), 
        .Y(n273) );
  OAI2BB2X1M U279 ( .B0(n366), .B1(n172), .A0N(\Reg_file[11][0] ), .A1N(n172), 
        .Y(n274) );
  OAI2BB2X1M U280 ( .B0(n367), .B1(n172), .A0N(\Reg_file[11][1] ), .A1N(n172), 
        .Y(n275) );
  OAI2BB2X1M U281 ( .B0(n368), .B1(n172), .A0N(\Reg_file[11][2] ), .A1N(n172), 
        .Y(n276) );
  OAI2BB2X1M U282 ( .B0(n369), .B1(n172), .A0N(\Reg_file[11][3] ), .A1N(n172), 
        .Y(n277) );
  OAI2BB2X1M U283 ( .B0(n370), .B1(n172), .A0N(\Reg_file[11][4] ), .A1N(n172), 
        .Y(n278) );
  OAI2BB2X1M U284 ( .B0(n371), .B1(n172), .A0N(\Reg_file[11][5] ), .A1N(n172), 
        .Y(n279) );
  OAI2BB2X1M U285 ( .B0(n372), .B1(n172), .A0N(\Reg_file[11][6] ), .A1N(n172), 
        .Y(n280) );
  OAI2BB2X1M U286 ( .B0(n373), .B1(n172), .A0N(\Reg_file[11][7] ), .A1N(n172), 
        .Y(n281) );
  OAI2BB2X1M U287 ( .B0(n366), .B1(n173), .A0N(\Reg_file[12][0] ), .A1N(n173), 
        .Y(n282) );
  OAI2BB2X1M U288 ( .B0(n367), .B1(n173), .A0N(\Reg_file[12][1] ), .A1N(n173), 
        .Y(n283) );
  OAI2BB2X1M U289 ( .B0(n368), .B1(n173), .A0N(\Reg_file[12][2] ), .A1N(n173), 
        .Y(n284) );
  OAI2BB2X1M U290 ( .B0(n369), .B1(n173), .A0N(\Reg_file[12][3] ), .A1N(n173), 
        .Y(n285) );
  OAI2BB2X1M U291 ( .B0(n370), .B1(n173), .A0N(\Reg_file[12][4] ), .A1N(n173), 
        .Y(n286) );
  OAI2BB2X1M U292 ( .B0(n371), .B1(n173), .A0N(\Reg_file[12][5] ), .A1N(n173), 
        .Y(n287) );
  OAI2BB2X1M U293 ( .B0(n372), .B1(n173), .A0N(\Reg_file[12][6] ), .A1N(n173), 
        .Y(n288) );
  OAI2BB2X1M U294 ( .B0(n373), .B1(n173), .A0N(\Reg_file[12][7] ), .A1N(n173), 
        .Y(n289) );
  OAI2BB2X1M U295 ( .B0(n366), .B1(n174), .A0N(\Reg_file[13][0] ), .A1N(n174), 
        .Y(n290) );
  OAI2BB2X1M U296 ( .B0(n367), .B1(n174), .A0N(\Reg_file[13][1] ), .A1N(n174), 
        .Y(n291) );
  OAI2BB2X1M U297 ( .B0(n368), .B1(n174), .A0N(\Reg_file[13][2] ), .A1N(n174), 
        .Y(n292) );
  OAI2BB2X1M U298 ( .B0(n369), .B1(n174), .A0N(\Reg_file[13][3] ), .A1N(n174), 
        .Y(n293) );
  OAI2BB2X1M U299 ( .B0(n370), .B1(n174), .A0N(\Reg_file[13][4] ), .A1N(n174), 
        .Y(n294) );
  OAI2BB2X1M U300 ( .B0(n371), .B1(n174), .A0N(\Reg_file[13][5] ), .A1N(n174), 
        .Y(n295) );
  OAI2BB2X1M U301 ( .B0(n372), .B1(n174), .A0N(\Reg_file[13][6] ), .A1N(n174), 
        .Y(n296) );
  OAI2BB2X1M U302 ( .B0(n373), .B1(n174), .A0N(\Reg_file[13][7] ), .A1N(n174), 
        .Y(n297) );
  OAI2BB2X1M U303 ( .B0(n366), .B1(n175), .A0N(\Reg_file[14][0] ), .A1N(n175), 
        .Y(n298) );
  OAI2BB2X1M U304 ( .B0(n367), .B1(n175), .A0N(\Reg_file[14][1] ), .A1N(n175), 
        .Y(n299) );
  OAI2BB2X1M U305 ( .B0(n368), .B1(n175), .A0N(\Reg_file[14][2] ), .A1N(n175), 
        .Y(n300) );
  OAI2BB2X1M U306 ( .B0(n369), .B1(n175), .A0N(\Reg_file[14][3] ), .A1N(n175), 
        .Y(n301) );
  OAI2BB2X1M U307 ( .B0(n370), .B1(n175), .A0N(\Reg_file[14][4] ), .A1N(n175), 
        .Y(n302) );
  OAI2BB2X1M U308 ( .B0(n371), .B1(n175), .A0N(\Reg_file[14][5] ), .A1N(n175), 
        .Y(n303) );
  OAI2BB2X1M U309 ( .B0(n372), .B1(n175), .A0N(\Reg_file[14][6] ), .A1N(n175), 
        .Y(n304) );
  OAI2BB2X1M U310 ( .B0(n373), .B1(n175), .A0N(\Reg_file[14][7] ), .A1N(n175), 
        .Y(n305) );
  OAI2BB2X1M U311 ( .B0(n366), .B1(n177), .A0N(\Reg_file[15][0] ), .A1N(n177), 
        .Y(n306) );
  OAI2BB2X1M U312 ( .B0(n367), .B1(n177), .A0N(\Reg_file[15][1] ), .A1N(n177), 
        .Y(n307) );
  OAI2BB2X1M U313 ( .B0(n368), .B1(n177), .A0N(\Reg_file[15][2] ), .A1N(n177), 
        .Y(n308) );
  OAI2BB2X1M U314 ( .B0(n369), .B1(n177), .A0N(\Reg_file[15][3] ), .A1N(n177), 
        .Y(n309) );
  OAI2BB2X1M U315 ( .B0(n370), .B1(n177), .A0N(\Reg_file[15][4] ), .A1N(n177), 
        .Y(n310) );
  OAI2BB2X1M U316 ( .B0(n371), .B1(n177), .A0N(\Reg_file[15][5] ), .A1N(n177), 
        .Y(n311) );
  OAI2BB2X1M U317 ( .B0(n372), .B1(n177), .A0N(\Reg_file[15][6] ), .A1N(n177), 
        .Y(n312) );
  OAI2BB2X1M U318 ( .B0(n373), .B1(n177), .A0N(\Reg_file[15][7] ), .A1N(n177), 
        .Y(n313) );
  OAI2BB2X1M U319 ( .B0(n367), .B1(n157), .A0N(REG2[1]), .A1N(n157), .Y(n203)
         );
  OAI2BB2X1M U320 ( .B0(n368), .B1(n157), .A0N(REG2[2]), .A1N(n157), .Y(n204)
         );
  OAI2BB2X1M U321 ( .B0(n369), .B1(n157), .A0N(REG2[3]), .A1N(n157), .Y(n205)
         );
  OAI2BB2X1M U322 ( .B0(n370), .B1(n157), .A0N(REG2[4]), .A1N(n157), .Y(n206)
         );
  OAI2BB2X1M U323 ( .B0(n371), .B1(n157), .A0N(REG2[5]), .A1N(n157), .Y(n207)
         );
  OAI2BB2X1M U324 ( .B0(n372), .B1(n157), .A0N(REG2[6]), .A1N(n157), .Y(n208)
         );
  OAI2BB2X1M U325 ( .B0(n366), .B1(n159), .A0N(REG3[0]), .A1N(n159), .Y(n210)
         );
  OAI2BB2X1M U326 ( .B0(n367), .B1(n159), .A0N(REG3[1]), .A1N(n159), .Y(n211)
         );
  OAI2BB2X1M U327 ( .B0(n368), .B1(n159), .A0N(REG3[2]), .A1N(n159), .Y(n212)
         );
  OAI2BB2X1M U328 ( .B0(n369), .B1(n159), .A0N(REG3[3]), .A1N(n159), .Y(n213)
         );
  OAI2BB2X1M U329 ( .B0(n370), .B1(n159), .A0N(REG3[4]), .A1N(n159), .Y(n214)
         );
  OAI2BB2X1M U330 ( .B0(n372), .B1(n159), .A0N(REG3[6]), .A1N(n159), .Y(n216)
         );
  OAI2BB2X1M U331 ( .B0(n373), .B1(n159), .A0N(REG3[7]), .A1N(n159), .Y(n217)
         );
  OAI2BB2X1M U332 ( .B0(n366), .B1(n157), .A0N(REG2[0]), .A1N(n157), .Y(n202)
         );
  OAI2BB2X1M U333 ( .B0(n373), .B1(n157), .A0N(REG2[7]), .A1N(n157), .Y(n209)
         );
  OAI2BB2X1M U334 ( .B0(n371), .B1(n159), .A0N(REG3[5]), .A1N(n159), .Y(n215)
         );
  MX4X1M U335 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n339), 
        .S1(n336), .Y(n314) );
  MX4X1M U336 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n339), 
        .S1(n336), .Y(n318) );
  MX4X1M U337 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n340), 
        .S1(n336), .Y(n322) );
  MX4X1M U338 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n340), 
        .S1(n336), .Y(n330) );
  MX4X1M U339 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n340), 
        .S1(n336), .Y(n334) );
  MX4X1M U340 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n338), 
        .S1(N11), .Y(n141) );
  MX4X1M U341 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n339), 
        .S1(N11), .Y(n145) );
  MX4X1M U342 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n340), 
        .S1(n336), .Y(n326) );
  MX4X1M U343 ( .A(\Reg_file[4][0] ), .B(\Reg_file[5][0] ), .C(
        \Reg_file[6][0] ), .D(\Reg_file[7][0] ), .S0(n338), .S1(N11), .Y(n140)
         );
  MX4X1M U344 ( .A(\Reg_file[4][1] ), .B(\Reg_file[5][1] ), .C(
        \Reg_file[6][1] ), .D(\Reg_file[7][1] ), .S0(n339), .S1(N11), .Y(n144)
         );
  MX4X1M U345 ( .A(\Reg_file[4][2] ), .B(\Reg_file[5][2] ), .C(
        \Reg_file[6][2] ), .D(\Reg_file[7][2] ), .S0(n339), .S1(n336), .Y(n148) );
  MX4X1M U346 ( .A(\Reg_file[4][3] ), .B(\Reg_file[5][3] ), .C(
        \Reg_file[6][3] ), .D(\Reg_file[7][3] ), .S0(n339), .S1(n336), .Y(n317) );
  MX4X1M U347 ( .A(\Reg_file[4][4] ), .B(\Reg_file[5][4] ), .C(
        \Reg_file[6][4] ), .D(\Reg_file[7][4] ), .S0(n339), .S1(n336), .Y(n321) );
  MX4X1M U348 ( .A(\Reg_file[4][5] ), .B(\Reg_file[5][5] ), .C(
        \Reg_file[6][5] ), .D(\Reg_file[7][5] ), .S0(n340), .S1(n336), .Y(n325) );
  MX4X1M U349 ( .A(\Reg_file[4][6] ), .B(\Reg_file[5][6] ), .C(
        \Reg_file[6][6] ), .D(\Reg_file[7][6] ), .S0(n340), .S1(n336), .Y(n329) );
  MX4X1M U350 ( .A(\Reg_file[4][7] ), .B(\Reg_file[5][7] ), .C(
        \Reg_file[6][7] ), .D(\Reg_file[7][7] ), .S0(n340), .S1(n336), .Y(n333) );
  AO22X1M U351 ( .A0(R_REG_DATA[0]), .A1(n149), .B0(N42), .B1(n150), .Y(n178)
         );
  MX4X1M U352 ( .A(n141), .B(n139), .C(n140), .D(n138), .S0(N13), .S1(N12), 
        .Y(N42) );
  MX4X1M U353 ( .A(\Reg_file[8][0] ), .B(\Reg_file[9][0] ), .C(
        \Reg_file[10][0] ), .D(\Reg_file[11][0] ), .S0(n338), .S1(N11), .Y(
        n139) );
  MX4X1M U354 ( .A(\Reg_file[12][0] ), .B(\Reg_file[13][0] ), .C(
        \Reg_file[14][0] ), .D(\Reg_file[15][0] ), .S0(n338), .S1(N11), .Y(
        n138) );
  AO22X1M U355 ( .A0(R_REG_DATA[1]), .A1(n149), .B0(N41), .B1(n150), .Y(n179)
         );
  MX4X1M U356 ( .A(n145), .B(n143), .C(n144), .D(n142), .S0(N13), .S1(N12), 
        .Y(N41) );
  MX4X1M U357 ( .A(\Reg_file[8][1] ), .B(\Reg_file[9][1] ), .C(
        \Reg_file[10][1] ), .D(\Reg_file[11][1] ), .S0(n338), .S1(n336), .Y(
        n143) );
  MX4X1M U358 ( .A(\Reg_file[12][1] ), .B(\Reg_file[13][1] ), .C(
        \Reg_file[14][1] ), .D(\Reg_file[15][1] ), .S0(n338), .S1(n336), .Y(
        n142) );
  AO22X1M U359 ( .A0(R_REG_DATA[2]), .A1(n149), .B0(N40), .B1(n150), .Y(n180)
         );
  MX4X1M U360 ( .A(n314), .B(n147), .C(n148), .D(n146), .S0(N13), .S1(N12), 
        .Y(N40) );
  MX4X1M U361 ( .A(\Reg_file[8][2] ), .B(\Reg_file[9][2] ), .C(
        \Reg_file[10][2] ), .D(\Reg_file[11][2] ), .S0(n339), .S1(n336), .Y(
        n147) );
  MX4X1M U362 ( .A(\Reg_file[12][2] ), .B(\Reg_file[13][2] ), .C(
        \Reg_file[14][2] ), .D(\Reg_file[15][2] ), .S0(n339), .S1(n336), .Y(
        n146) );
  AO22X1M U363 ( .A0(R_REG_DATA[3]), .A1(n149), .B0(N39), .B1(n150), .Y(n181)
         );
  MX4X1M U364 ( .A(n318), .B(n316), .C(n317), .D(n315), .S0(N13), .S1(N12), 
        .Y(N39) );
  MX4X1M U365 ( .A(\Reg_file[8][3] ), .B(\Reg_file[9][3] ), .C(
        \Reg_file[10][3] ), .D(\Reg_file[11][3] ), .S0(n339), .S1(n336), .Y(
        n316) );
  MX4X1M U366 ( .A(\Reg_file[12][3] ), .B(\Reg_file[13][3] ), .C(
        \Reg_file[14][3] ), .D(\Reg_file[15][3] ), .S0(n339), .S1(n336), .Y(
        n315) );
  AO22X1M U367 ( .A0(R_REG_DATA[4]), .A1(n149), .B0(N38), .B1(n150), .Y(n182)
         );
  MX4X1M U368 ( .A(n322), .B(n320), .C(n321), .D(n319), .S0(N13), .S1(N12), 
        .Y(N38) );
  MX4X1M U369 ( .A(\Reg_file[8][4] ), .B(\Reg_file[9][4] ), .C(
        \Reg_file[10][4] ), .D(\Reg_file[11][4] ), .S0(n339), .S1(n336), .Y(
        n320) );
  MX4X1M U370 ( .A(\Reg_file[12][4] ), .B(\Reg_file[13][4] ), .C(
        \Reg_file[14][4] ), .D(\Reg_file[15][4] ), .S0(n339), .S1(n336), .Y(
        n319) );
  AO22X1M U371 ( .A0(R_REG_DATA[5]), .A1(n149), .B0(N37), .B1(n150), .Y(n183)
         );
  MX4X1M U372 ( .A(n326), .B(n324), .C(n325), .D(n323), .S0(N13), .S1(N12), 
        .Y(N37) );
  MX4X1M U373 ( .A(\Reg_file[8][5] ), .B(\Reg_file[9][5] ), .C(
        \Reg_file[10][5] ), .D(\Reg_file[11][5] ), .S0(n340), .S1(n336), .Y(
        n324) );
  MX4X1M U374 ( .A(\Reg_file[12][5] ), .B(\Reg_file[13][5] ), .C(
        \Reg_file[14][5] ), .D(\Reg_file[15][5] ), .S0(n340), .S1(n336), .Y(
        n323) );
  AO22X1M U375 ( .A0(R_REG_DATA[6]), .A1(n149), .B0(N36), .B1(n150), .Y(n184)
         );
  MX4X1M U376 ( .A(n330), .B(n328), .C(n329), .D(n327), .S0(N13), .S1(N12), 
        .Y(N36) );
  MX4X1M U377 ( .A(\Reg_file[8][6] ), .B(\Reg_file[9][6] ), .C(
        \Reg_file[10][6] ), .D(\Reg_file[11][6] ), .S0(n340), .S1(n336), .Y(
        n328) );
  MX4X1M U378 ( .A(\Reg_file[12][6] ), .B(\Reg_file[13][6] ), .C(
        \Reg_file[14][6] ), .D(\Reg_file[15][6] ), .S0(n340), .S1(n336), .Y(
        n327) );
  AO22X1M U379 ( .A0(R_REG_DATA[7]), .A1(n149), .B0(N35), .B1(n150), .Y(n185)
         );
  MX4X1M U380 ( .A(n334), .B(n332), .C(n333), .D(n331), .S0(N13), .S1(N12), 
        .Y(N35) );
  MX4X1M U381 ( .A(\Reg_file[8][7] ), .B(\Reg_file[9][7] ), .C(
        \Reg_file[10][7] ), .D(\Reg_file[11][7] ), .S0(n340), .S1(n336), .Y(
        n332) );
  MX4X1M U382 ( .A(\Reg_file[12][7] ), .B(\Reg_file[13][7] ), .C(
        \Reg_file[14][7] ), .D(\Reg_file[15][7] ), .S0(n340), .S1(n336), .Y(
        n331) );
  INVX2M U383 ( .A(N10), .Y(n341) );
  INVX2M U384 ( .A(N11), .Y(n342) );
endmodule


module ALU_RTL_DATA_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U9 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n18), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n18), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n18), .Y(n6) );
  NAND2X2M U19 ( .A(n2), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n6), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n4), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U24 ( .A(a[0]), .Y(n10) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_RTL_DATA_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U3 ( .A(B[6]), .Y(n4) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  NAND2X2M U10 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U11 ( .A(B[1]), .Y(n9) );
  INVX2M U12 ( .A(A[0]), .Y(n1) );
endmodule


module ALU_RTL_DATA_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_RTL_DATA_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  XNOR2X2M U4 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U5 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module ALU_RTL_DATA_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U18 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U19 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U20 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  INVX2M U24 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U25 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U27 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U29 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U30 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[7]), .Y(n32) );
  INVX2M U38 ( .A(A[6]), .Y(n33) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[0]), .Y(n39) );
  INVX2M U41 ( .A(A[3]), .Y(n36) );
  INVX2M U42 ( .A(A[2]), .Y(n37) );
  INVX2M U43 ( .A(A[5]), .Y(n34) );
  INVX2M U44 ( .A(A[4]), .Y(n35) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[0]), .Y(n31) );
  INVX2M U47 ( .A(B[2]), .Y(n29) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[7]), .Y(n24) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[5]), .Y(n26) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  ALU_RTL_DATA_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, n11, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_RTL_DATA_WIDTH8_test_1 ( ALU_CLK, RST_SYNC_2, ALU_EN, REG0, REG1, 
        ALU_FUNC, ALU_OUT, ALU_OUT_VALID, test_si, test_se );
  input [7:0] REG0;
  input [7:0] REG1;
  input [3:0] ALU_FUNC;
  output [15:0] ALU_OUT;
  input ALU_CLK, RST_SYNC_2, ALU_EN, test_si, test_se;
  output ALU_OUT_VALID;
  wire   N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N123, N124,
         N125, N126, N127, N128, N129, N130, N131, N156, N157, N158, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n3, n4, n5, n6,
         n7, n8, n9, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157;
  wire   [15:0] ALU_INT;

  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_INT[15]), .SI(ALU_OUT[14]), .SE(test_se), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_INT[14]), .SI(ALU_OUT[13]), .SE(test_se), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_INT[13]), .SI(ALU_OUT[12]), .SE(test_se), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_INT[12]), .SI(ALU_OUT[11]), .SE(test_se), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_INT[11]), .SI(ALU_OUT[10]), .SE(test_se), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_INT[10]), .SI(ALU_OUT[9]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_INT[9]), .SI(ALU_OUT[8]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_INT[8]), .SI(ALU_OUT[7]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_INT[7]), .SI(ALU_OUT[6]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_INT[6]), .SI(ALU_OUT[5]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_INT[5]), .SI(ALU_OUT[4]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_INT[4]), .SI(ALU_OUT[3]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_INT[3]), .SI(ALU_OUT[2]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_INT[2]), .SI(ALU_OUT[1]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_INT[1]), .SI(ALU_OUT[0]), .SE(test_se), 
        .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_INT[0]), .SI(ALU_OUT_VALID), .SE(test_se), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT[0]) );
  SDFFRQX2M ALU_OUT_VALID_reg ( .D(ALU_EN), .SI(test_si), .SE(test_se), .CK(
        ALU_CLK), .RN(RST_SYNC_2), .Q(ALU_OUT_VALID) );
  BUFX2M U7 ( .A(REG0[6]), .Y(n28) );
  OAI2BB1X2M U23 ( .A0N(n157), .A1N(n122), .B0(n118), .Y(n64) );
  OAI2BB1X2M U24 ( .A0N(n117), .A1N(n116), .B0(n118), .Y(n65) );
  NOR2BX2M U25 ( .AN(n123), .B(n154), .Y(n54) );
  AND2X2M U26 ( .A(n116), .B(n122), .Y(n59) );
  NOR2BX2M U27 ( .AN(n52), .B(n152), .Y(n48) );
  AND2X2M U28 ( .A(n123), .B(n122), .Y(n67) );
  BUFX2M U29 ( .A(n58), .Y(n30) );
  NOR2X2M U30 ( .A(n124), .B(n154), .Y(n58) );
  INVX2M U31 ( .A(n117), .Y(n154) );
  INVX2M U32 ( .A(n108), .Y(n155) );
  OAI2BB1X2M U33 ( .A0N(N117), .A1N(n48), .B0(n49), .Y(ALU_INT[9]) );
  OAI2BB1X2M U34 ( .A0N(N118), .A1N(n48), .B0(n49), .Y(ALU_INT[10]) );
  OAI2BB1X2M U35 ( .A0N(N119), .A1N(n48), .B0(n49), .Y(ALU_INT[11]) );
  OAI2BB1X2M U36 ( .A0N(N120), .A1N(n48), .B0(n49), .Y(ALU_INT[12]) );
  OAI2BB1X2M U37 ( .A0N(N121), .A1N(n48), .B0(n49), .Y(ALU_INT[13]) );
  OAI2BB1X2M U38 ( .A0N(N122), .A1N(n48), .B0(n49), .Y(ALU_INT[14]) );
  OAI2BB1X2M U39 ( .A0N(N123), .A1N(n48), .B0(n49), .Y(ALU_INT[15]) );
  INVX2M U40 ( .A(n124), .Y(n157) );
  NOR3BX2M U41 ( .AN(n122), .B(n156), .C(ALU_FUNC[2]), .Y(n66) );
  NOR3X2M U42 ( .A(n154), .B(ALU_FUNC[2]), .C(n156), .Y(n52) );
  NOR2X2M U43 ( .A(ALU_FUNC[2]), .B(ALU_FUNC[1]), .Y(n123) );
  AND3X2M U44 ( .A(n123), .B(n153), .C(n3), .Y(n63) );
  NAND3X2M U45 ( .A(n157), .B(n153), .C(n3), .Y(n53) );
  NAND2X2M U46 ( .A(ALU_FUNC[2]), .B(ALU_FUNC[1]), .Y(n124) );
  INVX2M U47 ( .A(ALU_FUNC[0]), .Y(n153) );
  NOR2X2M U48 ( .A(n153), .B(n3), .Y(n122) );
  NOR2X2M U49 ( .A(n3), .B(ALU_FUNC[0]), .Y(n117) );
  NAND3X2M U50 ( .A(n3), .B(ALU_FUNC[0]), .C(n116), .Y(n108) );
  INVX2M U51 ( .A(ALU_FUNC[1]), .Y(n156) );
  NAND3X2M U52 ( .A(n123), .B(ALU_FUNC[0]), .C(n3), .Y(n118) );
  NAND2X2M U53 ( .A(ALU_EN), .B(n140), .Y(n49) );
  AND2X2M U54 ( .A(ALU_FUNC[2]), .B(n156), .Y(n116) );
  AND4X2M U55 ( .A(N158), .B(n116), .C(n3), .D(n153), .Y(n107) );
  INVX2M U56 ( .A(ALU_EN), .Y(n152) );
  OAI222X1M U57 ( .A0(n72), .A1(n139), .B0(n4), .B1(n73), .C0(n53), .C1(n146), 
        .Y(n71) );
  AOI221XLM U58 ( .A0(n28), .A1(n63), .B0(n64), .B1(n145), .C0(n30), .Y(n73)
         );
  AOI221XLM U59 ( .A0(n63), .A1(n145), .B0(n28), .B1(n65), .C0(n59), .Y(n72)
         );
  INVX2M U60 ( .A(n42), .Y(n137) );
  AOI31X2M U61 ( .A0(n92), .A1(n93), .A2(n94), .B0(n152), .Y(ALU_INT[2]) );
  AOI22X1M U62 ( .A0(N101), .A1(n67), .B0(N92), .B1(n54), .Y(n92) );
  AOI221XLM U63 ( .A0(n8), .A1(n155), .B0(n30), .B1(n149), .C0(n95), .Y(n94)
         );
  AOI222X1M U64 ( .A0(N110), .A1(n52), .B0(n7), .B1(n59), .C0(N126), .C1(n66), 
        .Y(n93) );
  AOI31X2M U65 ( .A0(n86), .A1(n87), .A2(n88), .B0(n152), .Y(ALU_INT[3]) );
  AOI22X1M U66 ( .A0(N102), .A1(n67), .B0(N93), .B1(n54), .Y(n86) );
  AOI221XLM U67 ( .A0(n9), .A1(n155), .B0(n30), .B1(n148), .C0(n89), .Y(n88)
         );
  AOI222X1M U68 ( .A0(N111), .A1(n52), .B0(n8), .B1(n59), .C0(N127), .C1(n66), 
        .Y(n87) );
  AOI31X2M U69 ( .A0(n80), .A1(n81), .A2(n82), .B0(n152), .Y(ALU_INT[4]) );
  AOI22X1M U70 ( .A0(N103), .A1(n67), .B0(N94), .B1(n54), .Y(n80) );
  AOI221XLM U71 ( .A0(n155), .A1(n27), .B0(n30), .B1(n147), .C0(n83), .Y(n82)
         );
  AOI222X1M U72 ( .A0(N112), .A1(n52), .B0(n9), .B1(n59), .C0(N128), .C1(n66), 
        .Y(n81) );
  AOI31X2M U73 ( .A0(n74), .A1(n75), .A2(n76), .B0(n152), .Y(ALU_INT[5]) );
  AOI22X1M U74 ( .A0(N104), .A1(n67), .B0(N95), .B1(n54), .Y(n74) );
  AOI221XLM U75 ( .A0(n155), .A1(n28), .B0(n30), .B1(n146), .C0(n77), .Y(n76)
         );
  AOI222X1M U76 ( .A0(N113), .A1(n52), .B0(n27), .B1(n59), .C0(N129), .C1(n66), 
        .Y(n75) );
  AOI31X2M U77 ( .A0(n68), .A1(n69), .A2(n70), .B0(n152), .Y(ALU_INT[6]) );
  AOI22X1M U78 ( .A0(N105), .A1(n67), .B0(N96), .B1(n54), .Y(n68) );
  AOI221XLM U79 ( .A0(n155), .A1(n29), .B0(n30), .B1(n145), .C0(n71), .Y(n70)
         );
  AOI222X1M U80 ( .A0(N114), .A1(n52), .B0(n59), .B1(n28), .C0(N130), .C1(n66), 
        .Y(n69) );
  AOI31X2M U81 ( .A0(n55), .A1(n56), .A2(n57), .B0(n152), .Y(ALU_INT[7]) );
  AOI22X1M U82 ( .A0(N131), .A1(n66), .B0(N115), .B1(n52), .Y(n56) );
  AOI22X1M U83 ( .A0(N106), .A1(n67), .B0(N97), .B1(n54), .Y(n55) );
  AOI221XLM U84 ( .A0(n30), .A1(n144), .B0(n59), .B1(n29), .C0(n60), .Y(n57)
         );
  AOI31X2M U85 ( .A0(n110), .A1(n111), .A2(n112), .B0(n152), .Y(ALU_INT[0]) );
  AOI22X1M U86 ( .A0(N99), .A1(n67), .B0(N90), .B1(n54), .Y(n110) );
  AOI211X2M U87 ( .A0(n30), .A1(n151), .B0(n113), .C0(n114), .Y(n112) );
  AOI222X1M U88 ( .A0(N108), .A1(n52), .B0(n5), .B1(n59), .C0(N124), .C1(n66), 
        .Y(n111) );
  AOI31X2M U89 ( .A0(n98), .A1(n99), .A2(n100), .B0(n152), .Y(ALU_INT[1]) );
  AOI211X2M U90 ( .A0(n7), .A1(n155), .B0(n101), .C0(n102), .Y(n100) );
  AOI222X1M U91 ( .A0(N125), .A1(n66), .B0(n30), .B1(n150), .C0(n6), .C1(n59), 
        .Y(n99) );
  AOI222X1M U92 ( .A0(N91), .A1(n54), .B0(N109), .B1(n52), .C0(N100), .C1(n67), 
        .Y(n98) );
  INVX2M U93 ( .A(n109), .Y(n140) );
  AOI211X2M U94 ( .A0(N107), .A1(n67), .B0(n30), .C0(n64), .Y(n109) );
  AOI21X2M U95 ( .A0(n50), .A1(n51), .B0(n152), .Y(ALU_INT[8]) );
  AOI21X2M U96 ( .A0(N98), .A1(n54), .B0(n140), .Y(n50) );
  AOI2BB2XLM U97 ( .B0(N116), .B1(n52), .A0N(n144), .A1N(n53), .Y(n51) );
  INVX2M U98 ( .A(n133), .Y(N157) );
  INVX2M U99 ( .A(n4), .Y(n139) );
  BUFX2M U100 ( .A(ALU_FUNC[3]), .Y(n3) );
  INVX2M U101 ( .A(n6), .Y(n150) );
  INVX2M U102 ( .A(n5), .Y(n151) );
  INVX2M U103 ( .A(n28), .Y(n145) );
  INVX2M U104 ( .A(n29), .Y(n144) );
  INVX2M U105 ( .A(n8), .Y(n148) );
  INVX2M U106 ( .A(n7), .Y(n149) );
  INVX2M U107 ( .A(n27), .Y(n146) );
  INVX2M U108 ( .A(n9), .Y(n147) );
  OAI222X1M U109 ( .A0(n96), .A1(n136), .B0(REG1[2]), .B1(n97), .C0(n53), .C1(
        n150), .Y(n95) );
  AOI221XLM U110 ( .A0(n7), .A1(n63), .B0(n64), .B1(n149), .C0(n30), .Y(n97)
         );
  AOI221XLM U111 ( .A0(n63), .A1(n149), .B0(n7), .B1(n65), .C0(n59), .Y(n96)
         );
  OAI222X1M U112 ( .A0(n90), .A1(n138), .B0(REG1[3]), .B1(n91), .C0(n53), .C1(
        n149), .Y(n89) );
  AOI221XLM U113 ( .A0(n8), .A1(n63), .B0(n64), .B1(n148), .C0(n30), .Y(n91)
         );
  AOI221XLM U114 ( .A0(n63), .A1(n148), .B0(n8), .B1(n65), .C0(n59), .Y(n90)
         );
  OAI222X1M U115 ( .A0(n84), .A1(n143), .B0(REG1[4]), .B1(n85), .C0(n53), .C1(
        n148), .Y(n83) );
  INVX2M U116 ( .A(REG1[4]), .Y(n143) );
  AOI221XLM U117 ( .A0(n9), .A1(n63), .B0(n64), .B1(n147), .C0(n30), .Y(n85)
         );
  AOI221XLM U118 ( .A0(n63), .A1(n147), .B0(n9), .B1(n65), .C0(n59), .Y(n84)
         );
  OAI222X1M U119 ( .A0(n78), .A1(n142), .B0(REG1[5]), .B1(n79), .C0(n53), .C1(
        n147), .Y(n77) );
  INVX2M U120 ( .A(REG1[5]), .Y(n142) );
  AOI221XLM U121 ( .A0(n27), .A1(n63), .B0(n64), .B1(n146), .C0(n30), .Y(n79)
         );
  AOI221XLM U122 ( .A0(n63), .A1(n146), .B0(n27), .B1(n65), .C0(n59), .Y(n78)
         );
  OAI222X1M U123 ( .A0(n61), .A1(n141), .B0(REG1[7]), .B1(n62), .C0(n53), .C1(
        n145), .Y(n60) );
  INVX2M U124 ( .A(REG1[7]), .Y(n141) );
  AOI221XLM U125 ( .A0(n63), .A1(n29), .B0(n64), .B1(n144), .C0(n30), .Y(n62)
         );
  AOI221XLM U126 ( .A0(n63), .A1(n144), .B0(n29), .B1(n65), .C0(n59), .Y(n61)
         );
  INVX2M U127 ( .A(n31), .Y(n135) );
  OAI2B2X1M U128 ( .A1N(REG1[0]), .A0(n115), .B0(n108), .B1(n150), .Y(n114) );
  AOI221XLM U129 ( .A0(n63), .A1(n151), .B0(n5), .B1(n65), .C0(n59), .Y(n115)
         );
  OAI2B2X1M U130 ( .A1N(REG1[1]), .A0(n103), .B0(n53), .B1(n151), .Y(n102) );
  AOI221XLM U131 ( .A0(n63), .A1(n150), .B0(n6), .B1(n65), .C0(n59), .Y(n103)
         );
  OAI21X2M U132 ( .A0(REG1[0]), .A1(n119), .B0(n120), .Y(n113) );
  AOI31X2M U133 ( .A0(N156), .A1(n3), .A2(n121), .B0(n107), .Y(n120) );
  AOI221XLM U134 ( .A0(n5), .A1(n63), .B0(n64), .B1(n151), .C0(n30), .Y(n119)
         );
  NOR3X2M U135 ( .A(n156), .B(ALU_FUNC[2]), .C(ALU_FUNC[0]), .Y(n121) );
  OAI21X2M U136 ( .A0(REG1[1]), .A1(n104), .B0(n105), .Y(n101) );
  AOI31X2M U137 ( .A0(N157), .A1(n3), .A2(n106), .B0(n107), .Y(n105) );
  AOI221XLM U138 ( .A0(n6), .A1(n63), .B0(n64), .B1(n150), .C0(n30), .Y(n104)
         );
  NOR3X2M U139 ( .A(n153), .B(ALU_FUNC[2]), .C(n156), .Y(n106) );
  BUFX2M U140 ( .A(REG0[7]), .Y(n29) );
  BUFX2M U141 ( .A(REG0[1]), .Y(n6) );
  BUFX2M U142 ( .A(REG0[0]), .Y(n5) );
  BUFX2M U143 ( .A(REG0[3]), .Y(n8) );
  BUFX2M U144 ( .A(REG0[2]), .Y(n7) );
  BUFX2M U145 ( .A(REG0[5]), .Y(n27) );
  BUFX2M U146 ( .A(REG0[4]), .Y(n9) );
  BUFX2M U147 ( .A(REG1[6]), .Y(n4) );
  INVX2M U148 ( .A(REG1[0]), .Y(n134) );
  INVX2M U149 ( .A(REG1[2]), .Y(n136) );
  INVX2M U150 ( .A(REG1[3]), .Y(n138) );
  NOR2X1M U151 ( .A(n144), .B(REG1[7]), .Y(n130) );
  NAND2BX1M U152 ( .AN(REG1[4]), .B(n9), .Y(n46) );
  NAND2BX1M U153 ( .AN(n9), .B(REG1[4]), .Y(n35) );
  CLKNAND2X2M U154 ( .A(n46), .B(n35), .Y(n125) );
  NOR2X1M U155 ( .A(n138), .B(n8), .Y(n43) );
  NOR2X1M U156 ( .A(n136), .B(n7), .Y(n34) );
  NOR2X1M U157 ( .A(n134), .B(n5), .Y(n31) );
  CLKNAND2X2M U158 ( .A(n7), .B(n136), .Y(n45) );
  NAND2BX1M U159 ( .AN(n34), .B(n45), .Y(n40) );
  AOI21X1M U160 ( .A0(n31), .A1(n150), .B0(REG1[1]), .Y(n32) );
  AOI211X1M U161 ( .A0(n6), .A1(n135), .B0(n40), .C0(n32), .Y(n33) );
  CLKNAND2X2M U162 ( .A(n8), .B(n138), .Y(n44) );
  OAI31X1M U163 ( .A0(n43), .A1(n34), .A2(n33), .B0(n44), .Y(n36) );
  NAND2BX1M U164 ( .AN(n27), .B(REG1[5]), .Y(n128) );
  OAI211X1M U165 ( .A0(n125), .A1(n36), .B0(n35), .C0(n128), .Y(n37) );
  NAND2BX1M U166 ( .AN(REG1[5]), .B(n27), .Y(n47) );
  XNOR2X1M U167 ( .A(n28), .B(n4), .Y(n127) );
  AOI32X1M U168 ( .A0(n37), .A1(n47), .A2(n127), .B0(n4), .B1(n145), .Y(n38)
         );
  CLKNAND2X2M U169 ( .A(REG1[7]), .B(n144), .Y(n131) );
  OAI21X1M U170 ( .A0(n130), .A1(n38), .B0(n131), .Y(N158) );
  CLKNAND2X2M U171 ( .A(n5), .B(n134), .Y(n41) );
  OA21X1M U172 ( .A0(n41), .A1(n150), .B0(REG1[1]), .Y(n39) );
  AOI211X1M U173 ( .A0(n41), .A1(n150), .B0(n40), .C0(n39), .Y(n42) );
  AOI31X1M U174 ( .A0(n137), .A1(n45), .A2(n44), .B0(n43), .Y(n126) );
  OAI2B11X1M U175 ( .A1N(n126), .A0(n125), .B0(n47), .C0(n46), .Y(n129) );
  AOI32X1M U176 ( .A0(n129), .A1(n128), .A2(n127), .B0(n28), .B1(n139), .Y(
        n132) );
  AOI2B1X1M U177 ( .A1N(n132), .A0(n131), .B0(n130), .Y(n133) );
  NOR2X1M U178 ( .A(N158), .B(N157), .Y(N156) );
  ALU_RTL_DATA_WIDTH8_DW_div_uns_0 div_22 ( .a({n29, n28, n27, n9, n8, n7, n6, 
        n5}), .b({REG1[7], n4, REG1[5:0]}), .quotient({N131, N130, N129, N128, 
        N127, N126, N125, N124}) );
  ALU_RTL_DATA_WIDTH8_DW01_sub_0 sub_20 ( .A({1'b0, n29, n28, n27, n9, n8, n7, 
        n6, n5}), .B({1'b0, REG1[7], n4, REG1[5:0]}), .CI(1'b0), .DIFF({N107, 
        N106, N105, N104, N103, N102, N101, N100, N99}) );
  ALU_RTL_DATA_WIDTH8_DW01_add_0 add_19 ( .A({1'b0, n29, n28, n27, n9, n8, n7, 
        n6, n5}), .B({1'b0, REG1[7], n4, REG1[5:0]}), .CI(1'b0), .SUM({N98, 
        N97, N96, N95, N94, N93, N92, N91, N90}) );
  ALU_RTL_DATA_WIDTH8_DW02_mult_0 mult_21 ( .A({n29, n28, n27, n9, n8, n7, n6, 
        n5}), .B({REG1[7], n4, REG1[5:0]}), .TC(1'b0), .PRODUCT({N123, N122, 
        N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, 
        N109, N108}) );
endmodule


module FIFO_BUFFER_DATA_WIDTH8_FIFO_DEPTH8_ADDRESS_BITS3_test_1 ( W_CLK, W_RST, 
        WINC, W_FULL, W_DATA, W_ADDRESS, R_ADDRESS, R_DATA, test_si, test_se
 );
  input [7:0] W_DATA;
  input [2:0] W_ADDRESS;
  input [2:0] R_ADDRESS;
  output [7:0] R_DATA;
  input W_CLK, W_RST, WINC, W_FULL, test_si, test_se;
  wire   N9, N10, N11, \REG[7][7] , \REG[7][6] , \REG[7][5] , \REG[7][4] ,
         \REG[7][3] , \REG[7][2] , \REG[7][1] , \REG[7][0] , \REG[6][7] ,
         \REG[6][6] , \REG[6][5] , \REG[6][4] , \REG[6][3] , \REG[6][2] ,
         \REG[6][1] , \REG[6][0] , \REG[5][7] , \REG[5][6] , \REG[5][5] ,
         \REG[5][4] , \REG[5][3] , \REG[5][2] , \REG[5][1] , \REG[5][0] ,
         \REG[4][7] , \REG[4][6] , \REG[4][5] , \REG[4][4] , \REG[4][3] ,
         \REG[4][2] , \REG[4][1] , \REG[4][0] , \REG[3][7] , \REG[3][6] ,
         \REG[3][5] , \REG[3][4] , \REG[3][3] , \REG[3][2] , \REG[3][1] ,
         \REG[3][0] , \REG[2][7] , \REG[2][6] , \REG[2][5] , \REG[2][4] ,
         \REG[2][3] , \REG[2][2] , \REG[2][1] , \REG[2][0] , \REG[1][7] ,
         \REG[1][6] , \REG[1][5] , \REG[1][4] , \REG[1][3] , \REG[1][2] ,
         \REG[1][1] , \REG[1][0] , \REG[0][7] , \REG[0][6] , \REG[0][5] ,
         \REG[0][4] , \REG[0][3] , \REG[0][2] , \REG[0][1] , \REG[0][0] , N31,
         N32, N33, N34, N35, N36, N37, N38, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195;
  assign N9 = R_ADDRESS[0];
  assign N10 = R_ADDRESS[1];
  assign N11 = R_ADDRESS[2];

  SDFFRQX2M \REG_reg[5][7]  ( .D(n141), .SI(\REG[5][6] ), .SE(test_se), .CK(
        n181), .RN(n174), .Q(\REG[5][7] ) );
  SDFFRQX2M \REG_reg[5][6]  ( .D(n140), .SI(\REG[5][5] ), .SE(test_se), .CK(
        n181), .RN(n174), .Q(\REG[5][6] ) );
  SDFFRQX2M \REG_reg[5][5]  ( .D(n139), .SI(\REG[5][4] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[5][5] ) );
  SDFFRQX2M \REG_reg[5][4]  ( .D(n138), .SI(\REG[5][3] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[5][4] ) );
  SDFFRQX2M \REG_reg[5][3]  ( .D(n137), .SI(\REG[5][2] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[5][3] ) );
  SDFFRQX2M \REG_reg[5][2]  ( .D(n136), .SI(\REG[5][1] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[5][2] ) );
  SDFFRQX2M \REG_reg[5][1]  ( .D(n135), .SI(\REG[5][0] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[5][1] ) );
  SDFFRQX2M \REG_reg[5][0]  ( .D(n134), .SI(\REG[4][7] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[5][0] ) );
  SDFFRQX2M \REG_reg[1][7]  ( .D(n109), .SI(\REG[1][6] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[1][7] ) );
  SDFFRQX2M \REG_reg[1][6]  ( .D(n108), .SI(\REG[1][5] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[1][6] ) );
  SDFFRQX2M \REG_reg[1][5]  ( .D(n107), .SI(\REG[1][4] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[1][5] ) );
  SDFFRQX2M \REG_reg[1][4]  ( .D(n106), .SI(\REG[1][3] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[1][4] ) );
  SDFFRQX2M \REG_reg[1][3]  ( .D(n105), .SI(\REG[1][2] ), .SE(test_se), .CK(
        n184), .RN(n177), .Q(\REG[1][3] ) );
  SDFFRQX2M \REG_reg[1][2]  ( .D(n104), .SI(\REG[1][1] ), .SE(test_se), .CK(
        n184), .RN(n177), .Q(\REG[1][2] ) );
  SDFFRQX2M \REG_reg[1][1]  ( .D(n103), .SI(\REG[1][0] ), .SE(test_se), .CK(
        n184), .RN(n177), .Q(\REG[1][1] ) );
  SDFFRQX2M \REG_reg[1][0]  ( .D(n102), .SI(\REG[0][7] ), .SE(test_se), .CK(
        n184), .RN(n177), .Q(\REG[1][0] ) );
  SDFFRQX2M \REG_reg[7][7]  ( .D(n157), .SI(\REG[7][6] ), .SE(test_se), .CK(
        n180), .RN(n172), .Q(\REG[7][7] ) );
  SDFFRQX2M \REG_reg[7][6]  ( .D(n156), .SI(\REG[7][5] ), .SE(test_se), .CK(
        n180), .RN(n172), .Q(\REG[7][6] ) );
  SDFFRQX2M \REG_reg[7][5]  ( .D(n155), .SI(\REG[7][4] ), .SE(test_se), .CK(
        n180), .RN(n172), .Q(\REG[7][5] ) );
  SDFFRQX2M \REG_reg[7][4]  ( .D(n154), .SI(\REG[7][3] ), .SE(test_se), .CK(
        n180), .RN(n172), .Q(\REG[7][4] ) );
  SDFFRQX2M \REG_reg[7][3]  ( .D(n153), .SI(\REG[7][2] ), .SE(test_se), .CK(
        n180), .RN(n173), .Q(\REG[7][3] ) );
  SDFFRQX2M \REG_reg[7][2]  ( .D(n152), .SI(\REG[7][1] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[7][2] ) );
  SDFFRQX2M \REG_reg[7][1]  ( .D(n151), .SI(\REG[7][0] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[7][1] ) );
  SDFFRQX2M \REG_reg[7][0]  ( .D(n150), .SI(\REG[6][7] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[7][0] ) );
  SDFFRQX2M \REG_reg[3][7]  ( .D(n125), .SI(\REG[3][6] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][7] ) );
  SDFFRQX2M \REG_reg[3][6]  ( .D(n124), .SI(\REG[3][5] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][6] ) );
  SDFFRQX2M \REG_reg[3][5]  ( .D(n123), .SI(\REG[3][4] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][5] ) );
  SDFFRQX2M \REG_reg[3][4]  ( .D(n122), .SI(\REG[3][3] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][4] ) );
  SDFFRQX2M \REG_reg[3][3]  ( .D(n121), .SI(\REG[3][2] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][3] ) );
  SDFFRQX2M \REG_reg[3][2]  ( .D(n120), .SI(\REG[3][1] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][2] ) );
  SDFFRQX2M \REG_reg[3][1]  ( .D(n119), .SI(\REG[3][0] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][1] ) );
  SDFFRQX2M \REG_reg[3][0]  ( .D(n118), .SI(\REG[2][7] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[3][0] ) );
  SDFFRQX2M \REG_reg[6][7]  ( .D(n149), .SI(\REG[6][6] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][7] ) );
  SDFFRQX2M \REG_reg[6][6]  ( .D(n148), .SI(\REG[6][5] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][6] ) );
  SDFFRQX2M \REG_reg[6][5]  ( .D(n147), .SI(\REG[6][4] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][5] ) );
  SDFFRQX2M \REG_reg[6][4]  ( .D(n146), .SI(\REG[6][3] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][4] ) );
  SDFFRQX2M \REG_reg[6][3]  ( .D(n145), .SI(\REG[6][2] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][3] ) );
  SDFFRQX2M \REG_reg[6][2]  ( .D(n144), .SI(\REG[6][1] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][2] ) );
  SDFFRQX2M \REG_reg[6][1]  ( .D(n143), .SI(\REG[6][0] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][1] ) );
  SDFFRQX2M \REG_reg[6][0]  ( .D(n142), .SI(\REG[5][7] ), .SE(test_se), .CK(
        n181), .RN(n173), .Q(\REG[6][0] ) );
  SDFFRQX2M \REG_reg[2][7]  ( .D(n117), .SI(\REG[2][6] ), .SE(test_se), .CK(
        n183), .RN(n176), .Q(\REG[2][7] ) );
  SDFFRQX2M \REG_reg[2][6]  ( .D(n116), .SI(\REG[2][5] ), .SE(test_se), .CK(
        n183), .RN(n176), .Q(\REG[2][6] ) );
  SDFFRQX2M \REG_reg[2][5]  ( .D(n115), .SI(\REG[2][4] ), .SE(test_se), .CK(
        n183), .RN(n176), .Q(\REG[2][5] ) );
  SDFFRQX2M \REG_reg[2][4]  ( .D(n114), .SI(\REG[2][3] ), .SE(test_se), .CK(
        n183), .RN(n176), .Q(\REG[2][4] ) );
  SDFFRQX2M \REG_reg[2][3]  ( .D(n113), .SI(\REG[2][2] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[2][3] ) );
  SDFFRQX2M \REG_reg[2][2]  ( .D(n112), .SI(\REG[2][1] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[2][2] ) );
  SDFFRQX2M \REG_reg[2][1]  ( .D(n111), .SI(\REG[2][0] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[2][1] ) );
  SDFFRQX2M \REG_reg[2][0]  ( .D(n110), .SI(\REG[1][7] ), .SE(test_se), .CK(
        n184), .RN(n176), .Q(\REG[2][0] ) );
  SDFFRQX2M \REG_reg[4][7]  ( .D(n133), .SI(\REG[4][6] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[4][7] ) );
  SDFFRQX2M \REG_reg[4][6]  ( .D(n132), .SI(\REG[4][5] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[4][6] ) );
  SDFFRQX2M \REG_reg[4][5]  ( .D(n131), .SI(\REG[4][4] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[4][5] ) );
  SDFFRQX2M \REG_reg[4][4]  ( .D(n130), .SI(\REG[4][3] ), .SE(test_se), .CK(
        n182), .RN(n174), .Q(\REG[4][4] ) );
  SDFFRQX2M \REG_reg[4][3]  ( .D(n129), .SI(\REG[4][2] ), .SE(test_se), .CK(
        n182), .RN(n175), .Q(\REG[4][3] ) );
  SDFFRQX2M \REG_reg[4][2]  ( .D(n128), .SI(\REG[4][1] ), .SE(test_se), .CK(
        n182), .RN(n175), .Q(\REG[4][2] ) );
  SDFFRQX2M \REG_reg[4][1]  ( .D(n127), .SI(\REG[4][0] ), .SE(test_se), .CK(
        n182), .RN(n175), .Q(\REG[4][1] ) );
  SDFFRQX2M \REG_reg[4][0]  ( .D(n126), .SI(\REG[3][7] ), .SE(test_se), .CK(
        n183), .RN(n175), .Q(\REG[4][0] ) );
  SDFFRQX2M \REG_reg[0][7]  ( .D(n101), .SI(\REG[0][6] ), .SE(test_se), .CK(
        n184), .RN(n177), .Q(\REG[0][7] ) );
  SDFFRQX2M \REG_reg[0][6]  ( .D(n100), .SI(\REG[0][5] ), .SE(test_se), .CK(
        n185), .RN(n177), .Q(\REG[0][6] ) );
  SDFFRQX2M \REG_reg[0][5]  ( .D(n99), .SI(\REG[0][4] ), .SE(test_se), .CK(
        n185), .RN(n177), .Q(\REG[0][5] ) );
  SDFFRQX2M \REG_reg[0][4]  ( .D(n98), .SI(\REG[0][3] ), .SE(test_se), .CK(
        n185), .RN(n177), .Q(\REG[0][4] ) );
  SDFFRQX2M \REG_reg[0][3]  ( .D(n97), .SI(\REG[0][2] ), .SE(test_se), .CK(
        n185), .RN(n177), .Q(\REG[0][3] ) );
  SDFFRQX2M \REG_reg[0][2]  ( .D(n96), .SI(\REG[0][1] ), .SE(test_se), .CK(
        n185), .RN(n177), .Q(\REG[0][2] ) );
  SDFFRQX2M \REG_reg[0][1]  ( .D(n95), .SI(\REG[0][0] ), .SE(test_se), .CK(
        n185), .RN(n177), .Q(\REG[0][1] ) );
  SDFFRQX2M \REG_reg[0][0]  ( .D(n94), .SI(test_si), .SE(test_se), .CK(n185), 
        .RN(n177), .Q(\REG[0][0] ) );
  SDFFRQX2M \R_DATA_reg[5]  ( .D(N33), .SI(R_DATA[4]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[5]) );
  SDFFRQX2M \R_DATA_reg[1]  ( .D(N37), .SI(R_DATA[0]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[1]) );
  SDFFRQX2M \R_DATA_reg[4]  ( .D(N34), .SI(R_DATA[3]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[4]) );
  SDFFRQX2M \R_DATA_reg[0]  ( .D(N38), .SI(\REG[7][7] ), .SE(test_se), .CK(
        n180), .RN(n172), .Q(R_DATA[0]) );
  SDFFRQX2M \R_DATA_reg[3]  ( .D(N35), .SI(R_DATA[2]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[3]) );
  SDFFRQX2M \R_DATA_reg[2]  ( .D(N36), .SI(R_DATA[1]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[2]) );
  SDFFRQX2M \R_DATA_reg[6]  ( .D(N32), .SI(R_DATA[5]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[6]) );
  SDFFRQX2M \R_DATA_reg[7]  ( .D(N31), .SI(R_DATA[6]), .SE(test_se), .CK(n180), 
        .RN(n172), .Q(R_DATA[7]) );
  BUFX2M U75 ( .A(n83), .Y(n165) );
  BUFX2M U76 ( .A(n84), .Y(n169) );
  BUFX2M U77 ( .A(n88), .Y(n168) );
  BUFX2M U78 ( .A(n89), .Y(n167) );
  BUFX2M U79 ( .A(n90), .Y(n166) );
  BUFX2M U80 ( .A(n171), .Y(n177) );
  BUFX2M U81 ( .A(n171), .Y(n176) );
  BUFX2M U82 ( .A(n171), .Y(n175) );
  BUFX2M U83 ( .A(n170), .Y(n174) );
  BUFX2M U84 ( .A(n170), .Y(n173) );
  BUFX2M U85 ( .A(n170), .Y(n172) );
  BUFX2M U86 ( .A(n179), .Y(n184) );
  BUFX2M U87 ( .A(n179), .Y(n183) );
  BUFX2M U88 ( .A(n178), .Y(n182) );
  BUFX2M U89 ( .A(n178), .Y(n181) );
  BUFX2M U90 ( .A(n178), .Y(n180) );
  BUFX2M U91 ( .A(n179), .Y(n185) );
  NOR2BX2M U92 ( .AN(WINC), .B(W_FULL), .Y(n91) );
  BUFX2M U93 ( .A(W_CLK), .Y(n179) );
  BUFX2M U94 ( .A(W_RST), .Y(n171) );
  BUFX2M U95 ( .A(W_RST), .Y(n170) );
  BUFX2M U96 ( .A(W_CLK), .Y(n178) );
  NAND3X2M U97 ( .A(n186), .B(n187), .C(n85), .Y(n92) );
  NAND3X2M U98 ( .A(n186), .B(n187), .C(n87), .Y(n86) );
  NAND3X2M U99 ( .A(n85), .B(n187), .C(W_ADDRESS[0]), .Y(n93) );
  NOR2BX2M U100 ( .AN(n91), .B(W_ADDRESS[2]), .Y(n85) );
  INVX2M U101 ( .A(W_ADDRESS[1]), .Y(n187) );
  INVX2M U102 ( .A(W_ADDRESS[0]), .Y(n186) );
  OAI2BB2X1M U103 ( .B0(n195), .B1(n93), .A0N(\REG[1][0] ), .A1N(n93), .Y(n102) );
  OAI2BB2X1M U104 ( .B0(n194), .B1(n93), .A0N(\REG[1][1] ), .A1N(n93), .Y(n103) );
  OAI2BB2X1M U105 ( .B0(n193), .B1(n93), .A0N(\REG[1][2] ), .A1N(n93), .Y(n104) );
  OAI2BB2X1M U106 ( .B0(n192), .B1(n93), .A0N(\REG[1][3] ), .A1N(n93), .Y(n105) );
  OAI2BB2X1M U107 ( .B0(n191), .B1(n93), .A0N(\REG[1][4] ), .A1N(n93), .Y(n106) );
  OAI2BB2X1M U108 ( .B0(n190), .B1(n93), .A0N(\REG[1][5] ), .A1N(n93), .Y(n107) );
  OAI2BB2X1M U109 ( .B0(n189), .B1(n93), .A0N(\REG[1][6] ), .A1N(n93), .Y(n108) );
  OAI2BB2X1M U110 ( .B0(n188), .B1(n93), .A0N(\REG[1][7] ), .A1N(n93), .Y(n109) );
  OAI2BB2X1M U111 ( .B0(n195), .B1(n92), .A0N(\REG[0][0] ), .A1N(n92), .Y(n94)
         );
  OAI2BB2X1M U112 ( .B0(n194), .B1(n92), .A0N(\REG[0][1] ), .A1N(n92), .Y(n95)
         );
  OAI2BB2X1M U113 ( .B0(n193), .B1(n92), .A0N(\REG[0][2] ), .A1N(n92), .Y(n96)
         );
  OAI2BB2X1M U114 ( .B0(n192), .B1(n92), .A0N(\REG[0][3] ), .A1N(n92), .Y(n97)
         );
  OAI2BB2X1M U115 ( .B0(n191), .B1(n92), .A0N(\REG[0][4] ), .A1N(n92), .Y(n98)
         );
  OAI2BB2X1M U116 ( .B0(n190), .B1(n92), .A0N(\REG[0][5] ), .A1N(n92), .Y(n99)
         );
  OAI2BB2X1M U117 ( .B0(n189), .B1(n92), .A0N(\REG[0][6] ), .A1N(n92), .Y(n100) );
  OAI2BB2X1M U118 ( .B0(n188), .B1(n92), .A0N(\REG[0][7] ), .A1N(n92), .Y(n101) );
  OAI2BB2X1M U119 ( .B0(n195), .B1(n86), .A0N(\REG[4][0] ), .A1N(n86), .Y(n126) );
  OAI2BB2X1M U120 ( .B0(n194), .B1(n86), .A0N(\REG[4][1] ), .A1N(n86), .Y(n127) );
  OAI2BB2X1M U121 ( .B0(n193), .B1(n86), .A0N(\REG[4][2] ), .A1N(n86), .Y(n128) );
  OAI2BB2X1M U122 ( .B0(n192), .B1(n86), .A0N(\REG[4][3] ), .A1N(n86), .Y(n129) );
  OAI2BB2X1M U123 ( .B0(n191), .B1(n86), .A0N(\REG[4][4] ), .A1N(n86), .Y(n130) );
  OAI2BB2X1M U124 ( .B0(n190), .B1(n86), .A0N(\REG[4][5] ), .A1N(n86), .Y(n131) );
  OAI2BB2X1M U125 ( .B0(n189), .B1(n86), .A0N(\REG[4][6] ), .A1N(n86), .Y(n132) );
  OAI2BB2X1M U126 ( .B0(n188), .B1(n86), .A0N(\REG[4][7] ), .A1N(n86), .Y(n133) );
  BUFX4M U127 ( .A(N9), .Y(n164) );
  INVX2M U128 ( .A(W_DATA[0]), .Y(n195) );
  INVX2M U129 ( .A(W_DATA[1]), .Y(n194) );
  INVX2M U130 ( .A(W_DATA[2]), .Y(n193) );
  INVX2M U131 ( .A(W_DATA[3]), .Y(n192) );
  INVX2M U132 ( .A(W_DATA[4]), .Y(n191) );
  INVX2M U133 ( .A(W_DATA[5]), .Y(n190) );
  INVX2M U134 ( .A(W_DATA[6]), .Y(n189) );
  INVX2M U135 ( .A(W_DATA[7]), .Y(n188) );
  OAI2BB2X1M U136 ( .B0(n190), .B1(n169), .A0N(\REG[3][5] ), .A1N(n169), .Y(
        n123) );
  OAI2BB2X1M U137 ( .B0(n189), .B1(n169), .A0N(\REG[3][6] ), .A1N(n169), .Y(
        n124) );
  OAI2BB2X1M U138 ( .B0(n188), .B1(n169), .A0N(\REG[3][7] ), .A1N(n169), .Y(
        n125) );
  OAI2BB2X1M U139 ( .B0(n195), .B1(n168), .A0N(\REG[5][0] ), .A1N(n168), .Y(
        n134) );
  OAI2BB2X1M U140 ( .B0(n194), .B1(n168), .A0N(\REG[5][1] ), .A1N(n168), .Y(
        n135) );
  OAI2BB2X1M U141 ( .B0(n193), .B1(n168), .A0N(\REG[5][2] ), .A1N(n168), .Y(
        n136) );
  OAI2BB2X1M U142 ( .B0(n192), .B1(n168), .A0N(\REG[5][3] ), .A1N(n168), .Y(
        n137) );
  OAI2BB2X1M U143 ( .B0(n191), .B1(n168), .A0N(\REG[5][4] ), .A1N(n168), .Y(
        n138) );
  OAI2BB2X1M U144 ( .B0(n190), .B1(n168), .A0N(\REG[5][5] ), .A1N(n168), .Y(
        n139) );
  OAI2BB2X1M U145 ( .B0(n189), .B1(n168), .A0N(\REG[5][6] ), .A1N(n168), .Y(
        n140) );
  OAI2BB2X1M U146 ( .B0(n188), .B1(n168), .A0N(\REG[5][7] ), .A1N(n168), .Y(
        n141) );
  OAI2BB2X1M U147 ( .B0(n195), .B1(n167), .A0N(\REG[6][0] ), .A1N(n167), .Y(
        n142) );
  OAI2BB2X1M U148 ( .B0(n194), .B1(n167), .A0N(\REG[6][1] ), .A1N(n167), .Y(
        n143) );
  OAI2BB2X1M U149 ( .B0(n193), .B1(n167), .A0N(\REG[6][2] ), .A1N(n167), .Y(
        n144) );
  OAI2BB2X1M U150 ( .B0(n192), .B1(n167), .A0N(\REG[6][3] ), .A1N(n167), .Y(
        n145) );
  OAI2BB2X1M U151 ( .B0(n191), .B1(n167), .A0N(\REG[6][4] ), .A1N(n167), .Y(
        n146) );
  OAI2BB2X1M U152 ( .B0(n190), .B1(n167), .A0N(\REG[6][5] ), .A1N(n167), .Y(
        n147) );
  OAI2BB2X1M U153 ( .B0(n189), .B1(n167), .A0N(\REG[6][6] ), .A1N(n167), .Y(
        n148) );
  OAI2BB2X1M U154 ( .B0(n188), .B1(n167), .A0N(\REG[6][7] ), .A1N(n167), .Y(
        n149) );
  OAI2BB2X1M U155 ( .B0(n195), .B1(n166), .A0N(\REG[7][0] ), .A1N(n166), .Y(
        n150) );
  OAI2BB2X1M U156 ( .B0(n194), .B1(n166), .A0N(\REG[7][1] ), .A1N(n166), .Y(
        n151) );
  OAI2BB2X1M U157 ( .B0(n193), .B1(n166), .A0N(\REG[7][2] ), .A1N(n166), .Y(
        n152) );
  OAI2BB2X1M U158 ( .B0(n192), .B1(n166), .A0N(\REG[7][3] ), .A1N(n166), .Y(
        n153) );
  OAI2BB2X1M U159 ( .B0(n191), .B1(n166), .A0N(\REG[7][4] ), .A1N(n166), .Y(
        n154) );
  OAI2BB2X1M U160 ( .B0(n190), .B1(n166), .A0N(\REG[7][5] ), .A1N(n166), .Y(
        n155) );
  OAI2BB2X1M U161 ( .B0(n189), .B1(n166), .A0N(\REG[7][6] ), .A1N(n166), .Y(
        n156) );
  OAI2BB2X1M U162 ( .B0(n188), .B1(n166), .A0N(\REG[7][7] ), .A1N(n166), .Y(
        n157) );
  OAI2BB2X1M U163 ( .B0(n165), .B1(n195), .A0N(\REG[2][0] ), .A1N(n165), .Y(
        n110) );
  OAI2BB2X1M U164 ( .B0(n165), .B1(n194), .A0N(\REG[2][1] ), .A1N(n165), .Y(
        n111) );
  OAI2BB2X1M U165 ( .B0(n165), .B1(n193), .A0N(\REG[2][2] ), .A1N(n165), .Y(
        n112) );
  OAI2BB2X1M U166 ( .B0(n165), .B1(n192), .A0N(\REG[2][3] ), .A1N(n165), .Y(
        n113) );
  OAI2BB2X1M U167 ( .B0(n165), .B1(n191), .A0N(\REG[2][4] ), .A1N(n165), .Y(
        n114) );
  OAI2BB2X1M U168 ( .B0(n165), .B1(n190), .A0N(\REG[2][5] ), .A1N(n165), .Y(
        n115) );
  OAI2BB2X1M U169 ( .B0(n165), .B1(n189), .A0N(\REG[2][6] ), .A1N(n165), .Y(
        n116) );
  OAI2BB2X1M U170 ( .B0(n165), .B1(n188), .A0N(\REG[2][7] ), .A1N(n165), .Y(
        n117) );
  OAI2BB2X1M U171 ( .B0(n169), .B1(n195), .A0N(\REG[3][0] ), .A1N(n169), .Y(
        n118) );
  OAI2BB2X1M U172 ( .B0(n169), .B1(n194), .A0N(\REG[3][1] ), .A1N(n169), .Y(
        n119) );
  OAI2BB2X1M U173 ( .B0(n169), .B1(n193), .A0N(\REG[3][2] ), .A1N(n169), .Y(
        n120) );
  OAI2BB2X1M U174 ( .B0(n169), .B1(n192), .A0N(\REG[3][3] ), .A1N(n169), .Y(
        n121) );
  OAI2BB2X1M U175 ( .B0(n169), .B1(n191), .A0N(\REG[3][4] ), .A1N(n169), .Y(
        n122) );
  AND2X2M U176 ( .A(W_ADDRESS[2]), .B(n91), .Y(n87) );
  NAND3X2M U177 ( .A(W_ADDRESS[0]), .B(W_ADDRESS[1]), .C(n87), .Y(n90) );
  NAND3X2M U178 ( .A(W_ADDRESS[1]), .B(n186), .C(n87), .Y(n89) );
  NAND3X2M U179 ( .A(W_ADDRESS[0]), .B(n187), .C(n87), .Y(n88) );
  NAND3X2M U180 ( .A(W_ADDRESS[1]), .B(n85), .C(W_ADDRESS[0]), .Y(n84) );
  NAND3X2M U181 ( .A(n85), .B(n186), .C(W_ADDRESS[1]), .Y(n83) );
  MX2X2M U182 ( .A(n74), .B(n73), .S0(N11), .Y(N38) );
  MX4X1M U183 ( .A(\REG[4][0] ), .B(\REG[5][0] ), .C(\REG[6][0] ), .D(
        \REG[7][0] ), .S0(n164), .S1(N10), .Y(n73) );
  MX4X1M U184 ( .A(\REG[0][0] ), .B(\REG[1][0] ), .C(\REG[2][0] ), .D(
        \REG[3][0] ), .S0(n164), .S1(N10), .Y(n74) );
  MX2X2M U185 ( .A(n76), .B(n75), .S0(N11), .Y(N37) );
  MX4X1M U186 ( .A(\REG[4][1] ), .B(\REG[5][1] ), .C(\REG[6][1] ), .D(
        \REG[7][1] ), .S0(n164), .S1(N10), .Y(n75) );
  MX4X1M U187 ( .A(\REG[0][1] ), .B(\REG[1][1] ), .C(\REG[2][1] ), .D(
        \REG[3][1] ), .S0(n164), .S1(N10), .Y(n76) );
  MX2X2M U188 ( .A(n78), .B(n77), .S0(N11), .Y(N36) );
  MX4X1M U189 ( .A(\REG[4][2] ), .B(\REG[5][2] ), .C(\REG[6][2] ), .D(
        \REG[7][2] ), .S0(n164), .S1(N10), .Y(n77) );
  MX4X1M U190 ( .A(\REG[0][2] ), .B(\REG[1][2] ), .C(\REG[2][2] ), .D(
        \REG[3][2] ), .S0(n164), .S1(N10), .Y(n78) );
  MX2X2M U191 ( .A(n80), .B(n79), .S0(N11), .Y(N35) );
  MX4X1M U192 ( .A(\REG[4][3] ), .B(\REG[5][3] ), .C(\REG[6][3] ), .D(
        \REG[7][3] ), .S0(n164), .S1(N10), .Y(n79) );
  MX4X1M U193 ( .A(\REG[0][3] ), .B(\REG[1][3] ), .C(\REG[2][3] ), .D(
        \REG[3][3] ), .S0(n164), .S1(N10), .Y(n80) );
  MX2X2M U194 ( .A(n82), .B(n81), .S0(N11), .Y(N34) );
  MX4X1M U195 ( .A(\REG[4][4] ), .B(\REG[5][4] ), .C(\REG[6][4] ), .D(
        \REG[7][4] ), .S0(n164), .S1(N10), .Y(n81) );
  MX4X1M U196 ( .A(\REG[0][4] ), .B(\REG[1][4] ), .C(\REG[2][4] ), .D(
        \REG[3][4] ), .S0(n164), .S1(N10), .Y(n82) );
  MX2X2M U197 ( .A(n159), .B(n158), .S0(N11), .Y(N33) );
  MX4X1M U198 ( .A(\REG[4][5] ), .B(\REG[5][5] ), .C(\REG[6][5] ), .D(
        \REG[7][5] ), .S0(n164), .S1(N10), .Y(n158) );
  MX4X1M U199 ( .A(\REG[0][5] ), .B(\REG[1][5] ), .C(\REG[2][5] ), .D(
        \REG[3][5] ), .S0(n164), .S1(N10), .Y(n159) );
  MX2X2M U200 ( .A(n161), .B(n160), .S0(N11), .Y(N32) );
  MX4X1M U201 ( .A(\REG[4][6] ), .B(\REG[5][6] ), .C(\REG[6][6] ), .D(
        \REG[7][6] ), .S0(n164), .S1(N10), .Y(n160) );
  MX4X1M U202 ( .A(\REG[0][6] ), .B(\REG[1][6] ), .C(\REG[2][6] ), .D(
        \REG[3][6] ), .S0(n164), .S1(N10), .Y(n161) );
  MX2X2M U203 ( .A(n163), .B(n162), .S0(N11), .Y(N31) );
  MX4X1M U204 ( .A(\REG[4][7] ), .B(\REG[5][7] ), .C(\REG[6][7] ), .D(
        \REG[7][7] ), .S0(n164), .S1(N10), .Y(n162) );
  MX4X1M U205 ( .A(\REG[0][7] ), .B(\REG[1][7] ), .C(\REG[2][7] ), .D(
        \REG[3][7] ), .S0(n164), .S1(N10), .Y(n163) );
endmodule


module FIFO_WR_ADDRESS_BITS3_test_1 ( W_CLK, W_RST, WINC, RINC, WQ2_RPTR, 
        W_FULL, W_ADDRESS, W_PTR, test_si, test_se );
  input [3:0] WQ2_RPTR;
  output [2:0] W_ADDRESS;
  output [3:0] W_PTR;
  input W_CLK, W_RST, WINC, RINC, test_si, test_se;
  output W_FULL;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n12, n14, n16, n18;

  SDFFRQX2M \add_ptr_reg[3]  ( .D(n18), .SI(W_ADDRESS[2]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_PTR[3]) );
  SDFFRQX2M \add_ptr_reg[2]  ( .D(n14), .SI(W_ADDRESS[1]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_ADDRESS[2]) );
  SDFFRQX2M \add_ptr_reg[0]  ( .D(n16), .SI(test_si), .SE(test_se), .CK(W_CLK), 
        .RN(W_RST), .Q(W_ADDRESS[0]) );
  SDFFRQX2M \add_ptr_reg[1]  ( .D(n12), .SI(W_ADDRESS[0]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_ADDRESS[1]) );
  NAND2X2M U3 ( .A(WINC), .B(n4), .Y(n3) );
  INVX2M U4 ( .A(n4), .Y(W_FULL) );
  NOR2BX2M U5 ( .AN(W_ADDRESS[0]), .B(n3), .Y(n1) );
  XNOR2X2M U6 ( .A(W_PTR[0]), .B(WQ2_RPTR[0]), .Y(n6) );
  XNOR2X2M U7 ( .A(W_PTR[3]), .B(n5), .Y(n18) );
  NAND3X2M U8 ( .A(W_ADDRESS[1]), .B(W_ADDRESS[2]), .C(n1), .Y(n5) );
  XNOR2X2M U9 ( .A(W_ADDRESS[0]), .B(n3), .Y(n16) );
  XNOR2X2M U10 ( .A(W_ADDRESS[2]), .B(n2), .Y(n14) );
  NAND2X2M U11 ( .A(n1), .B(W_ADDRESS[1]), .Y(n2) );
  NAND4X2M U12 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n4) );
  CLKXOR2X2M U13 ( .A(WQ2_RPTR[2]), .B(W_PTR[2]), .Y(n8) );
  CLKXOR2X2M U14 ( .A(W_PTR[3]), .B(WQ2_RPTR[3]), .Y(n9) );
  XNOR2X2M U15 ( .A(W_PTR[1]), .B(WQ2_RPTR[1]), .Y(n7) );
  CLKXOR2X2M U16 ( .A(W_PTR[3]), .B(W_ADDRESS[2]), .Y(W_PTR[2]) );
  CLKXOR2X2M U17 ( .A(W_ADDRESS[1]), .B(W_ADDRESS[2]), .Y(W_PTR[1]) );
  CLKXOR2X2M U18 ( .A(W_ADDRESS[0]), .B(W_ADDRESS[1]), .Y(W_PTR[0]) );
  CLKXOR2X2M U19 ( .A(W_ADDRESS[1]), .B(n1), .Y(n12) );
endmodule


module FIFO_RD_ADDRESS_BITS3_test_1 ( R_CLK, R_RST, RINC, RQ2_WPTR, R_EMPTY, 
        R_ADDRESS, R_PTR, test_si, test_se );
  input [3:0] RQ2_WPTR;
  output [2:0] R_ADDRESS;
  output [3:0] R_PTR;
  input R_CLK, R_RST, RINC, test_si, test_se;
  output R_EMPTY;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;

  SDFFRX1M \add_ptrr_reg[0]  ( .D(n19), .SI(test_si), .SE(test_se), .CK(R_CLK), 
        .RN(R_RST), .Q(R_ADDRESS[0]), .QN(n6) );
  SDFFRQX2M \add_ptrr_reg[3]  ( .D(n16), .SI(R_ADDRESS[2]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_PTR[3]) );
  SDFFRQX2M \add_ptrr_reg[2]  ( .D(n17), .SI(R_ADDRESS[1]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_ADDRESS[2]) );
  SDFFRQX2M \add_ptrr_reg[1]  ( .D(n18), .SI(R_ADDRESS[0]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_ADDRESS[1]) );
  INVX2M U7 ( .A(n11), .Y(R_EMPTY) );
  XNOR2X2M U8 ( .A(R_PTR[1]), .B(RQ2_WPTR[1]), .Y(n12) );
  XNOR2X2M U9 ( .A(n6), .B(R_ADDRESS[1]), .Y(R_PTR[0]) );
  NOR2X2M U10 ( .A(n10), .B(n6), .Y(n9) );
  XNOR2X2M U11 ( .A(R_ADDRESS[2]), .B(n8), .Y(n17) );
  XNOR2X2M U12 ( .A(R_PTR[3]), .B(n7), .Y(n16) );
  NAND2BX2M U13 ( .AN(n8), .B(R_ADDRESS[2]), .Y(n7) );
  NAND4X2M U14 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n11) );
  XNOR2X2M U15 ( .A(R_PTR[3]), .B(RQ2_WPTR[3]), .Y(n14) );
  XNOR2X2M U16 ( .A(R_PTR[2]), .B(RQ2_WPTR[2]), .Y(n15) );
  XNOR2X2M U17 ( .A(R_PTR[0]), .B(RQ2_WPTR[0]), .Y(n13) );
  NAND2X2M U18 ( .A(n9), .B(R_ADDRESS[1]), .Y(n8) );
  NAND2X2M U19 ( .A(RINC), .B(n11), .Y(n10) );
  CLKXOR2X2M U20 ( .A(R_ADDRESS[1]), .B(R_ADDRESS[2]), .Y(R_PTR[1]) );
  CLKXOR2X2M U21 ( .A(R_PTR[3]), .B(R_ADDRESS[2]), .Y(R_PTR[2]) );
  CLKXOR2X2M U22 ( .A(R_ADDRESS[1]), .B(n9), .Y(n18) );
  CLKXOR2X2M U23 ( .A(n6), .B(n10), .Y(n19) );
endmodule


module DF_SYNC_ADDRESS_BITS3_test_1 ( W_CLK, W_RST, R_CLK, R_RST, W_PTR, R_PTR, 
        RQ2_WPTR, WQ2_RPTR, test_si, test_so, test_se );
  input [3:0] W_PTR;
  input [3:0] R_PTR;
  output [3:0] RQ2_WPTR;
  output [3:0] WQ2_RPTR;
  input W_CLK, W_RST, R_CLK, R_RST, test_si, test_se;
  output test_so;

  wire   [3:0] W_SYNC;
  wire   [3:0] R_SYNC;
  assign test_so = W_SYNC[3];

  SDFFRQX2M \WQ2_RPTR_reg[1]  ( .D(W_SYNC[1]), .SI(WQ2_RPTR[0]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(WQ2_RPTR[1]) );
  SDFFRQX2M \WQ2_RPTR_reg[0]  ( .D(W_SYNC[0]), .SI(R_SYNC[3]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(WQ2_RPTR[0]) );
  SDFFRQX2M \RQ2_WPTR_reg[3]  ( .D(R_SYNC[3]), .SI(RQ2_WPTR[2]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(RQ2_WPTR[3]) );
  SDFFRQX2M \RQ2_WPTR_reg[2]  ( .D(R_SYNC[2]), .SI(RQ2_WPTR[1]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(RQ2_WPTR[2]) );
  SDFFRQX2M \RQ2_WPTR_reg[1]  ( .D(R_SYNC[1]), .SI(RQ2_WPTR[0]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(RQ2_WPTR[1]) );
  SDFFRQX2M \RQ2_WPTR_reg[0]  ( .D(R_SYNC[0]), .SI(test_si), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(RQ2_WPTR[0]) );
  SDFFRQX2M \WQ2_RPTR_reg[3]  ( .D(W_SYNC[3]), .SI(WQ2_RPTR[2]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(WQ2_RPTR[3]) );
  SDFFRQX2M \WQ2_RPTR_reg[2]  ( .D(W_SYNC[2]), .SI(WQ2_RPTR[1]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(WQ2_RPTR[2]) );
  SDFFRQX2M \W_SYNC_reg[2]  ( .D(R_PTR[2]), .SI(W_SYNC[1]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_SYNC[2]) );
  SDFFRQX2M \W_SYNC_reg[1]  ( .D(R_PTR[1]), .SI(W_SYNC[0]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_SYNC[1]) );
  SDFFRQX2M \W_SYNC_reg[0]  ( .D(R_PTR[0]), .SI(WQ2_RPTR[3]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(W_SYNC[0]) );
  SDFFRQX2M \R_SYNC_reg[3]  ( .D(W_PTR[3]), .SI(R_SYNC[2]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_SYNC[3]) );
  SDFFRQX2M \R_SYNC_reg[2]  ( .D(W_PTR[2]), .SI(R_SYNC[1]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_SYNC[2]) );
  SDFFRQX2M \R_SYNC_reg[1]  ( .D(W_PTR[1]), .SI(R_SYNC[0]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_SYNC[1]) );
  SDFFRQX2M \R_SYNC_reg[0]  ( .D(W_PTR[0]), .SI(RQ2_WPTR[3]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(R_SYNC[0]) );
  SDFFRQX2M \W_SYNC_reg[3]  ( .D(R_PTR[3]), .SI(W_SYNC[2]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_SYNC[3]) );
endmodule


module FIFO_TOP_DATA_WIDTH_TOP8_FIFO_DEPTH_TOP8_ADDRESS_BITS_TOP3_test_1 ( 
        W_CLK, W_RST, R_CLK, R_RST, WINC, RINC, W_DATA, W_FULL, R_EMPTY, 
        R_DATA, test_si, test_so, test_se );
  input [7:0] W_DATA;
  output [7:0] R_DATA;
  input W_CLK, W_RST, R_CLK, R_RST, WINC, RINC, test_si, test_se;
  output W_FULL, R_EMPTY, test_so;
  wire   n1, n2, n3, n4, n5;
  wire   [2:0] W_ADDRESS;
  wire   [2:0] R_ADDRESS;
  wire   [3:0] WQ2_RPTR;
  wire   [3:0] W_PTR;
  wire   [3:0] RQ2_WPTR;
  wire   [3:0] R_PTR;
  assign test_so = W_PTR[3];

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(W_CLK), .Y(n4) );
  FIFO_BUFFER_DATA_WIDTH8_FIFO_DEPTH8_ADDRESS_BITS3_test_1 FIFO_BUFFER ( 
        .W_CLK(n3), .W_RST(n1), .WINC(WINC), .W_FULL(W_FULL), .W_DATA(W_DATA), 
        .W_ADDRESS(W_ADDRESS), .R_ADDRESS(R_ADDRESS), .R_DATA(R_DATA), 
        .test_si(n5), .test_se(test_se) );
  FIFO_WR_ADDRESS_BITS3_test_1 FIFO_WR ( .W_CLK(n3), .W_RST(n1), .WINC(WINC), 
        .RINC(RINC), .WQ2_RPTR(WQ2_RPTR), .W_FULL(W_FULL), .W_ADDRESS(
        W_ADDRESS), .W_PTR(W_PTR), .test_si(R_PTR[3]), .test_se(test_se) );
  FIFO_RD_ADDRESS_BITS3_test_1 FIFO_RD ( .R_CLK(R_CLK), .R_RST(R_RST), .RINC(
        RINC), .RQ2_WPTR(RQ2_WPTR), .R_EMPTY(R_EMPTY), .R_ADDRESS(R_ADDRESS), 
        .R_PTR(R_PTR), .test_si(R_DATA[7]), .test_se(test_se) );
  DF_SYNC_ADDRESS_BITS3_test_1 DF_SYNC ( .W_CLK(n3), .W_RST(n1), .R_CLK(R_CLK), 
        .R_RST(R_RST), .W_PTR(W_PTR), .R_PTR(R_PTR), .RQ2_WPTR(RQ2_WPTR), 
        .WQ2_RPTR(WQ2_RPTR), .test_si(test_si), .test_so(n5), .test_se(test_se) );
endmodule


module SYSTEM_TOP ( REF_CLK, UART_CLK, RST, test_mode, scan_clock, scan_reset, 
        SI, SE, RX_IN, Tx_OUT, Parity_error, Stop_error, SO );
  input REF_CLK, UART_CLK, RST, test_mode, scan_clock, scan_reset, SI, SE,
         RX_IN;
  output Tx_OUT, Parity_error, Stop_error, SO;
  wire   Stop_error, scanclkuart, TX_CLK, scanclkuarttx, RX_CLK, scanclkuartrx,
         scanclkref, scanrst, RST_SYNC_1, scanrst1, RST_SYNC_2, scanrst2,
         _0_net_, ALU_CLK, CLK_GATE_EN, PULSE_GEN, RINC, DATA_VALID, pulse_gen,
         R_EMPTY, W_FULL, R_DATA_VALID, ALU_OUT_VALID, WINC, W_REG_EN,
         R_REG_EN, ALU_EN, n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] REG3;
  wire   [7:0] P_DATA;
  wire   [7:0] SYNC_BUS;
  wire   [7:0] R_DATA;
  wire   [7:0] R_REG_DATA;
  wire   [15:0] ALU_OUT;
  wire   [7:0] W_DATA;
  wire   [7:0] W_REG_DATA;
  wire   [3:0] REG_ADDRESS;
  wire   [3:0] ALU_FUNC;
  wire   [7:0] REG0;
  wire   [7:0] REG1;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign SO = Stop_error;

  INVX2M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(scanrst2), .Y(n2) );
  INVX4M U4 ( .A(n4), .Y(n3) );
  INVX2M U5 ( .A(scanrst1), .Y(n4) );
  OR2X2M U6 ( .A(CLK_GATE_EN), .B(test_mode), .Y(_0_net_) );
  DFT_MUX_0 DFT_MUX_UART ( .in_0(UART_CLK), .in_1(scan_clock), .sel(test_mode), 
        .out(scanclkuart) );
  DFT_MUX_6 DFT_MUX_UART_TX ( .in_0(TX_CLK), .in_1(scan_clock), .sel(test_mode), .out(scanclkuarttx) );
  DFT_MUX_5 DFT_MUX_UART_RX ( .in_0(RX_CLK), .in_1(scan_clock), .sel(test_mode), .out(scanclkuartrx) );
  DFT_MUX_4 DFT_MUX_REF ( .in_0(REF_CLK), .in_1(scan_clock), .sel(test_mode), 
        .out(scanclkref) );
  DFT_MUX_3 DFT_RST ( .in_0(RST), .in_1(scan_reset), .sel(test_mode), .out(
        scanrst) );
  DFT_MUX_2 DFT_RST_1 ( .in_0(RST_SYNC_1), .in_1(scan_reset), .sel(test_mode), 
        .out(scanrst1) );
  DFT_MUX_1 DFT_RST_2 ( .in_0(RST_SYNC_2), .in_1(scan_reset), .sel(test_mode), 
        .out(scanrst2) );
  RESET_SYNC_NUM_STAGES2_test_0 RESET_SYNC_1 ( .CLK(scanclkuart), .RST(scanrst), .RST_SYNC(RST_SYNC_1), .test_si(RINC), .test_so(n9), .test_se(SE) );
  RESET_SYNC_NUM_STAGES2_test_1 RESET_SYNC_2 ( .CLK(scanclkref), .RST(scanrst), 
        .RST_SYNC(RST_SYNC_2), .test_si(n9), .test_so(n8), .test_se(SE) );
  PRESCALE_BLOCK PRESCALE_BLOCK ( .PRESCALE(UART_CONFIG[7:2]), .DIV_RATIO({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO[3:0]}) );
  CLK_DIV_test_1 CLK_DIV_TX ( .RST_EN(n3), .I_REF_CLK(scanclkuart), .CLK_EN(
        1'b1), .DIV_RATIO(REG3), .O_DIV_CLK(TX_CLK), .test_si(n13), .test_so(
        n12), .test_se(SE) );
  CLK_DIV_test_0 CLK_DIV_RX ( .RST_EN(n3), .I_REF_CLK(scanclkuart), .CLK_EN(
        1'b1), .DIV_RATIO({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO[3:0]}), 
        .O_DIV_CLK(RX_CLK), .test_si(ALU_OUT[15]), .test_so(n13), .test_se(SE)
         );
  CLOCK_GATING CLOCK_GATING ( .REF_CLK(scanclkref), .CLK_GATE_EN(_0_net_), 
        .ALU_CLK(ALU_CLK) );
  PULSE_GENRATOR_BLOCK_test_1 PULSE_GENRATOR_BLOCK ( .TX_CLK(scanclkuarttx), 
        .PULSE_GEN(PULSE_GEN), .RINC(RINC), .test_si(n10), .test_se(SE) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 DATA_SYNC ( .CLK(scanclkref), .RST(
        n1), .EN(DATA_VALID), .UNSYNC_BUS(P_DATA), .enable_pulse(pulse_gen), 
        .SYNC_BUS(SYNC_BUS), .test_si(n12), .test_so(n11), .test_se(SE) );
  SYS_UART_TOP_DATA_WIDTH8_test_1 SYS_UART_TOP ( .TX_CLK(scanclkuarttx), 
        .RX_CLK(scanclkuartrx), .RST_SYNC_1(n3), .RX_IN(RX_IN), .R_EMPTY(
        R_EMPTY), .UART_CONFIG(UART_CONFIG), .R_DATA(R_DATA), .Tx_OUT(Tx_OUT), 
        .DATA_VALID(DATA_VALID), .Stop_error(Stop_error), .Parity_error(
        Parity_error), .PULSE_GEN(PULSE_GEN), .P_DATA(P_DATA), .test_si(n6), 
        .test_se(SE) );
  SYSTEM_CONTROL_DATA_WIDTH8_test_1 SYSTEM_CONTROL ( .REF_CLK(scanclkref), 
        .RST_SYNC_2(n1), .pulse_gen(pulse_gen), .W_FULL(W_FULL), 
        .R_DATA_VALID(R_DATA_VALID), .ALU_OUT_VALID(ALU_OUT_VALID), .SYNC_BUS(
        SYNC_BUS), .R_REG_DATA(R_REG_DATA), .ALU_OUT(ALU_OUT), .WINC(WINC), 
        .W_REG_EN(W_REG_EN), .R_REG_EN(R_REG_EN), .ALU_EN(ALU_EN), 
        .CLK_GATE_EN(CLK_GATE_EN), .W_DATA(W_DATA), .W_REG_DATA(W_REG_DATA), 
        .REG_ADDRESS(REG_ADDRESS), .ALU_FUNC(ALU_FUNC), .test_si(n7), 
        .test_so(n6), .test_se(SE) );
  Reg_file_DATA_WIDTH8_ADDRESS_BITS3_test_1 Reg_file ( .CLK(scanclkref), .RST(
        n1), .R_REG_EN(R_REG_EN), .W_REG_EN(W_REG_EN), .REG_ADDRESS(
        REG_ADDRESS), .W_REG_DATA(W_REG_DATA), .R_DATA_VALID(R_DATA_VALID), 
        .R_REG_DATA(R_REG_DATA), .REG0(REG0), .REG1(REG1), .REG2(UART_CONFIG), 
        .REG3(REG3), .test_si(n8), .test_so(n7), .test_se(SE) );
  ALU_RTL_DATA_WIDTH8_test_1 ALU_RTL ( .ALU_CLK(ALU_CLK), .RST_SYNC_2(n1), 
        .ALU_EN(ALU_EN), .REG0(REG0), .REG1(REG1), .ALU_FUNC(ALU_FUNC), 
        .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(ALU_OUT_VALID), .test_si(SI), 
        .test_se(SE) );
  FIFO_TOP_DATA_WIDTH_TOP8_FIFO_DEPTH_TOP8_ADDRESS_BITS_TOP3_test_1 FIFO_TOP ( 
        .W_CLK(scanclkref), .W_RST(n1), .R_CLK(scanclkuarttx), .R_RST(n3), 
        .WINC(WINC), .RINC(RINC), .W_DATA(W_DATA), .W_FULL(W_FULL), .R_EMPTY(
        R_EMPTY), .R_DATA(R_DATA), .test_si(n11), .test_so(n10), .test_se(SE)
         );
endmodule

