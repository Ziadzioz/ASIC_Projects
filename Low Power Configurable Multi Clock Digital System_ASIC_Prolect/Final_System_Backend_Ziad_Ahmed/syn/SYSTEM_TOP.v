/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Aug 15 20:34:20 2024
/////////////////////////////////////////////////////////////


module RESET_SYNC_NUM_STAGES2_0 ( CLK, RST, RST_SYNC );
  input CLK, RST;
  output RST_SYNC;

  wire   [1:0] SYNC_BUS;

  DFFRQX2M RST_SYNC_reg ( .D(SYNC_BUS[1]), .CK(CLK), .RN(RST), .Q(RST_SYNC) );
  DFFRQX2M \SYNC_BUS_reg[1]  ( .D(SYNC_BUS[0]), .CK(CLK), .RN(RST), .Q(
        SYNC_BUS[1]) );
  DFFRQX2M \SYNC_BUS_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(SYNC_BUS[0])
         );
endmodule


module RESET_SYNC_NUM_STAGES2_1 ( CLK, RST, RST_SYNC );
  input CLK, RST;
  output RST_SYNC;

  wire   [1:0] SYNC_BUS;

  DFFRQX2M RST_SYNC_reg ( .D(SYNC_BUS[1]), .CK(CLK), .RN(RST), .Q(RST_SYNC) );
  DFFRQX2M \SYNC_BUS_reg[1]  ( .D(SYNC_BUS[0]), .CK(CLK), .RN(RST), .Q(
        SYNC_BUS[1]) );
  DFFRQX2M \SYNC_BUS_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(SYNC_BUS[0])
         );
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
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_0 ( RST_EN, I_REF_CLK, CLK_EN, DIV_RATIO, O_DIV_CLK );
  input [7:0] DIV_RATIO;
  input RST_EN, I_REF_CLK, CLK_EN;
  output O_DIV_CLK;
  wire   out_clk, flag, N13, N14, N15, N16, N17, N18, N19, N20, N25, N26, N27,
         N28, N29, N30, N31, N32, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41;
  wire   [7:0] counter;

  CLK_DIV_0_DW01_inc_0 add_43 ( .A(counter), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25}) );
  CLK_DIV_0_DW01_inc_1 add_36 ( .A({1'b0, DIV_RATIO[7:1]}), .SUM({N20, N19, 
        N18, N17, N16, N15, N14, N13}) );
  DFFRQX2M out_clk_reg ( .D(n20), .CK(I_REF_CLK), .RN(RST_EN), .Q(out_clk) );
  DFFSQX2M flag_reg ( .D(n19), .CK(I_REF_CLK), .SN(RST_EN), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(n21), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[7]) );
  DFFRQX2M \counter_reg[0]  ( .D(n28), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[6]  ( .D(n22), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[5]  ( .D(n23), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n24), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(n25), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[2]  ( .D(n26), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n27), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[1]) );
  MX2X2M U3 ( .A(I_REF_CLK), .B(out_clk), .S0(n41), .Y(O_DIV_CLK) );
  NOR2BX2M U4 ( .AN(CLK_EN), .B(n8), .Y(n41) );
  AO2B2X1M U5 ( .B0(N25), .B1(n1), .A0(counter[0]), .A1N(n41), .Y(n28) );
  AO2B2X1M U7 ( .B0(N26), .B1(n1), .A0(counter[1]), .A1N(n41), .Y(n27) );
  AO2B2X1M U8 ( .B0(N27), .B1(n1), .A0(counter[2]), .A1N(n41), .Y(n26) );
  AO2B2X1M U9 ( .B0(N28), .B1(n1), .A0(counter[3]), .A1N(n41), .Y(n25) );
  AO2B2X1M U10 ( .B0(N29), .B1(n1), .A0(counter[4]), .A1N(n41), .Y(n24) );
  AO2B2X1M U11 ( .B0(N30), .B1(n1), .A0(counter[5]), .A1N(n41), .Y(n23) );
  AO2B2X1M U12 ( .B0(N31), .B1(n1), .A0(counter[6]), .A1N(n41), .Y(n22) );
  AO2B2X1M U13 ( .B0(N32), .B1(n1), .A0(counter[7]), .A1N(n41), .Y(n21) );
  AND3X1M U14 ( .A(n3), .B(n4), .C(n41), .Y(n1) );
  CLKXOR2X2M U15 ( .A(out_clk), .B(n5), .Y(n20) );
  AOI21BX1M U16 ( .A0(n4), .A1(n3), .B0N(n41), .Y(n5) );
  OR2X1M U17 ( .A(n6), .B(DIV_RATIO[0]), .Y(n3) );
  XNOR2X1M U18 ( .A(flag), .B(n7), .Y(n19) );
  NAND2BX1M U19 ( .AN(n4), .B(n41), .Y(n7) );
  NOR4BX1M U20 ( .AN(n9), .B(DIV_RATIO[2]), .C(DIV_RATIO[3]), .D(DIV_RATIO[1]), 
        .Y(n8) );
  NOR4X1M U21 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n9) );
  CLKNAND2X2M U22 ( .A(n10), .B(DIV_RATIO[0]), .Y(n4) );
  MXI2X1M U23 ( .A(n11), .B(n6), .S0(flag), .Y(n10) );
  CLKNAND2X2M U24 ( .A(n12), .B(n13), .Y(n6) );
  NOR4X1M U25 ( .A(counter[7]), .B(n14), .C(n15), .D(n16), .Y(n13) );
  CLKXOR2X2M U26 ( .A(counter[2]), .B(DIV_RATIO[3]), .Y(n16) );
  CLKXOR2X2M U27 ( .A(counter[1]), .B(DIV_RATIO[2]), .Y(n15) );
  CLKXOR2X2M U28 ( .A(counter[0]), .B(DIV_RATIO[1]), .Y(n14) );
  NOR4X1M U29 ( .A(n17), .B(n18), .C(n29), .D(n30), .Y(n12) );
  CLKXOR2X2M U30 ( .A(counter[6]), .B(DIV_RATIO[7]), .Y(n30) );
  CLKXOR2X2M U31 ( .A(counter[5]), .B(DIV_RATIO[6]), .Y(n29) );
  CLKXOR2X2M U32 ( .A(counter[4]), .B(DIV_RATIO[5]), .Y(n18) );
  CLKXOR2X2M U33 ( .A(counter[3]), .B(DIV_RATIO[4]), .Y(n17) );
  CLKNAND2X2M U34 ( .A(n31), .B(n32), .Y(n11) );
  NOR4X1M U35 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n32) );
  CLKXOR2X2M U36 ( .A(counter[3]), .B(N16), .Y(n36) );
  CLKXOR2X2M U37 ( .A(counter[2]), .B(N15), .Y(n35) );
  CLKXOR2X2M U38 ( .A(counter[1]), .B(N14), .Y(n34) );
  CLKXOR2X2M U39 ( .A(counter[0]), .B(N13), .Y(n33) );
  NOR4X1M U40 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n31) );
  CLKXOR2X2M U41 ( .A(counter[7]), .B(N20), .Y(n40) );
  CLKXOR2X2M U42 ( .A(counter[6]), .B(N19), .Y(n39) );
  CLKXOR2X2M U43 ( .A(counter[5]), .B(N18), .Y(n38) );
  CLKXOR2X2M U44 ( .A(counter[4]), .B(N17), .Y(n37) );
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


module CLK_DIV_1 ( RST_EN, I_REF_CLK, CLK_EN, DIV_RATIO, O_DIV_CLK );
  input [7:0] DIV_RATIO;
  input RST_EN, I_REF_CLK, CLK_EN;
  output O_DIV_CLK;
  wire   out_clk, flag, N13, N14, N15, N16, N17, N18, N19, N20, N25, N26, N27,
         N28, N29, N30, N31, N32, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51;
  wire   [7:0] counter;

  CLK_DIV_1_DW01_inc_0 add_43 ( .A(counter), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25}) );
  CLK_DIV_1_DW01_inc_1 add_36 ( .A({1'b0, DIV_RATIO[7:1]}), .SUM({N20, N19, 
        N18, N17, N16, N15, N14, N13}) );
  DFFRQX2M out_clk_reg ( .D(n50), .CK(I_REF_CLK), .RN(RST_EN), .Q(out_clk) );
  DFFSQX2M flag_reg ( .D(n51), .CK(I_REF_CLK), .SN(RST_EN), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(n49), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[7]) );
  DFFRQX2M \counter_reg[4]  ( .D(n46), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[0]  ( .D(n42), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[6]  ( .D(n48), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[5]  ( .D(n47), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[3]  ( .D(n45), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[2]  ( .D(n44), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n43), .CK(I_REF_CLK), .RN(RST_EN), .Q(
        counter[1]) );
  MX2X2M U3 ( .A(I_REF_CLK), .B(out_clk), .S0(n41), .Y(O_DIV_CLK) );
  NOR2BX2M U4 ( .AN(CLK_EN), .B(n8), .Y(n41) );
  AO2B2X1M U5 ( .B0(N25), .B1(n1), .A0(counter[0]), .A1N(n41), .Y(n42) );
  AO2B2X1M U7 ( .B0(N26), .B1(n1), .A0(counter[1]), .A1N(n41), .Y(n43) );
  AO2B2X1M U8 ( .B0(N27), .B1(n1), .A0(counter[2]), .A1N(n41), .Y(n44) );
  AO2B2X1M U9 ( .B0(N28), .B1(n1), .A0(counter[3]), .A1N(n41), .Y(n45) );
  AO2B2X1M U10 ( .B0(N29), .B1(n1), .A0(counter[4]), .A1N(n41), .Y(n46) );
  AO2B2X1M U11 ( .B0(N30), .B1(n1), .A0(counter[5]), .A1N(n41), .Y(n47) );
  AO2B2X1M U12 ( .B0(N31), .B1(n1), .A0(counter[6]), .A1N(n41), .Y(n48) );
  AO2B2X1M U13 ( .B0(N32), .B1(n1), .A0(counter[7]), .A1N(n41), .Y(n49) );
  AND3X1M U14 ( .A(n3), .B(n4), .C(n41), .Y(n1) );
  CLKXOR2X2M U15 ( .A(out_clk), .B(n5), .Y(n50) );
  AOI21BX1M U16 ( .A0(n4), .A1(n3), .B0N(n41), .Y(n5) );
  OR2X1M U17 ( .A(n6), .B(DIV_RATIO[0]), .Y(n3) );
  XNOR2X1M U18 ( .A(flag), .B(n7), .Y(n51) );
  NAND2BX1M U19 ( .AN(n4), .B(n41), .Y(n7) );
  NOR4BX1M U20 ( .AN(n9), .B(DIV_RATIO[2]), .C(DIV_RATIO[3]), .D(DIV_RATIO[1]), 
        .Y(n8) );
  NOR4X1M U21 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n9) );
  CLKNAND2X2M U22 ( .A(n10), .B(DIV_RATIO[0]), .Y(n4) );
  MXI2X1M U23 ( .A(n11), .B(n6), .S0(flag), .Y(n10) );
  CLKNAND2X2M U24 ( .A(n12), .B(n13), .Y(n6) );
  NOR4X1M U25 ( .A(counter[7]), .B(n14), .C(n15), .D(n16), .Y(n13) );
  CLKXOR2X2M U26 ( .A(counter[2]), .B(DIV_RATIO[3]), .Y(n16) );
  CLKXOR2X2M U27 ( .A(counter[1]), .B(DIV_RATIO[2]), .Y(n15) );
  CLKXOR2X2M U28 ( .A(counter[0]), .B(DIV_RATIO[1]), .Y(n14) );
  NOR4X1M U29 ( .A(n17), .B(n18), .C(n29), .D(n30), .Y(n12) );
  CLKXOR2X2M U30 ( .A(counter[6]), .B(DIV_RATIO[7]), .Y(n30) );
  CLKXOR2X2M U31 ( .A(counter[5]), .B(DIV_RATIO[6]), .Y(n29) );
  CLKXOR2X2M U32 ( .A(counter[4]), .B(DIV_RATIO[5]), .Y(n18) );
  CLKXOR2X2M U33 ( .A(counter[3]), .B(DIV_RATIO[4]), .Y(n17) );
  CLKNAND2X2M U34 ( .A(n31), .B(n32), .Y(n11) );
  NOR4X1M U35 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n32) );
  CLKXOR2X2M U36 ( .A(counter[3]), .B(N16), .Y(n36) );
  CLKXOR2X2M U37 ( .A(counter[2]), .B(N15), .Y(n35) );
  CLKXOR2X2M U38 ( .A(counter[1]), .B(N14), .Y(n34) );
  CLKXOR2X2M U39 ( .A(counter[0]), .B(N13), .Y(n33) );
  NOR4X1M U40 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n31) );
  CLKXOR2X2M U41 ( .A(counter[7]), .B(N20), .Y(n40) );
  CLKXOR2X2M U42 ( .A(counter[6]), .B(N19), .Y(n39) );
  CLKXOR2X2M U43 ( .A(counter[5]), .B(N18), .Y(n38) );
  CLKXOR2X2M U44 ( .A(counter[4]), .B(N17), .Y(n37) );
endmodule


module CLOCK_GATING ( REF_CLK, CLK_GATE_EN, ALU_CLK );
  input REF_CLK, CLK_GATE_EN;
  output ALU_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_GATE_EN), .CK(REF_CLK), .ECK(ALU_CLK) );
endmodule


module PULSE_GENRATOR_BLOCK ( TX_CLK, PULSE_GEN, RINC );
  input TX_CLK, PULSE_GEN;
  output RINC;
  wire   BEFORE_INV, AFTER_INV;

  DFFQX2M BEFORE_INV_reg ( .D(PULSE_GEN), .CK(TX_CLK), .Q(BEFORE_INV) );
  DFFQX2M RINC_reg ( .D(AFTER_INV), .CK(TX_CLK), .Q(RINC) );
  NOR2BX2M U3 ( .AN(PULSE_GEN), .B(BEFORE_INV), .Y(AFTER_INV) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, EN, UNSYNC_BUS, 
        enable_pulse, SYNC_BUS );
  input [7:0] UNSYNC_BUS;
  output [7:0] SYNC_BUS;
  input CLK, RST, EN;
  output enable_pulse;
  wire   pulse, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] bus_en_sync;

  EDFFHQX2M pulse_reg ( .D(bus_en_sync[1]), .E(RST), .CK(CLK), .Q(pulse) );
  EDFFHQX2M \bus_en_sync_reg[1]  ( .D(bus_en_sync[0]), .E(RST), .CK(CLK), .Q(
        bus_en_sync[1]) );
  DFFRQX2M \SYNC_BUS_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(SYNC_BUS[7]) );
  DFFRQX2M \SYNC_BUS_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(SYNC_BUS[4]) );
  DFFRQX2M \SYNC_BUS_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(SYNC_BUS[5]) );
  DFFRQX2M \SYNC_BUS_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(SYNC_BUS[6]) );
  DFFRQX2M \SYNC_BUS_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(SYNC_BUS[3]) );
  DFFRQX2M \SYNC_BUS_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(SYNC_BUS[1]) );
  DFFRQX2M \SYNC_BUS_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(SYNC_BUS[0]) );
  DFFRQX2M \SYNC_BUS_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(SYNC_BUS[2]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  EDFFHQX2M \bus_en_sync_reg[0]  ( .D(EN), .E(RST), .CK(CLK), .Q(
        bus_en_sync[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse), .B(bus_en_sync[1]), .Y(n1) );
  AO22X1M U5 ( .A0(UNSYNC_BUS[2]), .A1(n10), .B0(SYNC_BUS[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U6 ( .A0(UNSYNC_BUS[3]), .A1(n10), .B0(SYNC_BUS[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U7 ( .A0(UNSYNC_BUS[6]), .A1(n10), .B0(SYNC_BUS[6]), .B1(n1), .Y(n8)
         );
  AO22X1M U8 ( .A0(UNSYNC_BUS[0]), .A1(n10), .B0(SYNC_BUS[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U9 ( .A0(UNSYNC_BUS[1]), .A1(n10), .B0(SYNC_BUS[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U10 ( .A0(UNSYNC_BUS[4]), .A1(n10), .B0(SYNC_BUS[4]), .B1(n1), .Y(n6) );
  AO22X1M U11 ( .A0(UNSYNC_BUS[5]), .A1(n10), .B0(SYNC_BUS[5]), .B1(n1), .Y(n7) );
  AO22X1M U12 ( .A0(UNSYNC_BUS[7]), .A1(n10), .B0(SYNC_BUS[7]), .B1(n1), .Y(n9) );
endmodule


module FSM ( CLK, RST, RX_IN, Parity_error, Stop_error, Start_glitch, 
        Parity_en, bit_count, edge_count, Data_samp_en, edge_count_en, 
        desrializer_en, stop_en, start_en, parity_check_en, DATA_VALID );
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, RX_IN, Parity_error, Stop_error, Start_glitch, Parity_en;
  output Data_samp_en, edge_count_en, desrializer_en, stop_en, start_en,
         parity_check_en, DATA_VALID;
  wire   Data_samp_en, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign edge_count_en = Data_samp_en;

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(n23), .Y(n4) );
  NOR2X2M U4 ( .A(n34), .B(n33), .Y(DATA_VALID) );
  NAND2X2M U5 ( .A(n37), .B(n5), .Y(n19) );
  OAI21X2M U6 ( .A0(n14), .A1(n34), .B0(n11), .Y(desrializer_en) );
  INVX2M U7 ( .A(n17), .Y(n11) );
  NAND2X2M U8 ( .A(parity_check_en), .B(n19), .Y(n23) );
  INVX2M U9 ( .A(n26), .Y(n3) );
  NAND2X2M U10 ( .A(n36), .B(n2), .Y(n34) );
  OAI22X1M U11 ( .A0(Parity_en), .A1(n19), .B0(n13), .B1(n20), .Y(n36) );
  INVX2M U12 ( .A(Parity_en), .Y(n13) );
  AOI21X2M U13 ( .A0(current_state[2]), .A1(n21), .B0(RX_IN), .Y(n29) );
  NAND2X2M U14 ( .A(n27), .B(n28), .Y(next_state[0]) );
  AOI31X2M U15 ( .A0(n17), .A1(n3), .A2(Parity_en), .B0(n32), .Y(n27) );
  AOI31X2M U16 ( .A0(n9), .A1(n12), .A2(n29), .B0(n4), .Y(n28) );
  AOI21BX2M U17 ( .A0(n25), .A1(n8), .B0N(start_en), .Y(n32) );
  NOR3X2M U18 ( .A(n6), .B(bit_count[2]), .C(n8), .Y(n37) );
  NAND2X2M U19 ( .A(bit_count[0]), .B(n37), .Y(n20) );
  INVX2M U20 ( .A(bit_count[1]), .Y(n6) );
  INVX2M U21 ( .A(bit_count[3]), .Y(n8) );
  NOR3X2M U22 ( .A(current_state[0]), .B(current_state[2]), .C(n12), .Y(n17)
         );
  NOR2X2M U23 ( .A(current_state[0]), .B(current_state[1]), .Y(n35) );
  INVX2M U24 ( .A(bit_count[0]), .Y(n5) );
  NAND2X2M U25 ( .A(n35), .B(current_state[2]), .Y(n33) );
  INVX2M U26 ( .A(Stop_error), .Y(n2) );
  NAND3X2M U27 ( .A(n9), .B(n12), .C(current_state[2]), .Y(n14) );
  INVX2M U28 ( .A(current_state[1]), .Y(n12) );
  INVX2M U29 ( .A(current_state[0]), .Y(n9) );
  OAI21X2M U30 ( .A0(current_state[2]), .A1(n35), .B0(n33), .Y(Data_samp_en)
         );
  NOR3X2M U31 ( .A(n9), .B(current_state[2]), .C(n12), .Y(parity_check_en) );
  NOR3X2M U32 ( .A(bit_count[1]), .B(bit_count[2]), .C(n5), .Y(n25) );
  NOR3X2M U33 ( .A(current_state[1]), .B(current_state[2]), .C(n9), .Y(
        start_en) );
  OAI31X1M U34 ( .A0(n14), .A1(n1), .A2(n15), .B0(n16), .Y(next_state[2]) );
  AOI32X1M U35 ( .A0(n3), .A1(n13), .A2(n17), .B0(n18), .B1(parity_check_en), 
        .Y(n16) );
  AOI221XLM U36 ( .A0(Parity_en), .A1(n20), .B0(n19), .B1(n13), .C0(n2), .Y(
        n15) );
  INVX2M U37 ( .A(n21), .Y(n1) );
  NAND2X2M U38 ( .A(n30), .B(n2), .Y(n21) );
  OAI32X1M U39 ( .A0(n31), .A1(n13), .A2(n7), .B0(Parity_en), .B1(n20), .Y(n30) );
  INVX2M U40 ( .A(bit_count[2]), .Y(n7) );
  NAND3X2M U41 ( .A(n5), .B(n6), .C(bit_count[3]), .Y(n31) );
  OAI211X2M U42 ( .A0(n22), .A1(n11), .B0(n23), .C0(n24), .Y(next_state[1]) );
  NAND4BX1M U43 ( .AN(Start_glitch), .B(n8), .C(start_en), .D(n25), .Y(n24) );
  NOR2X2M U44 ( .A(Parity_en), .B(n26), .Y(n22) );
  NAND2X2M U45 ( .A(n25), .B(bit_count[3]), .Y(n26) );
  INVX2M U46 ( .A(n33), .Y(stop_en) );
  NOR2X2M U47 ( .A(Parity_error), .B(n19), .Y(n18) );
endmodule


module Bit_counter ( CLK, RST, edge_count_en, Prescale, bit_count, edge_count
 );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, edge_count_en;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N20, N21, N22, N23, N24, N25,
         N36, N37, N38, N39, N40, N41, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, \add_27/carry[5] , \add_27/carry[4] , \add_27/carry[3] ,
         \add_27/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n22,
         n23, n24, n25, n26, n27, n28, n29, n30;

  DFFRQX2M \edge_count_reg[5]  ( .D(N41), .CK(CLK), .RN(RST), .Q(edge_count[5]) );
  DFFRQX2M \edge_count_reg[3]  ( .D(N39), .CK(CLK), .RN(RST), .Q(edge_count[3]) );
  DFFRQX2M \edge_count_reg[2]  ( .D(N38), .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  DFFRQX2M \edge_count_reg[0]  ( .D(N36), .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  DFFRQX2M \edge_count_reg[4]  ( .D(N40), .CK(CLK), .RN(RST), .Q(edge_count[4]) );
  DFFRQX2M \edge_count_reg[1]  ( .D(N37), .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  DFFRQX2M \bit_count_reg[3]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_count[3])
         );
  DFFRQX2M \bit_count_reg[2]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n21), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  INVX2M U3 ( .A(n17), .Y(n24) );
  NOR2X2M U4 ( .A(n30), .B(N14), .Y(n17) );
  AOI21X2M U5 ( .A0(n26), .A1(edge_count_en), .B0(n17), .Y(n16) );
  AND2X2M U6 ( .A(N21), .B(n17), .Y(N37) );
  AND2X2M U7 ( .A(N22), .B(n17), .Y(N38) );
  AND2X2M U8 ( .A(N23), .B(n17), .Y(N39) );
  AND2X2M U9 ( .A(N24), .B(n17), .Y(N40) );
  NOR3X2M U10 ( .A(n27), .B(n26), .C(n28), .Y(n13) );
  INVX2M U11 ( .A(edge_count_en), .Y(n30) );
  OAI32X1M U12 ( .A0(n30), .A1(bit_count[0]), .A2(n17), .B0(n26), .B1(n24), 
        .Y(n21) );
  OAI32X1M U13 ( .A0(n14), .A1(bit_count[2]), .A2(n27), .B0(n15), .B1(n28), 
        .Y(n19) );
  OA21X2M U14 ( .A0(n30), .A1(bit_count[1]), .B0(n16), .Y(n15) );
  OAI22X1M U15 ( .A0(n29), .A1(n24), .B0(n12), .B1(n30), .Y(n18) );
  AOI32X1M U16 ( .A0(n13), .A1(n29), .A2(N14), .B0(bit_count[3]), .B1(n25), 
        .Y(n12) );
  INVX2M U17 ( .A(bit_count[3]), .Y(n29) );
  INVX2M U18 ( .A(n13), .Y(n25) );
  OAI22X1M U19 ( .A0(n16), .A1(n27), .B0(bit_count[1]), .B1(n14), .Y(n20) );
  NAND3X2M U20 ( .A(bit_count[0]), .B(n24), .C(edge_count_en), .Y(n14) );
  AND2X2M U21 ( .A(N25), .B(n17), .Y(N41) );
  AND2X2M U22 ( .A(N20), .B(n17), .Y(N36) );
  INVX2M U23 ( .A(edge_count[0]), .Y(N20) );
  INVX2M U24 ( .A(bit_count[0]), .Y(n26) );
  INVX2M U25 ( .A(bit_count[1]), .Y(n27) );
  INVX2M U26 ( .A(bit_count[2]), .Y(n28) );
  ADDHX1M U27 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_27/carry[2] ), 
        .S(N21) );
  ADDHX1M U28 ( .A(edge_count[2]), .B(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(N22) );
  ADDHX1M U29 ( .A(edge_count[3]), .B(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(N23) );
  ADDHX1M U30 ( .A(edge_count[4]), .B(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(N24) );
  INVX2M U31 ( .A(Prescale[0]), .Y(N7) );
  NAND2BX1M U32 ( .AN(Prescale[1]), .B(N7), .Y(n1) );
  OAI2BB1X1M U33 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n1), .Y(N8) );
  OR2X1M U34 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  OAI2BB1X1M U35 ( .A0N(n1), .A1N(Prescale[2]), .B0(n2), .Y(N9) );
  OR2X1M U36 ( .A(n2), .B(Prescale[3]), .Y(n3) );
  OAI2BB1X1M U37 ( .A0N(n2), .A1N(Prescale[3]), .B0(n3), .Y(N10) );
  OR2X1M U38 ( .A(n3), .B(Prescale[4]), .Y(n4) );
  OAI2BB1X1M U39 ( .A0N(n3), .A1N(Prescale[4]), .B0(n4), .Y(N11) );
  NOR2X1M U40 ( .A(n4), .B(Prescale[5]), .Y(N13) );
  AO21XLM U41 ( .A0(n4), .A1(Prescale[5]), .B0(N13), .Y(N12) );
  CLKXOR2X2M U42 ( .A(\add_27/carry[5] ), .B(edge_count[5]), .Y(N25) );
  NOR2BX1M U43 ( .AN(N7), .B(edge_count[0]), .Y(n5) );
  OAI2B2X1M U44 ( .A1N(edge_count[1]), .A0(n5), .B0(N8), .B1(n5), .Y(n9) );
  XNOR2X1M U45 ( .A(N12), .B(edge_count[5]), .Y(n8) );
  NOR2BX1M U46 ( .AN(edge_count[0]), .B(N7), .Y(n6) );
  OAI2B2X1M U47 ( .A1N(N8), .A0(n6), .B0(edge_count[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U48 ( .AN(N13), .B(n9), .C(n8), .D(n7), .Y(n23) );
  CLKXOR2X2M U49 ( .A(N11), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U50 ( .A(N9), .B(edge_count[2]), .Y(n11) );
  CLKXOR2X2M U51 ( .A(N10), .B(edge_count[3]), .Y(n10) );
  NOR4X1M U52 ( .A(n23), .B(n22), .C(n11), .D(n10), .Y(N14) );
endmodule


module Data_Sampling ( CLK, RST, Data_samp_en, RX_IN, Prescale, edge_count, 
        Sampled_Bit );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, Data_samp_en, RX_IN;
  output Sampled_Bit;
  wire   sampled_bit_1, sampled_bit_2, sampled_bit_3, N7, N8, N9, N10, N11,
         N12, N13, N16, N17, N18, N19, N20, n25, n26, n27, n28,
         \add_33/carry[4] , \add_33/carry[3] , \add_33/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42;

  DFFRQX2M sampled_bit_1_reg ( .D(n27), .CK(CLK), .RN(RST), .Q(sampled_bit_1)
         );
  DFFRQX2M sampled_bit_2_reg ( .D(n28), .CK(CLK), .RN(RST), .Q(sampled_bit_2)
         );
  DFFRQX2M Sampled_Bit_reg ( .D(n25), .CK(CLK), .RN(RST), .Q(Sampled_Bit) );
  DFFRX1M sampled_bit_3_reg ( .D(n26), .CK(CLK), .RN(RST), .Q(sampled_bit_3), 
        .QN(n17) );
  INVX2M U3 ( .A(Prescale[1]), .Y(N7) );
  ADDHX1M U4 ( .A(Prescale[4]), .B(\add_33/carry[3] ), .CO(\add_33/carry[4] ), 
        .S(N18) );
  ADDHX1M U5 ( .A(Prescale[2]), .B(Prescale[1]), .CO(\add_33/carry[2] ), .S(
        N16) );
  ADDHX1M U6 ( .A(Prescale[3]), .B(\add_33/carry[2] ), .CO(\add_33/carry[3] ), 
        .S(N17) );
  ADDHX1M U7 ( .A(Prescale[5]), .B(\add_33/carry[4] ), .CO(N20), .S(N19) );
  NAND2BX1M U8 ( .AN(Prescale[2]), .B(N7), .Y(n1) );
  OAI2BB1X1M U9 ( .A0N(Prescale[1]), .A1N(Prescale[2]), .B0(n1), .Y(N8) );
  OR2X1M U10 ( .A(n1), .B(Prescale[3]), .Y(n2) );
  OAI2BB1X1M U11 ( .A0N(n1), .A1N(Prescale[3]), .B0(n2), .Y(N9) );
  XNOR2X1M U12 ( .A(Prescale[4]), .B(n2), .Y(N10) );
  NOR3X1M U13 ( .A(Prescale[4]), .B(Prescale[5]), .C(n2), .Y(N12) );
  OAI21X1M U14 ( .A0(Prescale[4]), .A1(n2), .B0(Prescale[5]), .Y(n3) );
  NAND2BX1M U15 ( .AN(N12), .B(n3), .Y(N11) );
  NOR2BX1M U16 ( .AN(edge_count[0]), .B(N7), .Y(n4) );
  OAI2B2X1M U17 ( .A1N(N8), .A0(n4), .B0(edge_count[1]), .B1(n4), .Y(n7) );
  NOR2BX1M U18 ( .AN(N7), .B(edge_count[0]), .Y(n5) );
  OAI2B2X1M U19 ( .A1N(edge_count[1]), .A0(n5), .B0(N8), .B1(n5), .Y(n6) );
  NAND4BBX1M U20 ( .AN(N12), .BN(edge_count[5]), .C(n7), .D(n6), .Y(n11) );
  CLKXOR2X2M U21 ( .A(N11), .B(edge_count[4]), .Y(n10) );
  CLKXOR2X2M U22 ( .A(N9), .B(edge_count[2]), .Y(n9) );
  CLKXOR2X2M U23 ( .A(N10), .B(edge_count[3]), .Y(n8) );
  NOR4X1M U24 ( .A(n11), .B(n10), .C(n9), .D(n8), .Y(N13) );
  MXI2X1M U25 ( .A(n12), .B(n13), .S0(n14), .Y(n28) );
  CLKNAND2X2M U26 ( .A(sampled_bit_2), .B(Data_samp_en), .Y(n12) );
  MXI2X1M U27 ( .A(n13), .B(n15), .S0(n16), .Y(n27) );
  CLKNAND2X2M U28 ( .A(sampled_bit_1), .B(Data_samp_en), .Y(n15) );
  MXI2X1M U29 ( .A(n13), .B(n17), .S0(n18), .Y(n26) );
  AOI31X1M U30 ( .A0(n19), .A1(n16), .A2(n20), .B0(n21), .Y(n18) );
  CLKINVX1M U31 ( .A(N13), .Y(n16) );
  CLKNAND2X2M U32 ( .A(RX_IN), .B(Data_samp_en), .Y(n13) );
  NOR2X1M U33 ( .A(n21), .B(n22), .Y(n25) );
  MXI2X1M U34 ( .A(Sampled_Bit), .B(n23), .S0(n24), .Y(n22) );
  NOR3X1M U35 ( .A(n14), .B(N13), .C(n20), .Y(n24) );
  AND4X1M U36 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n20) );
  NOR3X1M U37 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  CLKXOR2X2M U38 ( .A(edge_count[4]), .B(N19), .Y(n35) );
  CLKXOR2X2M U39 ( .A(edge_count[1]), .B(N16), .Y(n34) );
  CLKXOR2X2M U40 ( .A(edge_count[0]), .B(N7), .Y(n33) );
  XNOR2X1M U41 ( .A(edge_count[2]), .B(N17), .Y(n31) );
  XNOR2X1M U42 ( .A(edge_count[3]), .B(N18), .Y(n30) );
  XNOR2X1M U43 ( .A(edge_count[5]), .B(N20), .Y(n29) );
  NOR2X1M U44 ( .A(n19), .B(N13), .Y(n14) );
  NAND4X1M U45 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n19) );
  NOR3X1M U46 ( .A(n40), .B(edge_count[5]), .C(n41), .Y(n39) );
  CLKXOR2X2M U47 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n41) );
  CLKXOR2X2M U48 ( .A(edge_count[4]), .B(Prescale[5]), .Y(n40) );
  XNOR2X1M U49 ( .A(edge_count[2]), .B(Prescale[3]), .Y(n38) );
  XNOR2X1M U50 ( .A(edge_count[3]), .B(Prescale[4]), .Y(n37) );
  XNOR2X1M U51 ( .A(edge_count[1]), .B(Prescale[2]), .Y(n36) );
  OAI2BB1X1M U52 ( .A0N(sampled_bit_2), .A1N(sampled_bit_1), .B0(n42), .Y(n23)
         );
  OAI21X1M U53 ( .A0(sampled_bit_1), .A1(sampled_bit_2), .B0(sampled_bit_3), 
        .Y(n42) );
  CLKINVX1M U54 ( .A(Data_samp_en), .Y(n21) );
endmodule


module Start_Check ( CLK, RST, start_en, Sampled_Bit, Start_glitch );
  input CLK, RST, start_en, Sampled_Bit;
  output Start_glitch;
  wire   N4;

  DFFRQX2M Start_glitch_reg ( .D(N4), .CK(CLK), .RN(RST), .Q(Start_glitch) );
  AND2X2M U3 ( .A(start_en), .B(Sampled_Bit), .Y(N4) );
endmodule


module Stop_Check ( CLK, RST, stop_en, Sampled_Bit, Stop_error );
  input CLK, RST, stop_en, Sampled_Bit;
  output Stop_error;
  wire   n2, n1;

  DFFRQX2M Stop_error_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(Stop_error) );
  OAI2BB2X1M U2 ( .B0(Sampled_Bit), .B1(n1), .A0N(Stop_error), .A1N(n1), .Y(n2) );
  INVX2M U3 ( .A(stop_en), .Y(n1) );
endmodule


module Deserializer ( CLK, RST, desrializer_en, Sampled_Bit, DATA_VALID, 
        bit_count, parity_flag, P_DATA );
  input [3:0] bit_count;
  output [7:0] P_DATA;
  input CLK, RST, desrializer_en, Sampled_Bit, DATA_VALID;
  output parity_flag;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n1,
         n2, n3, n4, n5, n6, n7;
  wire   [7:0] DATA;

  DFFQX2M \DATA_reg[2]  ( .D(n29), .CK(CLK), .Q(DATA[2]) );
  DFFQX2M \DATA_reg[5]  ( .D(n32), .CK(CLK), .Q(DATA[5]) );
  DFFQX2M \DATA_reg[1]  ( .D(n28), .CK(CLK), .Q(DATA[1]) );
  DFFQX2M \DATA_reg[4]  ( .D(n31), .CK(CLK), .Q(DATA[4]) );
  DFFQX2M \DATA_reg[0]  ( .D(n27), .CK(CLK), .Q(DATA[0]) );
  DFFRQX2M parity_flag_reg ( .D(n26), .CK(CLK), .RN(RST), .Q(parity_flag) );
  DFFQX2M \DATA_reg[3]  ( .D(n30), .CK(CLK), .Q(DATA[3]) );
  DFFQX2M \DATA_reg[6]  ( .D(n33), .CK(CLK), .Q(DATA[6]) );
  DFFQX2M \DATA_reg[7]  ( .D(n34), .CK(CLK), .Q(DATA[7]) );
  INVX2M U3 ( .A(RST), .Y(n1) );
  INVX2M U4 ( .A(DATA_VALID), .Y(n2) );
  NOR2X2M U5 ( .A(n3), .B(DATA_VALID), .Y(n23) );
  NOR2BX2M U6 ( .AN(n14), .B(n7), .Y(n19) );
  INVX2M U7 ( .A(desrializer_en), .Y(n3) );
  NOR2BX2M U8 ( .AN(DATA[2]), .B(n2), .Y(P_DATA[2]) );
  NOR2BX2M U9 ( .AN(DATA[3]), .B(n2), .Y(P_DATA[3]) );
  NOR2BX2M U10 ( .AN(DATA[6]), .B(n2), .Y(P_DATA[6]) );
  AND2X2M U11 ( .A(DATA[0]), .B(DATA_VALID), .Y(P_DATA[0]) );
  AND2X2M U12 ( .A(DATA[1]), .B(DATA_VALID), .Y(P_DATA[1]) );
  AND2X2M U13 ( .A(DATA[4]), .B(DATA_VALID), .Y(P_DATA[4]) );
  AND2X2M U14 ( .A(DATA[5]), .B(DATA_VALID), .Y(P_DATA[5]) );
  AND2X2M U15 ( .A(DATA[7]), .B(DATA_VALID), .Y(P_DATA[7]) );
  NOR3BX2M U16 ( .AN(n14), .B(bit_count[2]), .C(n6), .Y(n16) );
  NOR3BX2M U17 ( .AN(n23), .B(n1), .C(bit_count[3]), .Y(n14) );
  OAI2BB2X1M U18 ( .B0(n4), .B1(n15), .A0N(n15), .A1N(DATA[1]), .Y(n28) );
  NAND2X2M U19 ( .A(n16), .B(n5), .Y(n15) );
  OAI2BB2X1M U20 ( .B0(n4), .B1(n17), .A0N(n17), .A1N(DATA[2]), .Y(n29) );
  NAND2X2M U21 ( .A(n16), .B(bit_count[0]), .Y(n17) );
  OAI2BB2X1M U22 ( .B0(n4), .B1(n20), .A0N(n20), .A1N(DATA[4]), .Y(n31) );
  NAND3X2M U23 ( .A(bit_count[0]), .B(n6), .C(n19), .Y(n20) );
  OAI2BB2X1M U24 ( .B0(n4), .B1(n21), .A0N(n21), .A1N(DATA[5]), .Y(n32) );
  NAND3X2M U25 ( .A(bit_count[1]), .B(n5), .C(n19), .Y(n21) );
  OAI2BB2X1M U26 ( .B0(n4), .B1(n22), .A0N(n22), .A1N(DATA[6]), .Y(n33) );
  NAND3X2M U27 ( .A(bit_count[1]), .B(bit_count[0]), .C(n19), .Y(n22) );
  OAI2BB2X1M U28 ( .B0(n4), .B1(n18), .A0N(n18), .A1N(DATA[3]), .Y(n30) );
  NAND3X2M U29 ( .A(n5), .B(n6), .C(n19), .Y(n18) );
  OAI2BB2X1M U30 ( .B0(n13), .B1(n4), .A0N(n13), .A1N(DATA[0]), .Y(n27) );
  NAND4X2M U31 ( .A(bit_count[0]), .B(n14), .C(n6), .D(n7), .Y(n13) );
  OAI2BB2X1M U32 ( .B0(n4), .B1(n24), .A0N(n24), .A1N(DATA[7]), .Y(n34) );
  NAND4X2M U33 ( .A(n23), .B(RST), .C(bit_count[3]), .D(n25), .Y(n24) );
  NOR3X2M U34 ( .A(bit_count[0]), .B(bit_count[2]), .C(bit_count[1]), .Y(n25)
         );
  XNOR2X2M U35 ( .A(DATA[2]), .B(DATA[3]), .Y(n12) );
  INVX2M U36 ( .A(bit_count[0]), .Y(n5) );
  INVX2M U37 ( .A(bit_count[1]), .Y(n6) );
  OAI2BB2X1M U38 ( .B0(n8), .B1(n3), .A0N(parity_flag), .A1N(n3), .Y(n26) );
  CLKXOR2X2M U39 ( .A(n9), .B(n10), .Y(n8) );
  XOR3XLM U40 ( .A(DATA[1]), .B(DATA[0]), .C(n12), .Y(n9) );
  XOR3XLM U41 ( .A(DATA[5]), .B(DATA[4]), .C(n11), .Y(n10) );
  INVX2M U42 ( .A(bit_count[2]), .Y(n7) );
  CLKXOR2X2M U43 ( .A(DATA[7]), .B(DATA[6]), .Y(n11) );
  INVX2M U44 ( .A(Sampled_Bit), .Y(n4) );
endmodule


module Parity_Check ( CLK, RST, Parity_type, parity_check_en, Sampled_Bit, 
        parity_flag, Parity_error );
  input CLK, RST, Parity_type, parity_check_en, Sampled_Bit, parity_flag;
  output Parity_error;
  wire   n1, n2;

  DFFRQX2M Parity_error_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(Parity_error) );
  AO2B2X2M U3 ( .B0(parity_check_en), .B1(n1), .A0(Parity_error), .A1N(
        parity_check_en), .Y(n2) );
  XOR3XLM U4 ( .A(parity_flag), .B(Sampled_Bit), .C(Parity_type), .Y(n1) );
endmodule


module UART_RX_TOP ( CLK, RST, RX_IN, Parity_en, Parity_type, Prescale, 
        DATA_VALID, Stop_error, Parity_error, P_DATA );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, Parity_en, Parity_type;
  output DATA_VALID, Stop_error, Parity_error;
  wire   Start_glitch, Data_samp_en, edge_count_en, desrializer_en, stop_en,
         start_en, parity_check_en, Sampled_Bit, parity_flag, n1, n2;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  FSM FSM ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .Parity_error(Parity_error), 
        .Stop_error(Stop_error), .Start_glitch(Start_glitch), .Parity_en(
        Parity_en), .bit_count(bit_count), .edge_count(edge_count), 
        .Data_samp_en(Data_samp_en), .edge_count_en(edge_count_en), 
        .desrializer_en(desrializer_en), .stop_en(stop_en), .start_en(start_en), .parity_check_en(parity_check_en), .DATA_VALID(DATA_VALID) );
  Bit_counter Bit_counter ( .CLK(CLK), .RST(n1), .edge_count_en(edge_count_en), 
        .Prescale(Prescale), .bit_count(bit_count), .edge_count(edge_count) );
  Data_Sampling Data_Sampling ( .CLK(CLK), .RST(n1), .Data_samp_en(
        Data_samp_en), .RX_IN(RX_IN), .Prescale(Prescale), .edge_count(
        edge_count), .Sampled_Bit(Sampled_Bit) );
  Start_Check Start_Check ( .CLK(CLK), .RST(n1), .start_en(start_en), 
        .Sampled_Bit(Sampled_Bit), .Start_glitch(Start_glitch) );
  Stop_Check Stop_Check ( .CLK(CLK), .RST(n1), .stop_en(stop_en), 
        .Sampled_Bit(Sampled_Bit), .Stop_error(Stop_error) );
  Deserializer Deserializer ( .CLK(CLK), .RST(n1), .desrializer_en(
        desrializer_en), .Sampled_Bit(Sampled_Bit), .DATA_VALID(DATA_VALID), 
        .bit_count(bit_count), .parity_flag(parity_flag), .P_DATA(P_DATA) );
  Parity_Check Parity_Check ( .CLK(CLK), .RST(n1), .Parity_type(Parity_type), 
        .parity_check_en(parity_check_en), .Sampled_Bit(Sampled_Bit), 
        .parity_flag(parity_flag), .Parity_error(Parity_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module serializer_DATA_WIDTH8 ( P_DATA, ser_en, RST, CLK, data_valid, ser_done, 
        ser_data );
  input [7:0] P_DATA;
  input ser_en, RST, CLK, data_valid;
  output ser_done, ser_data;
  wire   N3, N4, N5, N16, N17, N18, N24, n2, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n1, n3, n4, n5, n6, n17, n18;
  wire   [7:0] P_DATA_COMP;

  DFFRQX2M \P_DATA_COMP_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[5]) );
  DFFRQX2M \P_DATA_COMP_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[1]) );
  DFFRQX2M \P_DATA_COMP_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[7]) );
  DFFRQX2M \P_DATA_COMP_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[3]) );
  DFFRQX2M \P_DATA_COMP_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[6]) );
  DFFRQX2M \P_DATA_COMP_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[2]) );
  DFFRQX2M \P_DATA_COMP_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[4]) );
  DFFRQX2M \P_DATA_COMP_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(
        P_DATA_COMP[0]) );
  DFFRQX2M \counter_reg[1]  ( .D(N17), .CK(CLK), .RN(RST), .Q(N4) );
  DFFRQX2M \counter_reg[2]  ( .D(N18), .CK(CLK), .RN(RST), .Q(N5) );
  DFFRQX2M \counter_reg[0]  ( .D(N16), .CK(CLK), .RN(RST), .Q(N3) );
  INVX2M U3 ( .A(n2), .Y(n5) );
  INVX2M U4 ( .A(ser_en), .Y(n4) );
  NAND4X2M U5 ( .A(data_valid), .B(n6), .C(n17), .D(n18), .Y(n2) );
  AOI211X2M U6 ( .A0(n6), .A1(n17), .B0(n4), .C0(n7), .Y(N17) );
  NOR2X2M U7 ( .A(n17), .B(n6), .Y(n7) );
  NOR2BX2M U8 ( .AN(N24), .B(n4), .Y(ser_data) );
  MX2X2M U9 ( .A(n3), .B(n1), .S0(N5), .Y(N24) );
  MX4X1M U10 ( .A(P_DATA_COMP[4]), .B(P_DATA_COMP[5]), .C(P_DATA_COMP[6]), .D(
        P_DATA_COMP[7]), .S0(N3), .S1(N4), .Y(n1) );
  MX4X1M U11 ( .A(P_DATA_COMP[0]), .B(P_DATA_COMP[1]), .C(P_DATA_COMP[2]), .D(
        P_DATA_COMP[3]), .S0(N3), .S1(N4), .Y(n3) );
  AO22X1M U12 ( .A0(P_DATA_COMP[0]), .A1(n2), .B0(P_DATA[0]), .B1(n5), .Y(n9)
         );
  AO22X1M U13 ( .A0(P_DATA_COMP[1]), .A1(n2), .B0(P_DATA[1]), .B1(n5), .Y(n10)
         );
  AO22X1M U14 ( .A0(P_DATA_COMP[2]), .A1(n2), .B0(P_DATA[2]), .B1(n5), .Y(n11)
         );
  AO22X1M U15 ( .A0(P_DATA_COMP[3]), .A1(n2), .B0(P_DATA[3]), .B1(n5), .Y(n12)
         );
  AO22X1M U16 ( .A0(P_DATA_COMP[4]), .A1(n2), .B0(P_DATA[4]), .B1(n5), .Y(n13)
         );
  AO22X1M U17 ( .A0(P_DATA_COMP[5]), .A1(n2), .B0(P_DATA[5]), .B1(n5), .Y(n14)
         );
  AO22X1M U18 ( .A0(P_DATA_COMP[6]), .A1(n2), .B0(P_DATA[6]), .B1(n5), .Y(n15)
         );
  AO22X1M U19 ( .A0(P_DATA_COMP[7]), .A1(n2), .B0(P_DATA[7]), .B1(n5), .Y(n16)
         );
  OAI2BB2X1M U20 ( .B0(n8), .B1(n4), .A0N(N5), .A1N(N16), .Y(N18) );
  AOI22X1M U21 ( .A0(n7), .A1(n18), .B0(N5), .B1(n17), .Y(n8) );
  NOR2X2M U22 ( .A(n4), .B(N3), .Y(N16) );
  INVX2M U23 ( .A(N3), .Y(n6) );
  INVX2M U24 ( .A(N4), .Y(n17) );
  INVX2M U25 ( .A(N5), .Y(n18) );
  AND2X2M U26 ( .A(n7), .B(N5), .Y(ser_done) );
endmodule


module FSM_TX ( CLK, RST, party_en, ser_done, data_valid, busy, ser_en, 
        mux_sel );
  output [2:0] mux_sel;
  input CLK, RST, party_en, ser_done, data_valid;
  output busy, ser_en;
  wire   n4, n5, n6, n7, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(busy), .Y(mux_sel[2]) );
  AOI22X1M U4 ( .A0(current_state[0]), .A1(current_state[2]), .B0(n3), .B1(n2), 
        .Y(busy) );
  NOR3X2M U5 ( .A(n2), .B(current_state[2]), .C(n3), .Y(ser_en) );
  AOI21X2M U6 ( .A0(n3), .A1(current_state[0]), .B0(mux_sel[1]), .Y(n5) );
  NOR2X2M U7 ( .A(n3), .B(current_state[0]), .Y(mux_sel[1]) );
  INVX2M U8 ( .A(current_state[1]), .Y(n3) );
  INVX2M U9 ( .A(current_state[0]), .Y(n2) );
  OR2X2M U10 ( .A(n5), .B(current_state[2]), .Y(mux_sel[0]) );
  AOI21X2M U11 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  OR2X2M U12 ( .A(ser_done), .B(n2), .Y(n6) );
  OAI21X2M U13 ( .A0(current_state[0]), .A1(data_valid), .B0(n3), .Y(n7) );
  OAI21BX1M U14 ( .A0(current_state[2]), .A1(n5), .B0N(ser_en), .Y(
        next_state[1]) );
  AOI2B1X1M U15 ( .A1N(mux_sel[1]), .A0(n4), .B0(current_state[2]), .Y(
        next_state[2]) );
  NAND3BX2M U16 ( .AN(party_en), .B(current_state[1]), .C(ser_done), .Y(n4) );
endmodule


module parity_calc_DATA_WIDTH8 ( party_typ, data_valid, CLK, RST, busy, P_DATA, 
        party_bit );
  input [7:0] P_DATA;
  input party_typ, data_valid, CLK, RST, busy;
  output party_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M party_bit_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(party_bit) );
  XOR3XLM U2 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
  XNOR2X2M U3 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  OAI2BB2X1M U4 ( .B0(n1), .B1(n2), .A0N(party_bit), .A1N(n2), .Y(n7) );
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
  OAI21X2M U4 ( .A0(mux_sel[0]), .A1(party_bit), .B0(mux_sel[1]), .Y(n1) );
  NAND2X2M U5 ( .A(ser_data), .B(mux_sel[0]), .Y(n2) );
endmodule


module UART_TX_TOP_DATA_WIDTH8 ( CLK, RST, party_en, data_valid, party_typ, 
        P_DATA, busy, Tx_OUT );
  input [7:0] P_DATA;
  input CLK, RST, party_en, data_valid, party_typ;
  output busy, Tx_OUT;
  wire   ser_done, ser_en, ser_data, party_bit;
  wire   [2:0] mux_sel;

  serializer_DATA_WIDTH8 serial ( .P_DATA(P_DATA), .ser_en(ser_en), .RST(RST), 
        .CLK(CLK), .data_valid(data_valid), .ser_done(ser_done), .ser_data(
        ser_data) );
  FSM_TX FSM ( .CLK(CLK), .RST(RST), .party_en(party_en), .ser_done(ser_done), 
        .data_valid(data_valid), .busy(busy), .ser_en(ser_en), .mux_sel(
        mux_sel) );
  parity_calc_DATA_WIDTH8 parity ( .party_typ(party_typ), .data_valid(
        data_valid), .CLK(1'b0), .RST(1'b0), .busy(1'b0), .P_DATA(P_DATA), 
        .party_bit(party_bit) );
  MUX MUX ( .mux_sel(mux_sel), .ser_data(ser_data), .party_bit(party_bit), 
        .Tx_OUT(Tx_OUT) );
endmodule


module SYS_UART_TOP_DATA_WIDTH8 ( TX_CLK, RX_CLK, RST_SYNC_1, RX_IN, R_EMPTY, 
        UART_CONFIG, R_DATA, Tx_OUT, DATA_VALID, Stop_error, Parity_error, 
        PULSE_GEN, P_DATA );
  input [7:0] UART_CONFIG;
  input [7:0] R_DATA;
  output [7:0] P_DATA;
  input TX_CLK, RX_CLK, RST_SYNC_1, RX_IN, R_EMPTY;
  output Tx_OUT, DATA_VALID, Stop_error, Parity_error, PULSE_GEN;
  wire   n1, n2, n3;

  UART_RX_TOP UART_RX_TOP ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN), .Parity_en(
        UART_CONFIG[0]), .Parity_type(UART_CONFIG[1]), .Prescale(
        UART_CONFIG[7:2]), .DATA_VALID(DATA_VALID), .Stop_error(Stop_error), 
        .Parity_error(Parity_error), .P_DATA(P_DATA) );
  UART_TX_TOP_DATA_WIDTH8 UART_TX_TOP ( .CLK(TX_CLK), .RST(n1), .party_en(
        UART_CONFIG[0]), .data_valid(n3), .party_typ(UART_CONFIG[1]), .P_DATA(
        R_DATA), .busy(PULSE_GEN), .Tx_OUT(Tx_OUT) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST_SYNC_1), .Y(n2) );
  INVX2M U3 ( .A(R_EMPTY), .Y(n3) );
endmodule


module SYSTEM_CONTROL_DATA_WIDTH8 ( REF_CLK, RST_SYNC_2, pulse_gen, W_FULL, 
        R_DATA_VALID, ALU_OUT_VALID, SYNC_BUS, R_REG_DATA, ALU_OUT, WINC, 
        W_REG_EN, R_REG_EN, ALU_EN, CLK_GATE_EN, div_en, W_DATA, W_REG_DATA, 
        REG_ADDRESS, ALU_FUNC );
  input [7:0] SYNC_BUS;
  input [7:0] R_REG_DATA;
  input [15:0] ALU_OUT;
  output [7:0] W_DATA;
  output [7:0] W_REG_DATA;
  output [3:0] REG_ADDRESS;
  output [3:0] ALU_FUNC;
  input REF_CLK, RST_SYNC_2, pulse_gen, W_FULL, R_DATA_VALID, ALU_OUT_VALID;
  output WINC, W_REG_EN, R_REG_EN, ALU_EN, CLK_GATE_EN, div_en;
  wire   \comb_reg_address[0] , n12, n13, n14, n26, n27, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n54, n55, n56, n58, n59, n60, n61, n62,
         n63, n64, n65, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n1, n2, n3, n4, n5, n6, n7, n9, n10,
         n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n28, n53, n57, n66;
  wire   [3:0] current_state;
  wire   [2:0] next_state;
  wire   [7:0] W_DATA_2;
  assign div_en = 1'b1;

  DFFRQX2M \W_DATA_2_reg[7]  ( .D(n83), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[7]) );
  DFFRQX2M \W_DATA_2_reg[6]  ( .D(n82), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[6]) );
  DFFRQX2M \W_DATA_2_reg[5]  ( .D(n81), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[5]) );
  DFFRQX2M \W_DATA_2_reg[4]  ( .D(n80), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[4]) );
  DFFRQX2M \W_DATA_2_reg[3]  ( .D(n79), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[3]) );
  DFFRQX2M \W_DATA_2_reg[2]  ( .D(n78), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[2]) );
  DFFRQX2M \W_DATA_2_reg[1]  ( .D(n77), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[1]) );
  DFFRQX2M \W_DATA_2_reg[0]  ( .D(n76), .CK(REF_CLK), .RN(RST_SYNC_2), .Q(
        W_DATA_2[0]) );
  DFFRQX2M \comb_reg_address_reg[0]  ( .D(n72), .CK(REF_CLK), .RN(RST_SYNC_2), 
        .Q(\comb_reg_address[0] ) );
  DFFRX1M \comb_reg_address_reg[3]  ( .D(n75), .CK(REF_CLK), .RN(RST_SYNC_2), 
        .QN(n12) );
  DFFRX1M \comb_reg_address_reg[2]  ( .D(n74), .CK(REF_CLK), .RN(RST_SYNC_2), 
        .QN(n13) );
  DFFRX1M \comb_reg_address_reg[1]  ( .D(n73), .CK(REF_CLK), .RN(RST_SYNC_2), 
        .QN(n14) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(REF_CLK), .RN(
        RST_SYNC_2), .Q(current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(REF_CLK), .RN(
        RST_SYNC_2), .Q(current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(REF_CLK), .RN(
        RST_SYNC_2), .Q(current_state[0]) );
  NOR2X2M U3 ( .A(n53), .B(n71), .Y(ALU_FUNC[2]) );
  NOR2X2M U4 ( .A(n66), .B(n71), .Y(ALU_FUNC[0]) );
  OAI22X2M U5 ( .A0(n53), .A1(n68), .B0(n13), .B1(n69), .Y(REG_ADDRESS[2]) );
  BUFX2M U6 ( .A(n55), .Y(n4) );
  INVX2M U7 ( .A(W_FULL), .Y(n6) );
  INVX2M U8 ( .A(n52), .Y(n7) );
  NAND2X2M U9 ( .A(n16), .B(n10), .Y(CLK_GATE_EN) );
  INVX2M U10 ( .A(n56), .Y(n10) );
  NOR2X2M U11 ( .A(n57), .B(n71), .Y(ALU_FUNC[1]) );
  NOR2X2M U12 ( .A(n28), .B(n71), .Y(ALU_FUNC[3]) );
  NOR2X2M U13 ( .A(n66), .B(n4), .Y(W_REG_DATA[0]) );
  NOR2X2M U14 ( .A(n53), .B(n4), .Y(W_REG_DATA[2]) );
  NOR2X2M U15 ( .A(n28), .B(n4), .Y(W_REG_DATA[3]) );
  NOR2X2M U16 ( .A(n25), .B(n4), .Y(W_REG_DATA[4]) );
  NOR2X2M U17 ( .A(n24), .B(n4), .Y(W_REG_DATA[5]) );
  NOR2X2M U18 ( .A(n23), .B(n4), .Y(W_REG_DATA[6]) );
  NOR2X2M U19 ( .A(n22), .B(n4), .Y(W_REG_DATA[7]) );
  NOR2X2M U20 ( .A(n57), .B(n4), .Y(W_REG_DATA[1]) );
  OAI21X2M U21 ( .A0(n47), .A1(n16), .B0(n67), .Y(WINC) );
  OAI21X2M U22 ( .A0(n18), .A1(n1), .B0(n6), .Y(n67) );
  INVX2M U23 ( .A(n38), .Y(n16) );
  INVX2M U24 ( .A(n51), .Y(n18) );
  OR2X2M U25 ( .A(n48), .B(n46), .Y(n56) );
  INVX2M U26 ( .A(n68), .Y(R_REG_EN) );
  INVX2M U27 ( .A(n4), .Y(W_REG_EN) );
  INVX2M U28 ( .A(n47), .Y(n5) );
  NOR3X2M U29 ( .A(n45), .B(n15), .C(n21), .Y(n52) );
  NOR4X1M U30 ( .A(n21), .B(n22), .C(n28), .D(n45), .Y(n30) );
  OAI21BX1M U31 ( .A0(n15), .A1(n45), .B0N(n46), .Y(n36) );
  NAND2X2M U32 ( .A(n20), .B(n19), .Y(n45) );
  INVX2M U33 ( .A(n71), .Y(ALU_EN) );
  NAND4X2M U34 ( .A(n29), .B(n53), .C(n23), .D(n15), .Y(n44) );
  OAI22X4M U35 ( .A0(n28), .A1(n68), .B0(n12), .B1(n69), .Y(REG_ADDRESS[3]) );
  NOR3X2M U36 ( .A(current_state[0]), .B(current_state[2]), .C(n20), .Y(n34)
         );
  NOR3X2M U37 ( .A(n19), .B(current_state[0]), .C(n20), .Y(n38) );
  NOR3X2M U38 ( .A(n15), .B(current_state[2]), .C(n20), .Y(n49) );
  NAND2X2M U39 ( .A(pulse_gen), .B(n38), .Y(n71) );
  NAND2X2M U40 ( .A(pulse_gen), .B(n49), .Y(n68) );
  INVX2M U41 ( .A(current_state[0]), .Y(n15) );
  NAND2X2M U42 ( .A(pulse_gen), .B(n34), .Y(n69) );
  INVX2M U43 ( .A(current_state[1]), .Y(n20) );
  INVX2M U44 ( .A(current_state[2]), .Y(n19) );
  OAI22X1M U45 ( .A0(n66), .A1(n68), .B0(n70), .B1(n21), .Y(REG_ADDRESS[0]) );
  AOI21X2M U46 ( .A0(\comb_reg_address[0] ), .A1(n34), .B0(n46), .Y(n70) );
  OAI2B2X1M U47 ( .A1N(n49), .A0(n50), .B0(n51), .B1(n6), .Y(n35) );
  NOR2BX2M U48 ( .AN(R_DATA_VALID), .B(W_FULL), .Y(n50) );
  NOR3X2M U49 ( .A(n15), .B(current_state[1]), .C(n19), .Y(n46) );
  NOR3X2M U50 ( .A(current_state[0]), .B(current_state[1]), .C(n19), .Y(n48)
         );
  NOR2BX2M U51 ( .AN(ALU_OUT_VALID), .B(n16), .Y(n3) );
  NOR2BX2M U52 ( .AN(ALU_OUT_VALID), .B(n16), .Y(n54) );
  NOR2BX2M U53 ( .AN(ALU_OUT_VALID), .B(n16), .Y(n2) );
  INVX2M U54 ( .A(pulse_gen), .Y(n21) );
  INVX2M U55 ( .A(SYNC_BUS[1]), .Y(n57) );
  INVX2M U56 ( .A(SYNC_BUS[2]), .Y(n53) );
  NAND3X2M U57 ( .A(current_state[2]), .B(current_state[0]), .C(
        current_state[1]), .Y(n51) );
  OAI2BB1X2M U58 ( .A0N(R_REG_DATA[0]), .A1N(n1), .B0(n65), .Y(W_DATA[0]) );
  AOI22X1M U59 ( .A0(W_DATA_2[0]), .A1(n18), .B0(ALU_OUT[0]), .B1(n3), .Y(n65)
         );
  OAI2BB1X2M U60 ( .A0N(R_REG_DATA[1]), .A1N(n1), .B0(n64), .Y(W_DATA[1]) );
  AOI22X1M U61 ( .A0(W_DATA_2[1]), .A1(n18), .B0(ALU_OUT[1]), .B1(n54), .Y(n64) );
  OAI2BB1X2M U62 ( .A0N(R_REG_DATA[2]), .A1N(n1), .B0(n63), .Y(W_DATA[2]) );
  AOI22X1M U63 ( .A0(W_DATA_2[2]), .A1(n18), .B0(ALU_OUT[2]), .B1(n2), .Y(n63)
         );
  OAI2BB1X2M U64 ( .A0N(R_REG_DATA[3]), .A1N(n1), .B0(n62), .Y(W_DATA[3]) );
  AOI22X1M U65 ( .A0(W_DATA_2[3]), .A1(n18), .B0(ALU_OUT[3]), .B1(n3), .Y(n62)
         );
  OAI2BB1X2M U66 ( .A0N(R_REG_DATA[4]), .A1N(n1), .B0(n61), .Y(W_DATA[4]) );
  AOI22X1M U67 ( .A0(W_DATA_2[4]), .A1(n18), .B0(ALU_OUT[4]), .B1(n54), .Y(n61) );
  OAI2BB1X2M U68 ( .A0N(R_REG_DATA[5]), .A1N(n1), .B0(n60), .Y(W_DATA[5]) );
  AOI22X1M U69 ( .A0(W_DATA_2[5]), .A1(n18), .B0(ALU_OUT[5]), .B1(n2), .Y(n60)
         );
  OAI2BB1X2M U70 ( .A0N(R_REG_DATA[6]), .A1N(n1), .B0(n59), .Y(W_DATA[6]) );
  AOI22X1M U71 ( .A0(W_DATA_2[6]), .A1(n18), .B0(ALU_OUT[6]), .B1(n3), .Y(n59)
         );
  OAI2BB1X2M U72 ( .A0N(R_REG_DATA[7]), .A1N(n1), .B0(n58), .Y(W_DATA[7]) );
  AOI22X1M U73 ( .A0(W_DATA_2[7]), .A1(n18), .B0(ALU_OUT[7]), .B1(n54), .Y(n58) );
  INVX2M U74 ( .A(SYNC_BUS[3]), .Y(n28) );
  OAI21X2M U75 ( .A0(n34), .A1(n56), .B0(pulse_gen), .Y(n55) );
  NAND2X2M U76 ( .A(n41), .B(n42), .Y(next_state[0]) );
  AOI21X2M U77 ( .A0(n48), .A1(pulse_gen), .B0(n35), .Y(n41) );
  AOI221XLM U78 ( .A0(n5), .A1(n38), .B0(n36), .B1(n21), .C0(n43), .Y(n42) );
  NOR4BX1M U79 ( .AN(n30), .B(n44), .C(n24), .D(n57), .Y(n43) );
  NAND2X2M U80 ( .A(ALU_OUT_VALID), .B(n6), .Y(n47) );
  INVX2M U81 ( .A(SYNC_BUS[0]), .Y(n66) );
  NAND3X2M U82 ( .A(n32), .B(n33), .C(n31), .Y(next_state[1]) );
  AOI31X2M U83 ( .A0(n30), .A1(SYNC_BUS[0]), .A2(n37), .B0(n38), .Y(n31) );
  NAND2X2M U84 ( .A(pulse_gen), .B(n36), .Y(n32) );
  AOI21X2M U85 ( .A0(n34), .A1(n21), .B0(n35), .Y(n33) );
  OAI22X1M U86 ( .A0(n57), .A1(n68), .B0(n14), .B1(n69), .Y(REG_ADDRESS[1]) );
  AND2X2M U87 ( .A(R_DATA_VALID), .B(n49), .Y(n1) );
  OAI221X1M U88 ( .A0(n26), .A1(n27), .B0(n51), .B1(n6), .C0(n9), .Y(
        next_state[2]) );
  NAND3X2M U89 ( .A(n24), .B(n15), .C(n57), .Y(n26) );
  NAND4X2M U90 ( .A(SYNC_BUS[6]), .B(SYNC_BUS[2]), .C(n29), .D(n30), .Y(n27)
         );
  INVX2M U91 ( .A(CLK_GATE_EN), .Y(n9) );
  OAI22X1M U92 ( .A0(n57), .A1(n7), .B0(n52), .B1(n14), .Y(n73) );
  OAI22X1M U93 ( .A0(n53), .A1(n7), .B0(n52), .B1(n13), .Y(n74) );
  OAI22X1M U94 ( .A0(n28), .A1(n7), .B0(n52), .B1(n12), .Y(n75) );
  OAI2BB2X1M U95 ( .B0(n66), .B1(n7), .A0N(n7), .A1N(\comb_reg_address[0] ), 
        .Y(n72) );
  AOI21X2M U96 ( .A0(n39), .A1(n40), .B0(n25), .Y(n37) );
  NAND4X2M U97 ( .A(SYNC_BUS[6]), .B(SYNC_BUS[2]), .C(n57), .D(n24), .Y(n40)
         );
  NAND4X2M U98 ( .A(SYNC_BUS[5]), .B(SYNC_BUS[1]), .C(n53), .D(n23), .Y(n39)
         );
  INVX2M U99 ( .A(SYNC_BUS[6]), .Y(n23) );
  INVX2M U100 ( .A(SYNC_BUS[5]), .Y(n24) );
  CLKXOR2X2M U101 ( .A(n25), .B(SYNC_BUS[0]), .Y(n29) );
  INVX2M U102 ( .A(SYNC_BUS[7]), .Y(n22) );
  INVX2M U103 ( .A(SYNC_BUS[4]), .Y(n25) );
  AO2B2X2M U104 ( .B0(ALU_OUT[8]), .B1(n2), .A0(W_DATA_2[0]), .A1N(n3), .Y(n76) );
  AO2B2X2M U105 ( .B0(ALU_OUT[9]), .B1(n54), .A0(W_DATA_2[1]), .A1N(n2), .Y(
        n77) );
  AO2B2X2M U106 ( .B0(ALU_OUT[10]), .B1(n3), .A0(W_DATA_2[2]), .A1N(n54), .Y(
        n78) );
  AO2B2X2M U107 ( .B0(ALU_OUT[11]), .B1(n2), .A0(W_DATA_2[3]), .A1N(n3), .Y(
        n79) );
  AO2B2X2M U108 ( .B0(ALU_OUT[12]), .B1(n54), .A0(W_DATA_2[4]), .A1N(n2), .Y(
        n80) );
  AO2B2X2M U109 ( .B0(ALU_OUT[13]), .B1(n3), .A0(W_DATA_2[5]), .A1N(n2), .Y(
        n81) );
  AO2B2X2M U110 ( .B0(ALU_OUT[14]), .B1(n2), .A0(W_DATA_2[6]), .A1N(n3), .Y(
        n82) );
  AO2B2X2M U111 ( .B0(ALU_OUT[15]), .B1(n54), .A0(W_DATA_2[7]), .A1N(n2), .Y(
        n83) );
endmodule


module Reg_file_DATA_WIDTH8_ADDRESS_BITS3 ( CLK, RST, R_REG_EN, W_REG_EN, 
        REG_ADDRESS, W_REG_DATA, R_DATA_VALID, R_REG_DATA, REG0, REG1, REG2, 
        REG3 );
  input [3:0] REG_ADDRESS;
  input [7:0] W_REG_DATA;
  output [7:0] R_REG_DATA;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, R_REG_EN, W_REG_EN;
  output R_DATA_VALID;
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
         \Reg_file[4][0] , N35, N36, N37, N38, N39, N40, N41, N42, N59, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224;
  assign N10 = REG_ADDRESS[0];
  assign N11 = REG_ADDRESS[1];
  assign N12 = REG_ADDRESS[2];
  assign N13 = REG_ADDRESS[3];

  DFFQX2M \R_REG_DATA_reg[7]  ( .D(n48), .CK(CLK), .Q(R_REG_DATA[7]) );
  DFFQX2M \R_REG_DATA_reg[6]  ( .D(n47), .CK(CLK), .Q(R_REG_DATA[6]) );
  DFFQX2M \R_REG_DATA_reg[5]  ( .D(n46), .CK(CLK), .Q(R_REG_DATA[5]) );
  DFFQX2M \R_REG_DATA_reg[4]  ( .D(n45), .CK(CLK), .Q(R_REG_DATA[4]) );
  DFFQX2M \R_REG_DATA_reg[3]  ( .D(n44), .CK(CLK), .Q(R_REG_DATA[3]) );
  DFFQX2M \R_REG_DATA_reg[2]  ( .D(n43), .CK(CLK), .Q(R_REG_DATA[2]) );
  DFFQX2M \R_REG_DATA_reg[1]  ( .D(n42), .CK(CLK), .Q(R_REG_DATA[1]) );
  DFFQX2M \R_REG_DATA_reg[0]  ( .D(n41), .CK(CLK), .Q(R_REG_DATA[0]) );
  DFFRQX2M \Reg_file_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][7] ) );
  DFFRQX2M \Reg_file_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][6] ) );
  DFFRQX2M \Reg_file_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][5] ) );
  DFFRQX2M \Reg_file_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][4] ) );
  DFFRQX2M \Reg_file_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][3] ) );
  DFFRQX2M \Reg_file_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][2] ) );
  DFFRQX2M \Reg_file_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][1] ) );
  DFFRQX2M \Reg_file_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n212), .Q(
        \Reg_file[13][0] ) );
  DFFRQX2M \Reg_file_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][7] ) );
  DFFRQX2M \Reg_file_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][6] ) );
  DFFRQX2M \Reg_file_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][5] ) );
  DFFRQX2M \Reg_file_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][4] ) );
  DFFRQX2M \Reg_file_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][3] ) );
  DFFRQX2M \Reg_file_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][2] ) );
  DFFRQX2M \Reg_file_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n210), .Q(
        \Reg_file[9][1] ) );
  DFFRQX2M \Reg_file_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n212), .Q(
        \Reg_file[9][0] ) );
  DFFRQX2M \Reg_file_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n209), .Q(
        \Reg_file[5][7] ) );
  DFFRQX2M \Reg_file_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n209), .Q(
        \Reg_file[5][6] ) );
  DFFRQX2M \Reg_file_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n209), .Q(
        \Reg_file[5][5] ) );
  DFFRQX2M \Reg_file_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n209), .Q(
        \Reg_file[5][4] ) );
  DFFRQX2M \Reg_file_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n208), .Q(
        \Reg_file[5][3] ) );
  DFFRQX2M \Reg_file_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n208), .Q(
        \Reg_file[5][2] ) );
  DFFRQX2M \Reg_file_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n208), .Q(
        \Reg_file[5][1] ) );
  DFFRQX2M \Reg_file_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n208), .Q(
        \Reg_file[5][0] ) );
  DFFRQX2M \Reg_file_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n206), .Q(
        \Reg_file[15][7] ) );
  DFFRQX2M \Reg_file_reg[15][6]  ( .D(n175), .CK(CLK), .RN(RST), .Q(
        \Reg_file[15][6] ) );
  DFFRQX2M \Reg_file_reg[15][5]  ( .D(n174), .CK(CLK), .RN(RST), .Q(
        \Reg_file[15][5] ) );
  DFFRQX2M \Reg_file_reg[15][4]  ( .D(n173), .CK(CLK), .RN(RST), .Q(
        \Reg_file[15][4] ) );
  DFFRQX2M \Reg_file_reg[15][3]  ( .D(n172), .CK(CLK), .RN(RST), .Q(
        \Reg_file[15][3] ) );
  DFFRQX2M \Reg_file_reg[15][2]  ( .D(n171), .CK(CLK), .RN(RST), .Q(
        \Reg_file[15][2] ) );
  DFFRQX2M \Reg_file_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n211), .Q(
        \Reg_file[15][1] ) );
  DFFRQX2M \Reg_file_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n210), .Q(
        \Reg_file[15][0] ) );
  DFFRQX2M \Reg_file_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][7] ) );
  DFFRQX2M \Reg_file_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][6] ) );
  DFFRQX2M \Reg_file_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][5] ) );
  DFFRQX2M \Reg_file_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][4] ) );
  DFFRQX2M \Reg_file_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][3] ) );
  DFFRQX2M \Reg_file_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][2] ) );
  DFFRQX2M \Reg_file_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][1] ) );
  DFFRQX2M \Reg_file_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n211), .Q(
        \Reg_file[11][0] ) );
  DFFRQX2M \Reg_file_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n211), .Q(
        \Reg_file[7][7] ) );
  DFFRQX2M \Reg_file_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n210), .Q(
        \Reg_file[7][6] ) );
  DFFRQX2M \Reg_file_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n206), .Q(
        \Reg_file[7][5] ) );
  DFFRQX2M \Reg_file_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n212), .Q(
        \Reg_file[7][4] ) );
  DFFRQX2M \Reg_file_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n211), .Q(
        \Reg_file[7][3] ) );
  DFFRQX2M \Reg_file_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n209), .Q(
        \Reg_file[7][2] ) );
  DFFRQX2M \Reg_file_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n209), .Q(
        \Reg_file[7][1] ) );
  DFFRQX2M \Reg_file_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n209), .Q(
        \Reg_file[7][0] ) );
  DFFRQX2M \Reg_file_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][7] ) );
  DFFRQX2M \Reg_file_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][6] ) );
  DFFRQX2M \Reg_file_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][5] ) );
  DFFRQX2M \Reg_file_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][4] ) );
  DFFRQX2M \Reg_file_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][3] ) );
  DFFRQX2M \Reg_file_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][2] ) );
  DFFRQX2M \Reg_file_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][1] ) );
  DFFRQX2M \Reg_file_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \Reg_file[14][0] ) );
  DFFRQX2M \Reg_file_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][7] ) );
  DFFRQX2M \Reg_file_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][6] ) );
  DFFRQX2M \Reg_file_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][5] ) );
  DFFRQX2M \Reg_file_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][4] ) );
  DFFRQX2M \Reg_file_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][3] ) );
  DFFRQX2M \Reg_file_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][2] ) );
  DFFRQX2M \Reg_file_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][1] ) );
  DFFRQX2M \Reg_file_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \Reg_file[10][0] ) );
  DFFRQX2M \Reg_file_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][7] ) );
  DFFRQX2M \Reg_file_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][6] ) );
  DFFRQX2M \Reg_file_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][5] ) );
  DFFRQX2M \Reg_file_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][4] ) );
  DFFRQX2M \Reg_file_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][3] ) );
  DFFRQX2M \Reg_file_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][2] ) );
  DFFRQX2M \Reg_file_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][1] ) );
  DFFRQX2M \Reg_file_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n209), .Q(
        \Reg_file[6][0] ) );
  DFFRQX2M \Reg_file_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n212), .Q(
        \Reg_file[12][7] ) );
  DFFRQX2M \Reg_file_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][6] ) );
  DFFRQX2M \Reg_file_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][5] ) );
  DFFRQX2M \Reg_file_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][4] ) );
  DFFRQX2M \Reg_file_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][3] ) );
  DFFRQX2M \Reg_file_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][2] ) );
  DFFRQX2M \Reg_file_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][1] ) );
  DFFRQX2M \Reg_file_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \Reg_file[12][0] ) );
  DFFRQX2M \Reg_file_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n210), .Q(
        \Reg_file[8][7] ) );
  DFFRQX2M \Reg_file_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n206), .Q(
        \Reg_file[8][6] ) );
  DFFRQX2M \Reg_file_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n212), .Q(
        \Reg_file[8][5] ) );
  DFFRQX2M \Reg_file_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n211), .Q(
        \Reg_file[8][4] ) );
  DFFRQX2M \Reg_file_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n210), .Q(
        \Reg_file[8][3] ) );
  DFFRQX2M \Reg_file_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n206), .Q(
        \Reg_file[8][2] ) );
  DFFRQX2M \Reg_file_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n212), .Q(
        \Reg_file[8][1] ) );
  DFFRQX2M \Reg_file_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n206), .Q(
        \Reg_file[8][0] ) );
  DFFRQX2M \Reg_file_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][7] ) );
  DFFRQX2M \Reg_file_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][6] ) );
  DFFRQX2M \Reg_file_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][5] ) );
  DFFRQX2M \Reg_file_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][4] ) );
  DFFRQX2M \Reg_file_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][3] ) );
  DFFRQX2M \Reg_file_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][2] ) );
  DFFRQX2M \Reg_file_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][1] ) );
  DFFRQX2M \Reg_file_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n208), .Q(
        \Reg_file[4][0] ) );
  DFFRQX2M \Reg_file_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n207), .Q(REG3[0]) );
  DFFRQX2M \Reg_file_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n207), .Q(REG2[1]) );
  DFFRQX2M R_DATA_VALID_reg ( .D(N59), .CK(CLK), .RN(n206), .Q(R_DATA_VALID)
         );
  DFFSQX2M \Reg_file_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n206), .Q(REG3[5]) );
  DFFRQX2M \Reg_file_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n207), .Q(REG3[1]) );
  DFFRQX2M \Reg_file_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n208), .Q(REG3[4]) );
  DFFRQX2M \Reg_file_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n208), .Q(REG3[6]) );
  DFFRQX2M \Reg_file_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n207), .Q(REG3[3]) );
  DFFRQX2M \Reg_file_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n207), .Q(REG3[2]) );
  DFFRQX2M \Reg_file_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n208), .Q(REG3[7]) );
  DFFSQX2M \Reg_file_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n206), .Q(REG2[0]) );
  DFFRQX2M \Reg_file_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n207), .Q(REG2[4]) );
  DFFRQX2M \Reg_file_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n207), .Q(REG2[2]) );
  DFFRQX2M \Reg_file_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n207), .Q(REG2[3]) );
  DFFSQX2M \Reg_file_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n206), .Q(REG2[7]) );
  DFFRQX2M \Reg_file_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n207), .Q(REG2[5]) );
  DFFRQX2M \Reg_file_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n207), .Q(REG2[6]) );
  DFFRQX2M \Reg_file_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n206), .Q(REG0[1]) );
  DFFRQX2M \Reg_file_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n206), .Q(REG0[0]) );
  DFFRQX2M \Reg_file_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n206), .Q(REG0[2]) );
  DFFRQX2M \Reg_file_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n206), .Q(REG0[3]) );
  DFFRQX2M \Reg_file_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n206), .Q(REG0[4]) );
  DFFRQX2M \Reg_file_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n206), .Q(REG0[5]) );
  DFFRQX2M \Reg_file_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n206), .Q(REG0[7]) );
  DFFRQX2M \Reg_file_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n206), .Q(REG0[6]) );
  DFFRQX2M \Reg_file_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n207), .Q(REG1[6]) );
  DFFRQX2M \Reg_file_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n206), .Q(REG1[1]) );
  DFFRQX2M \Reg_file_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n207), .Q(REG1[5]) );
  DFFRQX2M \Reg_file_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n207), .Q(REG1[4]) );
  DFFRQX2M \Reg_file_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n207), .Q(REG1[7]) );
  DFFRQX2M \Reg_file_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n206), .Q(REG1[3]) );
  DFFRQX2M \Reg_file_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n207), .Q(REG1[2]) );
  DFFRQX2M \Reg_file_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n206), .Q(REG1[0]) );
  NOR2BX2M U3 ( .AN(n39), .B(n203), .Y(n33) );
  NOR2BX2M U4 ( .AN(n28), .B(n203), .Y(n19) );
  NOR2BX2M U5 ( .AN(N12), .B(n199), .Y(n24) );
  NOR2BX2M U6 ( .AN(N12), .B(n204), .Y(n27) );
  NOR2X2M U7 ( .A(n204), .B(N12), .Y(n21) );
  NOR2X2M U8 ( .A(n199), .B(N12), .Y(n16) );
  INVX2M U9 ( .A(n200), .Y(n201) );
  INVX2M U10 ( .A(n198), .Y(n199) );
  INVX2M U11 ( .A(n213), .Y(n212) );
  INVX2M U12 ( .A(n216), .Y(n207) );
  INVX2M U13 ( .A(n216), .Y(n208) );
  INVX2M U14 ( .A(n215), .Y(n209) );
  INVX2M U15 ( .A(n214), .Y(n210) );
  INVX2M U16 ( .A(n214), .Y(n211) );
  INVX2M U17 ( .A(n200), .Y(n202) );
  BUFX2M U18 ( .A(n203), .Y(n200) );
  NOR2BX2M U19 ( .AN(N59), .B(n12), .Y(n13) );
  OR2X2M U20 ( .A(n14), .B(n213), .Y(n12) );
  BUFX2M U21 ( .A(n204), .Y(n198) );
  BUFX2M U22 ( .A(n205), .Y(n213) );
  BUFX2M U23 ( .A(n205), .Y(n214) );
  BUFX2M U24 ( .A(n214), .Y(n216) );
  BUFX2M U25 ( .A(n214), .Y(n215) );
  INVX2M U26 ( .A(n214), .Y(n206) );
  NOR2BX2M U27 ( .AN(n39), .B(N10), .Y(n31) );
  NAND2X2M U28 ( .A(n31), .B(n16), .Y(n30) );
  NAND2X2M U29 ( .A(n33), .B(n16), .Y(n32) );
  NAND2X2M U30 ( .A(n31), .B(n21), .Y(n34) );
  NAND2X2M U31 ( .A(n33), .B(n21), .Y(n35) );
  NAND2X2M U32 ( .A(n31), .B(n24), .Y(n36) );
  NAND2X2M U33 ( .A(n33), .B(n24), .Y(n37) );
  NAND2X2M U34 ( .A(n31), .B(n27), .Y(n38) );
  NAND2X2M U35 ( .A(n33), .B(n27), .Y(n40) );
  NOR2BX2M U36 ( .AN(n28), .B(N10), .Y(n17) );
  NAND2X2M U37 ( .A(n19), .B(n16), .Y(n18) );
  NAND2X2M U38 ( .A(n21), .B(n17), .Y(n20) );
  NAND2X2M U39 ( .A(n21), .B(n19), .Y(n22) );
  NAND2X2M U40 ( .A(n24), .B(n17), .Y(n23) );
  NAND2X2M U41 ( .A(n24), .B(n19), .Y(n25) );
  NAND2X2M U42 ( .A(n27), .B(n17), .Y(n26) );
  NAND2X2M U43 ( .A(n27), .B(n19), .Y(n29) );
  NAND2X2M U44 ( .A(n16), .B(n17), .Y(n15) );
  NOR2BX2M U45 ( .AN(W_REG_EN), .B(R_REG_EN), .Y(n14) );
  NOR2BX2M U46 ( .AN(R_REG_EN), .B(W_REG_EN), .Y(N59) );
  AND2X2M U47 ( .A(N13), .B(n14), .Y(n39) );
  INVX2M U48 ( .A(W_REG_DATA[0]), .Y(n217) );
  INVX2M U49 ( .A(W_REG_DATA[2]), .Y(n219) );
  INVX2M U50 ( .A(W_REG_DATA[3]), .Y(n220) );
  INVX2M U51 ( .A(W_REG_DATA[4]), .Y(n221) );
  INVX2M U52 ( .A(W_REG_DATA[5]), .Y(n222) );
  INVX2M U53 ( .A(W_REG_DATA[6]), .Y(n223) );
  INVX2M U54 ( .A(W_REG_DATA[7]), .Y(n224) );
  INVX2M U55 ( .A(W_REG_DATA[1]), .Y(n218) );
  NOR2BX2M U56 ( .AN(n14), .B(N13), .Y(n28) );
  INVX2M U57 ( .A(RST), .Y(n205) );
  OAI2BB2X1M U58 ( .B0(n217), .B1(n30), .A0N(\Reg_file[8][0] ), .A1N(n30), .Y(
        n113) );
  OAI2BB2X1M U59 ( .B0(n218), .B1(n30), .A0N(\Reg_file[8][1] ), .A1N(n30), .Y(
        n114) );
  OAI2BB2X1M U60 ( .B0(n219), .B1(n30), .A0N(\Reg_file[8][2] ), .A1N(n30), .Y(
        n115) );
  OAI2BB2X1M U61 ( .B0(n220), .B1(n30), .A0N(\Reg_file[8][3] ), .A1N(n30), .Y(
        n116) );
  OAI2BB2X1M U62 ( .B0(n221), .B1(n30), .A0N(\Reg_file[8][4] ), .A1N(n30), .Y(
        n117) );
  OAI2BB2X1M U63 ( .B0(n222), .B1(n30), .A0N(\Reg_file[8][5] ), .A1N(n30), .Y(
        n118) );
  OAI2BB2X1M U64 ( .B0(n223), .B1(n30), .A0N(\Reg_file[8][6] ), .A1N(n30), .Y(
        n119) );
  OAI2BB2X1M U65 ( .B0(n224), .B1(n30), .A0N(\Reg_file[8][7] ), .A1N(n30), .Y(
        n120) );
  OAI2BB2X1M U66 ( .B0(n217), .B1(n32), .A0N(\Reg_file[9][0] ), .A1N(n32), .Y(
        n121) );
  OAI2BB2X1M U67 ( .B0(n218), .B1(n32), .A0N(\Reg_file[9][1] ), .A1N(n32), .Y(
        n122) );
  OAI2BB2X1M U68 ( .B0(n219), .B1(n32), .A0N(\Reg_file[9][2] ), .A1N(n32), .Y(
        n123) );
  OAI2BB2X1M U69 ( .B0(n220), .B1(n32), .A0N(\Reg_file[9][3] ), .A1N(n32), .Y(
        n124) );
  OAI2BB2X1M U70 ( .B0(n221), .B1(n32), .A0N(\Reg_file[9][4] ), .A1N(n32), .Y(
        n125) );
  OAI2BB2X1M U71 ( .B0(n222), .B1(n32), .A0N(\Reg_file[9][5] ), .A1N(n32), .Y(
        n126) );
  OAI2BB2X1M U72 ( .B0(n223), .B1(n32), .A0N(\Reg_file[9][6] ), .A1N(n32), .Y(
        n127) );
  OAI2BB2X1M U73 ( .B0(n224), .B1(n32), .A0N(\Reg_file[9][7] ), .A1N(n32), .Y(
        n128) );
  OAI2BB2X1M U74 ( .B0(n217), .B1(n34), .A0N(\Reg_file[10][0] ), .A1N(n34), 
        .Y(n129) );
  OAI2BB2X1M U75 ( .B0(n218), .B1(n34), .A0N(\Reg_file[10][1] ), .A1N(n34), 
        .Y(n130) );
  OAI2BB2X1M U76 ( .B0(n219), .B1(n34), .A0N(\Reg_file[10][2] ), .A1N(n34), 
        .Y(n131) );
  OAI2BB2X1M U77 ( .B0(n220), .B1(n34), .A0N(\Reg_file[10][3] ), .A1N(n34), 
        .Y(n132) );
  OAI2BB2X1M U78 ( .B0(n221), .B1(n34), .A0N(\Reg_file[10][4] ), .A1N(n34), 
        .Y(n133) );
  OAI2BB2X1M U79 ( .B0(n222), .B1(n34), .A0N(\Reg_file[10][5] ), .A1N(n34), 
        .Y(n134) );
  OAI2BB2X1M U80 ( .B0(n223), .B1(n34), .A0N(\Reg_file[10][6] ), .A1N(n34), 
        .Y(n135) );
  OAI2BB2X1M U81 ( .B0(n224), .B1(n34), .A0N(\Reg_file[10][7] ), .A1N(n34), 
        .Y(n136) );
  OAI2BB2X1M U82 ( .B0(n217), .B1(n35), .A0N(\Reg_file[11][0] ), .A1N(n35), 
        .Y(n137) );
  OAI2BB2X1M U83 ( .B0(n218), .B1(n35), .A0N(\Reg_file[11][1] ), .A1N(n35), 
        .Y(n138) );
  OAI2BB2X1M U84 ( .B0(n219), .B1(n35), .A0N(\Reg_file[11][2] ), .A1N(n35), 
        .Y(n139) );
  OAI2BB2X1M U85 ( .B0(n220), .B1(n35), .A0N(\Reg_file[11][3] ), .A1N(n35), 
        .Y(n140) );
  OAI2BB2X1M U86 ( .B0(n221), .B1(n35), .A0N(\Reg_file[11][4] ), .A1N(n35), 
        .Y(n141) );
  OAI2BB2X1M U87 ( .B0(n222), .B1(n35), .A0N(\Reg_file[11][5] ), .A1N(n35), 
        .Y(n142) );
  OAI2BB2X1M U88 ( .B0(n223), .B1(n35), .A0N(\Reg_file[11][6] ), .A1N(n35), 
        .Y(n143) );
  OAI2BB2X1M U89 ( .B0(n224), .B1(n35), .A0N(\Reg_file[11][7] ), .A1N(n35), 
        .Y(n144) );
  OAI2BB2X1M U90 ( .B0(n217), .B1(n36), .A0N(\Reg_file[12][0] ), .A1N(n36), 
        .Y(n145) );
  OAI2BB2X1M U91 ( .B0(n218), .B1(n36), .A0N(\Reg_file[12][1] ), .A1N(n36), 
        .Y(n146) );
  OAI2BB2X1M U92 ( .B0(n219), .B1(n36), .A0N(\Reg_file[12][2] ), .A1N(n36), 
        .Y(n147) );
  OAI2BB2X1M U93 ( .B0(n220), .B1(n36), .A0N(\Reg_file[12][3] ), .A1N(n36), 
        .Y(n148) );
  OAI2BB2X1M U94 ( .B0(n221), .B1(n36), .A0N(\Reg_file[12][4] ), .A1N(n36), 
        .Y(n149) );
  OAI2BB2X1M U95 ( .B0(n222), .B1(n36), .A0N(\Reg_file[12][5] ), .A1N(n36), 
        .Y(n150) );
  OAI2BB2X1M U96 ( .B0(n223), .B1(n36), .A0N(\Reg_file[12][6] ), .A1N(n36), 
        .Y(n151) );
  OAI2BB2X1M U97 ( .B0(n224), .B1(n36), .A0N(\Reg_file[12][7] ), .A1N(n36), 
        .Y(n152) );
  OAI2BB2X1M U98 ( .B0(n217), .B1(n37), .A0N(\Reg_file[13][0] ), .A1N(n37), 
        .Y(n153) );
  OAI2BB2X1M U99 ( .B0(n218), .B1(n37), .A0N(\Reg_file[13][1] ), .A1N(n37), 
        .Y(n154) );
  OAI2BB2X1M U100 ( .B0(n219), .B1(n37), .A0N(\Reg_file[13][2] ), .A1N(n37), 
        .Y(n155) );
  OAI2BB2X1M U101 ( .B0(n220), .B1(n37), .A0N(\Reg_file[13][3] ), .A1N(n37), 
        .Y(n156) );
  OAI2BB2X1M U102 ( .B0(n221), .B1(n37), .A0N(\Reg_file[13][4] ), .A1N(n37), 
        .Y(n157) );
  OAI2BB2X1M U103 ( .B0(n222), .B1(n37), .A0N(\Reg_file[13][5] ), .A1N(n37), 
        .Y(n158) );
  OAI2BB2X1M U104 ( .B0(n223), .B1(n37), .A0N(\Reg_file[13][6] ), .A1N(n37), 
        .Y(n159) );
  OAI2BB2X1M U105 ( .B0(n224), .B1(n37), .A0N(\Reg_file[13][7] ), .A1N(n37), 
        .Y(n160) );
  OAI2BB2X1M U106 ( .B0(n217), .B1(n38), .A0N(\Reg_file[14][0] ), .A1N(n38), 
        .Y(n161) );
  OAI2BB2X1M U107 ( .B0(n218), .B1(n38), .A0N(\Reg_file[14][1] ), .A1N(n38), 
        .Y(n162) );
  OAI2BB2X1M U108 ( .B0(n219), .B1(n38), .A0N(\Reg_file[14][2] ), .A1N(n38), 
        .Y(n163) );
  OAI2BB2X1M U109 ( .B0(n220), .B1(n38), .A0N(\Reg_file[14][3] ), .A1N(n38), 
        .Y(n164) );
  OAI2BB2X1M U110 ( .B0(n221), .B1(n38), .A0N(\Reg_file[14][4] ), .A1N(n38), 
        .Y(n165) );
  OAI2BB2X1M U111 ( .B0(n222), .B1(n38), .A0N(\Reg_file[14][5] ), .A1N(n38), 
        .Y(n166) );
  OAI2BB2X1M U112 ( .B0(n223), .B1(n38), .A0N(\Reg_file[14][6] ), .A1N(n38), 
        .Y(n167) );
  OAI2BB2X1M U113 ( .B0(n224), .B1(n38), .A0N(\Reg_file[14][7] ), .A1N(n38), 
        .Y(n168) );
  OAI2BB2X1M U114 ( .B0(n217), .B1(n40), .A0N(\Reg_file[15][0] ), .A1N(n40), 
        .Y(n169) );
  OAI2BB2X1M U115 ( .B0(n218), .B1(n40), .A0N(\Reg_file[15][1] ), .A1N(n40), 
        .Y(n170) );
  OAI2BB2X1M U116 ( .B0(n219), .B1(n40), .A0N(\Reg_file[15][2] ), .A1N(n40), 
        .Y(n171) );
  OAI2BB2X1M U117 ( .B0(n220), .B1(n40), .A0N(\Reg_file[15][3] ), .A1N(n40), 
        .Y(n172) );
  OAI2BB2X1M U118 ( .B0(n221), .B1(n40), .A0N(\Reg_file[15][4] ), .A1N(n40), 
        .Y(n173) );
  OAI2BB2X1M U119 ( .B0(n222), .B1(n40), .A0N(\Reg_file[15][5] ), .A1N(n40), 
        .Y(n174) );
  OAI2BB2X1M U120 ( .B0(n223), .B1(n40), .A0N(\Reg_file[15][6] ), .A1N(n40), 
        .Y(n175) );
  OAI2BB2X1M U121 ( .B0(n224), .B1(n40), .A0N(\Reg_file[15][7] ), .A1N(n40), 
        .Y(n176) );
  AO22X1M U122 ( .A0(R_REG_DATA[0]), .A1(n12), .B0(N42), .B1(n13), .Y(n41) );
  MX4X1M U123 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N13), .S1(N12), .Y(N42) );
  MX4X1M U124 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N10), 
        .S1(n199), .Y(n4) );
  MX4X1M U125 ( .A(\Reg_file[8][0] ), .B(\Reg_file[9][0] ), .C(
        \Reg_file[10][0] ), .D(\Reg_file[11][0] ), .S0(N10), .S1(n199), .Y(n2)
         );
  AO22X1M U126 ( .A0(R_REG_DATA[1]), .A1(n12), .B0(N41), .B1(n13), .Y(n42) );
  MX4X1M U127 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N13), .S1(N12), .Y(N41) );
  MX4X1M U128 ( .A(\Reg_file[8][1] ), .B(\Reg_file[9][1] ), .C(
        \Reg_file[10][1] ), .D(\Reg_file[11][1] ), .S0(N10), .S1(n199), .Y(n6)
         );
  MX4X1M U129 ( .A(\Reg_file[12][1] ), .B(\Reg_file[13][1] ), .C(
        \Reg_file[14][1] ), .D(\Reg_file[15][1] ), .S0(n201), .S1(n199), .Y(n5) );
  AO22X1M U130 ( .A0(R_REG_DATA[2]), .A1(n12), .B0(N40), .B1(n13), .Y(n43) );
  MX4X1M U131 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N13), .S1(N12), .Y(N40) );
  MX4X1M U132 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(n199), .Y(n177) );
  MX4X1M U133 ( .A(\Reg_file[8][2] ), .B(\Reg_file[9][2] ), .C(
        \Reg_file[10][2] ), .D(\Reg_file[11][2] ), .S0(n201), .S1(n199), .Y(
        n10) );
  AO22X1M U134 ( .A0(R_REG_DATA[3]), .A1(n12), .B0(N39), .B1(n13), .Y(n44) );
  MX4X1M U135 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N13), .S1(N12), 
        .Y(N39) );
  MX4X1M U136 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(n199), .Y(n181) );
  MX4X1M U137 ( .A(\Reg_file[8][3] ), .B(\Reg_file[9][3] ), .C(
        \Reg_file[10][3] ), .D(\Reg_file[11][3] ), .S0(n201), .S1(n199), .Y(
        n179) );
  AO22X1M U138 ( .A0(R_REG_DATA[4]), .A1(n12), .B0(N38), .B1(n13), .Y(n45) );
  MX4X1M U139 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N13), .S1(N12), 
        .Y(N38) );
  MX4X1M U140 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(n199), .Y(n185) );
  MX4X1M U141 ( .A(\Reg_file[8][4] ), .B(\Reg_file[9][4] ), .C(
        \Reg_file[10][4] ), .D(\Reg_file[11][4] ), .S0(n201), .S1(n199), .Y(
        n183) );
  AO22X1M U142 ( .A0(R_REG_DATA[5]), .A1(n12), .B0(N37), .B1(n13), .Y(n46) );
  MX4X1M U143 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N13), .S1(N12), 
        .Y(N37) );
  MX4X1M U144 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N11), .Y(n189) );
  MX4X1M U145 ( .A(\Reg_file[8][5] ), .B(\Reg_file[9][5] ), .C(
        \Reg_file[10][5] ), .D(\Reg_file[11][5] ), .S0(n202), .S1(N11), .Y(
        n187) );
  AO22X1M U146 ( .A0(R_REG_DATA[6]), .A1(n12), .B0(N36), .B1(n13), .Y(n47) );
  MX4X1M U147 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N13), .S1(N12), 
        .Y(N36) );
  MX4X1M U148 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N11), .Y(n193) );
  MX4X1M U149 ( .A(\Reg_file[8][6] ), .B(\Reg_file[9][6] ), .C(
        \Reg_file[10][6] ), .D(\Reg_file[11][6] ), .S0(n202), .S1(N11), .Y(
        n191) );
  AO22X1M U150 ( .A0(R_REG_DATA[7]), .A1(n12), .B0(N35), .B1(n13), .Y(n48) );
  MX4X1M U151 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N13), .S1(N12), 
        .Y(N35) );
  MX4X1M U152 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N11), .Y(n197) );
  MX4X1M U153 ( .A(\Reg_file[8][7] ), .B(\Reg_file[9][7] ), .C(
        \Reg_file[10][7] ), .D(\Reg_file[11][7] ), .S0(n202), .S1(N11), .Y(
        n195) );
  MX4X1M U154 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(n199), .Y(n8) );
  MX4X1M U155 ( .A(\Reg_file[4][0] ), .B(\Reg_file[5][0] ), .C(
        \Reg_file[6][0] ), .D(\Reg_file[7][0] ), .S0(N10), .S1(n199), .Y(n3)
         );
  MX4X1M U156 ( .A(\Reg_file[4][1] ), .B(\Reg_file[5][1] ), .C(
        \Reg_file[6][1] ), .D(\Reg_file[7][1] ), .S0(n201), .S1(n199), .Y(n7)
         );
  MX4X1M U157 ( .A(\Reg_file[4][2] ), .B(\Reg_file[5][2] ), .C(
        \Reg_file[6][2] ), .D(\Reg_file[7][2] ), .S0(n201), .S1(n199), .Y(n11)
         );
  MX4X1M U158 ( .A(\Reg_file[4][3] ), .B(\Reg_file[5][3] ), .C(
        \Reg_file[6][3] ), .D(\Reg_file[7][3] ), .S0(n201), .S1(n199), .Y(n180) );
  MX4X1M U159 ( .A(\Reg_file[4][4] ), .B(\Reg_file[5][4] ), .C(
        \Reg_file[6][4] ), .D(\Reg_file[7][4] ), .S0(n201), .S1(n199), .Y(n184) );
  MX4X1M U160 ( .A(\Reg_file[4][5] ), .B(\Reg_file[5][5] ), .C(
        \Reg_file[6][5] ), .D(\Reg_file[7][5] ), .S0(n202), .S1(n199), .Y(n188) );
  MX4X1M U161 ( .A(\Reg_file[4][6] ), .B(\Reg_file[5][6] ), .C(
        \Reg_file[6][6] ), .D(\Reg_file[7][6] ), .S0(n202), .S1(N11), .Y(n192)
         );
  MX4X1M U162 ( .A(\Reg_file[4][7] ), .B(\Reg_file[5][7] ), .C(
        \Reg_file[6][7] ), .D(\Reg_file[7][7] ), .S0(n202), .S1(N11), .Y(n196)
         );
  MX4X1M U163 ( .A(\Reg_file[12][0] ), .B(\Reg_file[13][0] ), .C(
        \Reg_file[14][0] ), .D(\Reg_file[15][0] ), .S0(n202), .S1(n199), .Y(n1) );
  MX4X1M U164 ( .A(\Reg_file[12][2] ), .B(\Reg_file[13][2] ), .C(
        \Reg_file[14][2] ), .D(\Reg_file[15][2] ), .S0(n201), .S1(n199), .Y(n9) );
  MX4X1M U165 ( .A(\Reg_file[12][3] ), .B(\Reg_file[13][3] ), .C(
        \Reg_file[14][3] ), .D(\Reg_file[15][3] ), .S0(n201), .S1(n199), .Y(
        n178) );
  MX4X1M U166 ( .A(\Reg_file[12][4] ), .B(\Reg_file[13][4] ), .C(
        \Reg_file[14][4] ), .D(\Reg_file[15][4] ), .S0(n201), .S1(n199), .Y(
        n182) );
  MX4X1M U167 ( .A(\Reg_file[12][5] ), .B(\Reg_file[13][5] ), .C(
        \Reg_file[14][5] ), .D(\Reg_file[15][5] ), .S0(n202), .S1(n199), .Y(
        n186) );
  MX4X1M U168 ( .A(\Reg_file[12][6] ), .B(\Reg_file[13][6] ), .C(
        \Reg_file[14][6] ), .D(\Reg_file[15][6] ), .S0(n202), .S1(n199), .Y(
        n190) );
  MX4X1M U169 ( .A(\Reg_file[12][7] ), .B(\Reg_file[13][7] ), .C(
        \Reg_file[14][7] ), .D(\Reg_file[15][7] ), .S0(n202), .S1(n199), .Y(
        n194) );
  INVX2M U170 ( .A(N10), .Y(n203) );
  OAI2BB2X1M U171 ( .B0(n15), .B1(n217), .A0N(REG0[0]), .A1N(n15), .Y(n49) );
  OAI2BB2X1M U172 ( .B0(n15), .B1(n218), .A0N(REG0[1]), .A1N(n15), .Y(n50) );
  OAI2BB2X1M U173 ( .B0(n15), .B1(n219), .A0N(REG0[2]), .A1N(n15), .Y(n51) );
  OAI2BB2X1M U174 ( .B0(n15), .B1(n220), .A0N(REG0[3]), .A1N(n15), .Y(n52) );
  OAI2BB2X1M U175 ( .B0(n15), .B1(n221), .A0N(REG0[4]), .A1N(n15), .Y(n53) );
  OAI2BB2X1M U176 ( .B0(n15), .B1(n222), .A0N(REG0[5]), .A1N(n15), .Y(n54) );
  OAI2BB2X1M U177 ( .B0(n15), .B1(n223), .A0N(REG0[6]), .A1N(n15), .Y(n55) );
  OAI2BB2X1M U178 ( .B0(n15), .B1(n224), .A0N(REG0[7]), .A1N(n15), .Y(n56) );
  OAI2BB2X1M U179 ( .B0(n217), .B1(n18), .A0N(REG1[0]), .A1N(n18), .Y(n57) );
  OAI2BB2X1M U180 ( .B0(n218), .B1(n18), .A0N(REG1[1]), .A1N(n18), .Y(n58) );
  OAI2BB2X1M U181 ( .B0(n219), .B1(n18), .A0N(REG1[2]), .A1N(n18), .Y(n59) );
  OAI2BB2X1M U182 ( .B0(n220), .B1(n18), .A0N(REG1[3]), .A1N(n18), .Y(n60) );
  OAI2BB2X1M U183 ( .B0(n221), .B1(n18), .A0N(REG1[4]), .A1N(n18), .Y(n61) );
  OAI2BB2X1M U184 ( .B0(n222), .B1(n18), .A0N(REG1[5]), .A1N(n18), .Y(n62) );
  OAI2BB2X1M U185 ( .B0(n223), .B1(n18), .A0N(REG1[6]), .A1N(n18), .Y(n63) );
  OAI2BB2X1M U186 ( .B0(n224), .B1(n18), .A0N(REG1[7]), .A1N(n18), .Y(n64) );
  OAI2BB2X1M U187 ( .B0(n217), .B1(n23), .A0N(\Reg_file[4][0] ), .A1N(n23), 
        .Y(n81) );
  OAI2BB2X1M U188 ( .B0(n218), .B1(n23), .A0N(\Reg_file[4][1] ), .A1N(n23), 
        .Y(n82) );
  OAI2BB2X1M U189 ( .B0(n219), .B1(n23), .A0N(\Reg_file[4][2] ), .A1N(n23), 
        .Y(n83) );
  OAI2BB2X1M U190 ( .B0(n220), .B1(n23), .A0N(\Reg_file[4][3] ), .A1N(n23), 
        .Y(n84) );
  OAI2BB2X1M U191 ( .B0(n221), .B1(n23), .A0N(\Reg_file[4][4] ), .A1N(n23), 
        .Y(n85) );
  OAI2BB2X1M U192 ( .B0(n222), .B1(n23), .A0N(\Reg_file[4][5] ), .A1N(n23), 
        .Y(n86) );
  OAI2BB2X1M U193 ( .B0(n223), .B1(n23), .A0N(\Reg_file[4][6] ), .A1N(n23), 
        .Y(n87) );
  OAI2BB2X1M U194 ( .B0(n224), .B1(n23), .A0N(\Reg_file[4][7] ), .A1N(n23), 
        .Y(n88) );
  OAI2BB2X1M U195 ( .B0(n217), .B1(n25), .A0N(\Reg_file[5][0] ), .A1N(n25), 
        .Y(n89) );
  OAI2BB2X1M U196 ( .B0(n218), .B1(n25), .A0N(\Reg_file[5][1] ), .A1N(n25), 
        .Y(n90) );
  OAI2BB2X1M U197 ( .B0(n219), .B1(n25), .A0N(\Reg_file[5][2] ), .A1N(n25), 
        .Y(n91) );
  OAI2BB2X1M U198 ( .B0(n220), .B1(n25), .A0N(\Reg_file[5][3] ), .A1N(n25), 
        .Y(n92) );
  OAI2BB2X1M U199 ( .B0(n221), .B1(n25), .A0N(\Reg_file[5][4] ), .A1N(n25), 
        .Y(n93) );
  OAI2BB2X1M U200 ( .B0(n222), .B1(n25), .A0N(\Reg_file[5][5] ), .A1N(n25), 
        .Y(n94) );
  OAI2BB2X1M U201 ( .B0(n223), .B1(n25), .A0N(\Reg_file[5][6] ), .A1N(n25), 
        .Y(n95) );
  OAI2BB2X1M U202 ( .B0(n224), .B1(n25), .A0N(\Reg_file[5][7] ), .A1N(n25), 
        .Y(n96) );
  OAI2BB2X1M U203 ( .B0(n217), .B1(n26), .A0N(\Reg_file[6][0] ), .A1N(n26), 
        .Y(n97) );
  OAI2BB2X1M U204 ( .B0(n218), .B1(n26), .A0N(\Reg_file[6][1] ), .A1N(n26), 
        .Y(n98) );
  OAI2BB2X1M U205 ( .B0(n219), .B1(n26), .A0N(\Reg_file[6][2] ), .A1N(n26), 
        .Y(n99) );
  OAI2BB2X1M U206 ( .B0(n220), .B1(n26), .A0N(\Reg_file[6][3] ), .A1N(n26), 
        .Y(n100) );
  OAI2BB2X1M U207 ( .B0(n221), .B1(n26), .A0N(\Reg_file[6][4] ), .A1N(n26), 
        .Y(n101) );
  OAI2BB2X1M U208 ( .B0(n222), .B1(n26), .A0N(\Reg_file[6][5] ), .A1N(n26), 
        .Y(n102) );
  OAI2BB2X1M U209 ( .B0(n223), .B1(n26), .A0N(\Reg_file[6][6] ), .A1N(n26), 
        .Y(n103) );
  OAI2BB2X1M U210 ( .B0(n224), .B1(n26), .A0N(\Reg_file[6][7] ), .A1N(n26), 
        .Y(n104) );
  OAI2BB2X1M U211 ( .B0(n217), .B1(n29), .A0N(\Reg_file[7][0] ), .A1N(n29), 
        .Y(n105) );
  OAI2BB2X1M U212 ( .B0(n218), .B1(n29), .A0N(\Reg_file[7][1] ), .A1N(n29), 
        .Y(n106) );
  OAI2BB2X1M U213 ( .B0(n219), .B1(n29), .A0N(\Reg_file[7][2] ), .A1N(n29), 
        .Y(n107) );
  OAI2BB2X1M U214 ( .B0(n220), .B1(n29), .A0N(\Reg_file[7][3] ), .A1N(n29), 
        .Y(n108) );
  OAI2BB2X1M U215 ( .B0(n221), .B1(n29), .A0N(\Reg_file[7][4] ), .A1N(n29), 
        .Y(n109) );
  OAI2BB2X1M U216 ( .B0(n222), .B1(n29), .A0N(\Reg_file[7][5] ), .A1N(n29), 
        .Y(n110) );
  OAI2BB2X1M U217 ( .B0(n223), .B1(n29), .A0N(\Reg_file[7][6] ), .A1N(n29), 
        .Y(n111) );
  OAI2BB2X1M U218 ( .B0(n224), .B1(n29), .A0N(\Reg_file[7][7] ), .A1N(n29), 
        .Y(n112) );
  OAI2BB2X1M U219 ( .B0(n218), .B1(n20), .A0N(REG2[1]), .A1N(n20), .Y(n66) );
  OAI2BB2X1M U220 ( .B0(n219), .B1(n20), .A0N(REG2[2]), .A1N(n20), .Y(n67) );
  OAI2BB2X1M U221 ( .B0(n220), .B1(n20), .A0N(REG2[3]), .A1N(n20), .Y(n68) );
  OAI2BB2X1M U222 ( .B0(n221), .B1(n20), .A0N(REG2[4]), .A1N(n20), .Y(n69) );
  OAI2BB2X1M U223 ( .B0(n222), .B1(n20), .A0N(REG2[5]), .A1N(n20), .Y(n70) );
  OAI2BB2X1M U224 ( .B0(n223), .B1(n20), .A0N(REG2[6]), .A1N(n20), .Y(n71) );
  OAI2BB2X1M U225 ( .B0(n217), .B1(n22), .A0N(REG3[0]), .A1N(n22), .Y(n73) );
  OAI2BB2X1M U226 ( .B0(n218), .B1(n22), .A0N(REG3[1]), .A1N(n22), .Y(n74) );
  OAI2BB2X1M U227 ( .B0(n219), .B1(n22), .A0N(REG3[2]), .A1N(n22), .Y(n75) );
  OAI2BB2X1M U228 ( .B0(n220), .B1(n22), .A0N(REG3[3]), .A1N(n22), .Y(n76) );
  OAI2BB2X1M U229 ( .B0(n221), .B1(n22), .A0N(REG3[4]), .A1N(n22), .Y(n77) );
  OAI2BB2X1M U230 ( .B0(n223), .B1(n22), .A0N(REG3[6]), .A1N(n22), .Y(n79) );
  OAI2BB2X1M U231 ( .B0(n224), .B1(n22), .A0N(REG3[7]), .A1N(n22), .Y(n80) );
  OAI2BB2X1M U232 ( .B0(n217), .B1(n20), .A0N(REG2[0]), .A1N(n20), .Y(n65) );
  OAI2BB2X1M U233 ( .B0(n224), .B1(n20), .A0N(REG2[7]), .A1N(n20), .Y(n72) );
  OAI2BB2X1M U234 ( .B0(n222), .B1(n22), .A0N(REG3[5]), .A1N(n22), .Y(n78) );
  INVX2M U235 ( .A(N11), .Y(n204) );
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
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n19), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n19), .Y(n5) );
  NAND2X2M U15 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n8) );
  INVX2M U17 ( .A(n19), .Y(n7) );
  NAND2X2M U18 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U19 ( .A(a[2]), .Y(n9) );
  NAND2X2M U20 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U21 ( .A(a[1]), .Y(n10) );
  NAND2X2M U22 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U23 ( .A(a[0]), .Y(n11) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  XNOR2X2M U27 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U28 ( .A(b[6]), .Y(n13) );
  INVX2M U29 ( .A(b[1]), .Y(n18) );
  INVX2M U30 ( .A(b[2]), .Y(n17) );
  INVX2M U31 ( .A(b[3]), .Y(n16) );
  INVX2M U32 ( .A(b[4]), .Y(n15) );
  INVX2M U33 ( .A(b[5]), .Y(n14) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
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
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[6]), .Y(n4) );
  XNOR2X2M U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  INVX2M U10 ( .A(B[1]), .Y(n9) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
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
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
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

  ALU_RTL_DATA_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n13, n14, n11, n12, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U24 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  INVX2M U27 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U29 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U31 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U35 ( .A(A[1]), .Y(n38) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  XNOR2X2M U42 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
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
endmodule


module ALU_RTL_DATA_WIDTH8 ( ALU_CLK, RST_SYNC_2, ALU_EN, REG0, REG1, ALU_FUNC, 
        ALU_OUT, ALU_OUT_VALID );
  input [7:0] REG0;
  input [7:0] REG1;
  input [3:0] ALU_FUNC;
  output [15:0] ALU_OUT;
  input ALU_CLK, RST_SYNC_2, ALU_EN;
  output ALU_OUT_VALID;
  wire   N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N123, N124,
         N125, N126, N127, N128, N129, N130, N131, N156, N157, N158, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_INT;

  ALU_RTL_DATA_WIDTH8_DW_div_uns_0 div_22 ( .a({n12, n11, n10, n9, n8, n7, n6, 
        n5}), .b({REG1[7], n4, REG1[5:0]}), .quotient({N131, N130, N129, N128, 
        N127, N126, N125, N124}) );
  ALU_RTL_DATA_WIDTH8_DW01_sub_0 sub_20 ( .A({1'b0, n12, n11, n10, n9, n8, n7, 
        n6, n5}), .B({1'b0, REG1[7], n4, REG1[5:0]}), .CI(1'b0), .DIFF({N107, 
        N106, N105, N104, N103, N102, N101, N100, N99}) );
  ALU_RTL_DATA_WIDTH8_DW01_add_0 add_19 ( .A({1'b0, n12, n11, n10, n9, n8, n7, 
        n6, n5}), .B({1'b0, REG1[7], n4, REG1[5:0]}), .CI(1'b0), .SUM({N98, 
        N97, N96, N95, N94, N93, N92, N91, N90}) );
  ALU_RTL_DATA_WIDTH8_DW02_mult_0 mult_21 ( .A({n12, n11, n10, n9, n8, n7, n6, 
        n5}), .B({REG1[7], n4, REG1[5:0]}), .TC(1'b0), .PRODUCT({N123, N122, 
        N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, 
        N109, N108}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_INT[15]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_INT[14]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_INT[13]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_INT[12]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_INT[11]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_INT[10]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_INT[9]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_INT[8]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_INT[7]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_INT[6]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_INT[5]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_INT[4]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_INT[3]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_INT[2]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_INT[1]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_INT[0]), .CK(ALU_CLK), .RN(RST_SYNC_2), 
        .Q(ALU_OUT[0]) );
  DFFRQX2M ALU_OUT_VALID_reg ( .D(ALU_EN), .CK(ALU_CLK), .RN(RST_SYNC_2), .Q(
        ALU_OUT_VALID) );
  BUFX2M U3 ( .A(REG0[6]), .Y(n11) );
  OAI2BB1X2M U4 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_INT[15]) );
  OAI2BB1X2M U7 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_INT[14]) );
  OAI2BB1X2M U8 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_INT[12]) );
  OAI2BB1X2M U9 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_INT[13]) );
  OAI2BB1X2M U10 ( .A0N(N117), .A1N(n31), .B0(n32), .Y(ALU_INT[9]) );
  OAI2BB1X2M U11 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_INT[10]) );
  OAI2BB1X2M U12 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_INT[11]) );
  OAI2BB1X2M U13 ( .A0N(n140), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U14 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  AND2X2M U15 ( .A(n99), .B(n105), .Y(n42) );
  BUFX2M U16 ( .A(n41), .Y(n13) );
  NOR2X2M U17 ( .A(n107), .B(n137), .Y(n41) );
  INVX2M U18 ( .A(n100), .Y(n137) );
  INVX2M U19 ( .A(n107), .Y(n140) );
  NOR2BX2M U20 ( .AN(n106), .B(n137), .Y(n37) );
  NOR2BX2M U21 ( .AN(n35), .B(n135), .Y(n31) );
  AND2X2M U22 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U23 ( .A(n91), .Y(n138) );
  NOR3BX2M U24 ( .AN(n105), .B(n139), .C(ALU_FUNC[2]), .Y(n49) );
  NOR2X2M U25 ( .A(ALU_FUNC[2]), .B(ALU_FUNC[1]), .Y(n106) );
  AND3X2M U26 ( .A(n106), .B(n136), .C(n3), .Y(n46) );
  NAND2X2M U27 ( .A(ALU_FUNC[2]), .B(ALU_FUNC[1]), .Y(n107) );
  INVX2M U28 ( .A(ALU_FUNC[0]), .Y(n136) );
  NOR2X2M U29 ( .A(n136), .B(n3), .Y(n105) );
  NOR2X2M U30 ( .A(n3), .B(ALU_FUNC[0]), .Y(n100) );
  INVX2M U31 ( .A(ALU_FUNC[1]), .Y(n139) );
  NAND3X2M U32 ( .A(n106), .B(ALU_FUNC[0]), .C(n3), .Y(n101) );
  NAND2X2M U33 ( .A(ALU_EN), .B(n123), .Y(n32) );
  AND2X2M U34 ( .A(ALU_FUNC[2]), .B(n139), .Y(n99) );
  AND4X2M U35 ( .A(N158), .B(n99), .C(n3), .D(n136), .Y(n90) );
  NOR3X2M U36 ( .A(n137), .B(ALU_FUNC[2]), .C(n139), .Y(n35) );
  NAND3X2M U37 ( .A(n140), .B(n136), .C(n3), .Y(n36) );
  NAND3X2M U38 ( .A(n3), .B(ALU_FUNC[0]), .C(n99), .Y(n91) );
  INVX2M U39 ( .A(ALU_EN), .Y(n135) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n135), .Y(ALU_INT[0]) );
  AOI22X1M U41 ( .A0(N99), .A1(n50), .B0(N90), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n134), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N108), .A1(n35), .B0(n5), .B1(n42), .C0(N124), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n135), .Y(ALU_INT[1]) );
  AOI222X1M U45 ( .A0(N91), .A1(n37), .B0(N109), .B1(n35), .C0(N100), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n7), .A1(n138), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N125), .A1(n49), .B0(n13), .B1(n133), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n135), .Y(ALU_INT[2]) );
  AOI22X1M U49 ( .A0(N101), .A1(n50), .B0(N92), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n8), .A1(n138), .B0(n13), .B1(n132), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N110), .A1(n35), .B0(n7), .B1(n42), .C0(N126), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n135), .Y(ALU_INT[3]) );
  AOI22X1M U53 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n9), .A1(n138), .B0(n13), .B1(n131), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N111), .A1(n35), .B0(n8), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n135), .Y(ALU_INT[4]) );
  AOI22X1M U57 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n138), .A1(n10), .B0(n13), .B1(n130), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N112), .A1(n35), .B0(n9), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n38), .A1(n39), .A2(n40), .B0(n135), .Y(ALU_INT[7]) );
  AOI22X1M U61 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n38) );
  AOI221XLM U62 ( .A0(n13), .A1(n127), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U63 ( .A0(N131), .A1(n49), .B0(N115), .B1(n35), .Y(n39) );
  AOI31X2M U64 ( .A0(n57), .A1(n58), .A2(n59), .B0(n135), .Y(ALU_INT[5]) );
  AOI22X1M U65 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n57) );
  AOI221XLM U66 ( .A0(n138), .A1(n11), .B0(n13), .B1(n129), .C0(n60), .Y(n59)
         );
  AOI222X1M U67 ( .A0(N113), .A1(n35), .B0(n10), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n58) );
  AOI21X2M U68 ( .A0(n33), .A1(n34), .B0(n135), .Y(ALU_INT[8]) );
  AOI21X2M U69 ( .A0(N98), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U70 ( .B0(N116), .B1(n35), .A0N(n127), .A1N(n36), .Y(n34) );
  OAI222X1M U71 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n129), 
        .Y(n54) );
  AOI221XLM U72 ( .A0(n11), .A1(n46), .B0(n47), .B1(n128), .C0(n13), .Y(n56)
         );
  AOI221XLM U73 ( .A0(n46), .A1(n128), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U74 ( .A(n25), .Y(n120) );
  AOI31X2M U75 ( .A0(n51), .A1(n52), .A2(n53), .B0(n135), .Y(ALU_INT[6]) );
  AOI22X1M U76 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n51) );
  AOI221XLM U77 ( .A0(n138), .A1(n12), .B0(n13), .B1(n128), .C0(n54), .Y(n53)
         );
  AOI222X1M U78 ( .A0(N114), .A1(n35), .B0(n42), .B1(n11), .C0(N130), .C1(n49), 
        .Y(n52) );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N107), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U81 ( .A(ALU_FUNC[3]), .Y(n3) );
  INVX2M U82 ( .A(n116), .Y(N157) );
  INVX2M U83 ( .A(n4), .Y(n122) );
  INVX2M U84 ( .A(n6), .Y(n133) );
  INVX2M U85 ( .A(n5), .Y(n134) );
  INVX2M U86 ( .A(n11), .Y(n128) );
  INVX2M U87 ( .A(n12), .Y(n127) );
  INVX2M U88 ( .A(n8), .Y(n131) );
  INVX2M U89 ( .A(n7), .Y(n132) );
  INVX2M U90 ( .A(n10), .Y(n129) );
  INVX2M U91 ( .A(n9), .Y(n130) );
  BUFX2M U92 ( .A(REG1[6]), .Y(n4) );
  BUFX2M U93 ( .A(REG0[7]), .Y(n12) );
  BUFX2M U94 ( .A(REG0[5]), .Y(n10) );
  BUFX2M U95 ( .A(REG0[4]), .Y(n9) );
  BUFX2M U96 ( .A(REG0[3]), .Y(n8) );
  BUFX2M U97 ( .A(REG0[2]), .Y(n7) );
  BUFX2M U98 ( .A(REG0[1]), .Y(n6) );
  BUFX2M U99 ( .A(REG0[0]), .Y(n5) );
  OAI222X1M U100 ( .A0(n79), .A1(n119), .B0(REG1[2]), .B1(n80), .C0(n36), .C1(
        n133), .Y(n78) );
  AOI221XLM U101 ( .A0(n7), .A1(n46), .B0(n47), .B1(n132), .C0(n13), .Y(n80)
         );
  AOI221XLM U102 ( .A0(n46), .A1(n132), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U103 ( .A0(n73), .A1(n121), .B0(REG1[3]), .B1(n74), .C0(n36), .C1(
        n132), .Y(n72) );
  AOI221XLM U104 ( .A0(n8), .A1(n46), .B0(n47), .B1(n131), .C0(n13), .Y(n74)
         );
  AOI221XLM U105 ( .A0(n46), .A1(n131), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U106 ( .A0(n67), .A1(n126), .B0(REG1[4]), .B1(n68), .C0(n36), .C1(
        n131), .Y(n66) );
  INVX2M U107 ( .A(REG1[4]), .Y(n126) );
  AOI221XLM U108 ( .A0(n9), .A1(n46), .B0(n47), .B1(n130), .C0(n13), .Y(n68)
         );
  AOI221XLM U109 ( .A0(n46), .A1(n130), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U110 ( .A0(n61), .A1(n125), .B0(REG1[5]), .B1(n62), .C0(n36), .C1(
        n130), .Y(n60) );
  INVX2M U111 ( .A(REG1[5]), .Y(n125) );
  AOI221XLM U112 ( .A0(n10), .A1(n46), .B0(n47), .B1(n129), .C0(n13), .Y(n62)
         );
  AOI221XLM U113 ( .A0(n46), .A1(n129), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U114 ( .A0(n44), .A1(n124), .B0(REG1[7]), .B1(n45), .C0(n36), .C1(
        n128), .Y(n43) );
  INVX2M U115 ( .A(REG1[7]), .Y(n124) );
  AOI221XLM U116 ( .A0(n46), .A1(n12), .B0(n47), .B1(n127), .C0(n13), .Y(n45)
         );
  AOI221XLM U117 ( .A0(n46), .A1(n127), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U118 ( .A(n14), .Y(n118) );
  OAI21X2M U119 ( .A0(REG1[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U120 ( .A0(n5), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n102)
         );
  AOI31X2M U121 ( .A0(N156), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U122 ( .A(n139), .B(ALU_FUNC[2]), .C(ALU_FUNC[0]), .Y(n104) );
  OAI21X2M U123 ( .A0(REG1[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U124 ( .A0(n6), .A1(n46), .B0(n47), .B1(n133), .C0(n13), .Y(n87)
         );
  AOI31X2M U125 ( .A0(N157), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U126 ( .A(n136), .B(ALU_FUNC[2]), .C(n139), .Y(n89) );
  OAI2B2X1M U127 ( .A1N(REG1[0]), .A0(n98), .B0(n91), .B1(n133), .Y(n97) );
  AOI221XLM U128 ( .A0(n46), .A1(n134), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U129 ( .A1N(REG1[1]), .A0(n86), .B0(n36), .B1(n134), .Y(n85) );
  AOI221XLM U130 ( .A0(n46), .A1(n133), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  INVX2M U131 ( .A(REG1[0]), .Y(n117) );
  INVX2M U132 ( .A(REG1[2]), .Y(n119) );
  INVX2M U133 ( .A(REG1[3]), .Y(n121) );
  NOR2X1M U134 ( .A(n127), .B(REG1[7]), .Y(n113) );
  NAND2BX1M U135 ( .AN(REG1[4]), .B(n9), .Y(n29) );
  NAND2BX1M U136 ( .AN(n9), .B(REG1[4]), .Y(n18) );
  CLKNAND2X2M U137 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U138 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U139 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U140 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U141 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U142 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U143 ( .A0(n14), .A1(n133), .B0(REG1[1]), .Y(n15) );
  AOI211X1M U144 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U145 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U146 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U147 ( .AN(n10), .B(REG1[5]), .Y(n111) );
  OAI211X1M U148 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U149 ( .AN(REG1[5]), .B(n10), .Y(n30) );
  XNOR2X1M U150 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U151 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n128), .Y(n21)
         );
  CLKNAND2X2M U152 ( .A(REG1[7]), .B(n127), .Y(n114) );
  OAI21X1M U153 ( .A0(n113), .A1(n21), .B0(n114), .Y(N158) );
  CLKNAND2X2M U154 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U155 ( .A0(n24), .A1(n133), .B0(REG1[1]), .Y(n22) );
  AOI211X1M U156 ( .A0(n24), .A1(n133), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U157 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U158 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U159 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U160 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  NOR2X1M U161 ( .A(N158), .B(N157), .Y(N156) );
endmodule


module FIFO_BUFFER_DATA_WIDTH8_FIFO_DEPTH8_ADDRESS_BITS3 ( W_CLK, W_RST, WINC, 
        W_FULL, W_DATA, W_ADDRESS, R_ADDRESS, R_DATA );
  input [7:0] W_DATA;
  input [2:0] W_ADDRESS;
  input [2:0] R_ADDRESS;
  output [7:0] R_DATA;
  input W_CLK, W_RST, WINC, W_FULL;
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
         N32, N33, N34, N35, N36, N37, N38, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115;
  assign N9 = R_ADDRESS[0];
  assign N10 = R_ADDRESS[1];
  assign N11 = R_ADDRESS[2];

  DFFRQX2M \R_DATA_reg[5]  ( .D(N33), .CK(W_CLK), .RN(n100), .Q(R_DATA[5]) );
  DFFRQX2M \R_DATA_reg[1]  ( .D(N37), .CK(W_CLK), .RN(n100), .Q(R_DATA[1]) );
  DFFRQX2M \R_DATA_reg[4]  ( .D(N34), .CK(W_CLK), .RN(n100), .Q(R_DATA[4]) );
  DFFRQX2M \R_DATA_reg[0]  ( .D(N38), .CK(W_CLK), .RN(n100), .Q(R_DATA[0]) );
  DFFRQX2M \R_DATA_reg[3]  ( .D(N35), .CK(W_CLK), .RN(n100), .Q(R_DATA[3]) );
  DFFRQX2M \R_DATA_reg[2]  ( .D(N36), .CK(W_CLK), .RN(n100), .Q(R_DATA[2]) );
  DFFRQX2M \R_DATA_reg[6]  ( .D(N32), .CK(W_CLK), .RN(n100), .Q(R_DATA[6]) );
  DFFRQX2M \R_DATA_reg[7]  ( .D(N31), .CK(W_CLK), .RN(n100), .Q(R_DATA[7]) );
  DFFRQX2M \REG_reg[5][7]  ( .D(n69), .CK(W_CLK), .RN(n101), .Q(\REG[5][7] )
         );
  DFFRQX2M \REG_reg[5][6]  ( .D(n68), .CK(W_CLK), .RN(n101), .Q(\REG[5][6] )
         );
  DFFRQX2M \REG_reg[5][5]  ( .D(n67), .CK(W_CLK), .RN(n102), .Q(\REG[5][5] )
         );
  DFFRQX2M \REG_reg[5][4]  ( .D(n66), .CK(W_CLK), .RN(n102), .Q(\REG[5][4] )
         );
  DFFRQX2M \REG_reg[5][3]  ( .D(n65), .CK(W_CLK), .RN(n102), .Q(\REG[5][3] )
         );
  DFFRQX2M \REG_reg[5][2]  ( .D(n64), .CK(W_CLK), .RN(n102), .Q(\REG[5][2] )
         );
  DFFRQX2M \REG_reg[5][1]  ( .D(n63), .CK(W_CLK), .RN(n102), .Q(\REG[5][1] )
         );
  DFFRQX2M \REG_reg[5][0]  ( .D(n62), .CK(W_CLK), .RN(n102), .Q(\REG[5][0] )
         );
  DFFRQX2M \REG_reg[1][7]  ( .D(n37), .CK(W_CLK), .RN(n104), .Q(\REG[1][7] )
         );
  DFFRQX2M \REG_reg[1][6]  ( .D(n36), .CK(W_CLK), .RN(n104), .Q(\REG[1][6] )
         );
  DFFRQX2M \REG_reg[1][5]  ( .D(n35), .CK(W_CLK), .RN(n104), .Q(\REG[1][5] )
         );
  DFFRQX2M \REG_reg[1][4]  ( .D(n34), .CK(W_CLK), .RN(n104), .Q(\REG[1][4] )
         );
  DFFRQX2M \REG_reg[1][3]  ( .D(n33), .CK(W_CLK), .RN(n104), .Q(\REG[1][3] )
         );
  DFFRQX2M \REG_reg[1][2]  ( .D(n32), .CK(W_CLK), .RN(n104), .Q(\REG[1][2] )
         );
  DFFRQX2M \REG_reg[1][1]  ( .D(n31), .CK(W_CLK), .RN(n104), .Q(\REG[1][1] )
         );
  DFFRQX2M \REG_reg[1][0]  ( .D(n30), .CK(W_CLK), .RN(n104), .Q(\REG[1][0] )
         );
  DFFRQX2M \REG_reg[7][7]  ( .D(n85), .CK(W_CLK), .RN(n100), .Q(\REG[7][7] )
         );
  DFFRQX2M \REG_reg[7][6]  ( .D(n84), .CK(W_CLK), .RN(n100), .Q(\REG[7][6] )
         );
  DFFRQX2M \REG_reg[7][5]  ( .D(n83), .CK(W_CLK), .RN(n100), .Q(\REG[7][5] )
         );
  DFFRQX2M \REG_reg[7][4]  ( .D(n82), .CK(W_CLK), .RN(n100), .Q(\REG[7][4] )
         );
  DFFRQX2M \REG_reg[7][3]  ( .D(n81), .CK(W_CLK), .RN(n100), .Q(\REG[7][3] )
         );
  DFFRQX2M \REG_reg[7][2]  ( .D(n80), .CK(W_CLK), .RN(n101), .Q(\REG[7][2] )
         );
  DFFRQX2M \REG_reg[7][1]  ( .D(n79), .CK(W_CLK), .RN(n101), .Q(\REG[7][1] )
         );
  DFFRQX2M \REG_reg[7][0]  ( .D(n78), .CK(W_CLK), .RN(n101), .Q(\REG[7][0] )
         );
  DFFRQX2M \REG_reg[3][7]  ( .D(n53), .CK(W_CLK), .RN(n103), .Q(\REG[3][7] )
         );
  DFFRQX2M \REG_reg[3][6]  ( .D(n52), .CK(W_CLK), .RN(n103), .Q(\REG[3][6] )
         );
  DFFRQX2M \REG_reg[3][5]  ( .D(n51), .CK(W_CLK), .RN(n103), .Q(\REG[3][5] )
         );
  DFFRQX2M \REG_reg[3][4]  ( .D(n50), .CK(W_CLK), .RN(n103), .Q(\REG[3][4] )
         );
  DFFRQX2M \REG_reg[3][3]  ( .D(n49), .CK(W_CLK), .RN(n103), .Q(\REG[3][3] )
         );
  DFFRQX2M \REG_reg[3][2]  ( .D(n48), .CK(W_CLK), .RN(n103), .Q(\REG[3][2] )
         );
  DFFRQX2M \REG_reg[3][1]  ( .D(n47), .CK(W_CLK), .RN(n103), .Q(\REG[3][1] )
         );
  DFFRQX2M \REG_reg[3][0]  ( .D(n46), .CK(W_CLK), .RN(n103), .Q(\REG[3][0] )
         );
  DFFRQX2M \REG_reg[6][7]  ( .D(n77), .CK(W_CLK), .RN(n101), .Q(\REG[6][7] )
         );
  DFFRQX2M \REG_reg[6][6]  ( .D(n76), .CK(W_CLK), .RN(n101), .Q(\REG[6][6] )
         );
  DFFRQX2M \REG_reg[6][5]  ( .D(n75), .CK(W_CLK), .RN(n101), .Q(\REG[6][5] )
         );
  DFFRQX2M \REG_reg[6][4]  ( .D(n74), .CK(W_CLK), .RN(n101), .Q(\REG[6][4] )
         );
  DFFRQX2M \REG_reg[6][3]  ( .D(n73), .CK(W_CLK), .RN(n101), .Q(\REG[6][3] )
         );
  DFFRQX2M \REG_reg[6][2]  ( .D(n72), .CK(W_CLK), .RN(n101), .Q(\REG[6][2] )
         );
  DFFRQX2M \REG_reg[6][1]  ( .D(n71), .CK(W_CLK), .RN(n101), .Q(\REG[6][1] )
         );
  DFFRQX2M \REG_reg[6][0]  ( .D(n70), .CK(W_CLK), .RN(n101), .Q(\REG[6][0] )
         );
  DFFRQX2M \REG_reg[2][7]  ( .D(n45), .CK(W_CLK), .RN(n103), .Q(\REG[2][7] )
         );
  DFFRQX2M \REG_reg[2][6]  ( .D(n44), .CK(W_CLK), .RN(n103), .Q(\REG[2][6] )
         );
  DFFRQX2M \REG_reg[2][5]  ( .D(n43), .CK(W_CLK), .RN(n103), .Q(\REG[2][5] )
         );
  DFFRQX2M \REG_reg[2][4]  ( .D(n42), .CK(W_CLK), .RN(n103), .Q(\REG[2][4] )
         );
  DFFRQX2M \REG_reg[2][3]  ( .D(n41), .CK(W_CLK), .RN(n104), .Q(\REG[2][3] )
         );
  DFFRQX2M \REG_reg[2][2]  ( .D(n40), .CK(W_CLK), .RN(n104), .Q(\REG[2][2] )
         );
  DFFRQX2M \REG_reg[2][1]  ( .D(n39), .CK(W_CLK), .RN(n104), .Q(\REG[2][1] )
         );
  DFFRQX2M \REG_reg[2][0]  ( .D(n38), .CK(W_CLK), .RN(n104), .Q(\REG[2][0] )
         );
  DFFRQX2M \REG_reg[4][7]  ( .D(n61), .CK(W_CLK), .RN(n102), .Q(\REG[4][7] )
         );
  DFFRQX2M \REG_reg[4][6]  ( .D(n60), .CK(W_CLK), .RN(n102), .Q(\REG[4][6] )
         );
  DFFRQX2M \REG_reg[4][5]  ( .D(n59), .CK(W_CLK), .RN(n102), .Q(\REG[4][5] )
         );
  DFFRQX2M \REG_reg[4][4]  ( .D(n58), .CK(W_CLK), .RN(n102), .Q(\REG[4][4] )
         );
  DFFRQX2M \REG_reg[4][3]  ( .D(n57), .CK(W_CLK), .RN(n102), .Q(\REG[4][3] )
         );
  DFFRQX2M \REG_reg[4][2]  ( .D(n56), .CK(W_CLK), .RN(n102), .Q(\REG[4][2] )
         );
  DFFRQX2M \REG_reg[4][1]  ( .D(n55), .CK(W_CLK), .RN(n102), .Q(\REG[4][1] )
         );
  DFFRQX2M \REG_reg[4][0]  ( .D(n54), .CK(W_CLK), .RN(n103), .Q(\REG[4][0] )
         );
  DFFRQX2M \REG_reg[0][7]  ( .D(n29), .CK(W_CLK), .RN(n104), .Q(\REG[0][7] )
         );
  DFFRQX2M \REG_reg[0][6]  ( .D(n28), .CK(W_CLK), .RN(n105), .Q(\REG[0][6] )
         );
  DFFRQX2M \REG_reg[0][5]  ( .D(n27), .CK(W_CLK), .RN(n105), .Q(\REG[0][5] )
         );
  DFFRQX2M \REG_reg[0][4]  ( .D(n26), .CK(W_CLK), .RN(n105), .Q(\REG[0][4] )
         );
  DFFRQX2M \REG_reg[0][3]  ( .D(n25), .CK(W_CLK), .RN(n105), .Q(\REG[0][3] )
         );
  DFFRQX2M \REG_reg[0][2]  ( .D(n24), .CK(W_CLK), .RN(n105), .Q(\REG[0][2] )
         );
  DFFRQX2M \REG_reg[0][1]  ( .D(n23), .CK(W_CLK), .RN(n105), .Q(\REG[0][1] )
         );
  DFFRQX2M \REG_reg[0][0]  ( .D(n22), .CK(W_CLK), .RN(n105), .Q(\REG[0][0] )
         );
  BUFX2M U3 ( .A(n14), .Y(n97) );
  BUFX2M U4 ( .A(n15), .Y(n96) );
  BUFX2M U5 ( .A(n19), .Y(n95) );
  BUFX2M U6 ( .A(n20), .Y(n94) );
  BUFX2M U7 ( .A(n21), .Y(n93) );
  BUFX2M U8 ( .A(n99), .Y(n104) );
  BUFX2M U9 ( .A(n99), .Y(n103) );
  BUFX2M U10 ( .A(n98), .Y(n102) );
  BUFX2M U11 ( .A(n98), .Y(n101) );
  BUFX2M U12 ( .A(n98), .Y(n100) );
  BUFX2M U13 ( .A(n99), .Y(n105) );
  NOR2BX2M U14 ( .AN(WINC), .B(W_FULL), .Y(n16) );
  BUFX2M U15 ( .A(W_RST), .Y(n99) );
  BUFX2M U16 ( .A(W_RST), .Y(n98) );
  NAND3X2M U17 ( .A(n106), .B(n107), .C(n18), .Y(n17) );
  NAND3X2M U18 ( .A(n106), .B(n107), .C(n12), .Y(n11) );
  NAND3X2M U19 ( .A(n12), .B(n107), .C(W_ADDRESS[0]), .Y(n13) );
  NOR2BX2M U20 ( .AN(n16), .B(W_ADDRESS[2]), .Y(n12) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n115), .A0N(\REG[0][0] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n114), .A0N(\REG[0][1] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n113), .A0N(\REG[0][2] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n112), .A0N(\REG[0][3] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n111), .A0N(\REG[0][4] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n110), .A0N(\REG[0][5] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U27 ( .B0(n11), .B1(n109), .A0N(\REG[0][6] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U28 ( .B0(n11), .B1(n108), .A0N(\REG[0][7] ), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U29 ( .B0(n115), .B1(n13), .A0N(\REG[1][0] ), .A1N(n13), .Y(n30)
         );
  OAI2BB2X1M U30 ( .B0(n114), .B1(n13), .A0N(\REG[1][1] ), .A1N(n13), .Y(n31)
         );
  OAI2BB2X1M U31 ( .B0(n113), .B1(n13), .A0N(\REG[1][2] ), .A1N(n13), .Y(n32)
         );
  OAI2BB2X1M U32 ( .B0(n112), .B1(n13), .A0N(\REG[1][3] ), .A1N(n13), .Y(n33)
         );
  OAI2BB2X1M U33 ( .B0(n111), .B1(n13), .A0N(\REG[1][4] ), .A1N(n13), .Y(n34)
         );
  OAI2BB2X1M U34 ( .B0(n110), .B1(n13), .A0N(\REG[1][5] ), .A1N(n13), .Y(n35)
         );
  OAI2BB2X1M U35 ( .B0(n109), .B1(n13), .A0N(\REG[1][6] ), .A1N(n13), .Y(n36)
         );
  OAI2BB2X1M U36 ( .B0(n108), .B1(n13), .A0N(\REG[1][7] ), .A1N(n13), .Y(n37)
         );
  OAI2BB2X1M U37 ( .B0(n115), .B1(n17), .A0N(\REG[4][0] ), .A1N(n17), .Y(n54)
         );
  OAI2BB2X1M U38 ( .B0(n114), .B1(n17), .A0N(\REG[4][1] ), .A1N(n17), .Y(n55)
         );
  OAI2BB2X1M U39 ( .B0(n113), .B1(n17), .A0N(\REG[4][2] ), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U40 ( .B0(n112), .B1(n17), .A0N(\REG[4][3] ), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U41 ( .B0(n111), .B1(n17), .A0N(\REG[4][4] ), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U42 ( .B0(n110), .B1(n17), .A0N(\REG[4][5] ), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U43 ( .B0(n109), .B1(n17), .A0N(\REG[4][6] ), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U44 ( .B0(n108), .B1(n17), .A0N(\REG[4][7] ), .A1N(n17), .Y(n61)
         );
  INVX2M U45 ( .A(W_DATA[0]), .Y(n115) );
  INVX2M U46 ( .A(W_DATA[1]), .Y(n114) );
  INVX2M U47 ( .A(W_DATA[2]), .Y(n113) );
  INVX2M U48 ( .A(W_DATA[3]), .Y(n112) );
  INVX2M U49 ( .A(W_DATA[4]), .Y(n111) );
  INVX2M U50 ( .A(W_DATA[5]), .Y(n110) );
  INVX2M U51 ( .A(W_DATA[6]), .Y(n109) );
  INVX2M U52 ( .A(W_DATA[7]), .Y(n108) );
  OAI2BB2X1M U53 ( .B0(n115), .B1(n97), .A0N(\REG[2][0] ), .A1N(n97), .Y(n38)
         );
  OAI2BB2X1M U54 ( .B0(n114), .B1(n97), .A0N(\REG[2][1] ), .A1N(n97), .Y(n39)
         );
  OAI2BB2X1M U55 ( .B0(n113), .B1(n97), .A0N(\REG[2][2] ), .A1N(n97), .Y(n40)
         );
  OAI2BB2X1M U56 ( .B0(n112), .B1(n97), .A0N(\REG[2][3] ), .A1N(n97), .Y(n41)
         );
  OAI2BB2X1M U57 ( .B0(n111), .B1(n97), .A0N(\REG[2][4] ), .A1N(n97), .Y(n42)
         );
  OAI2BB2X1M U58 ( .B0(n110), .B1(n97), .A0N(\REG[2][5] ), .A1N(n97), .Y(n43)
         );
  OAI2BB2X1M U59 ( .B0(n109), .B1(n97), .A0N(\REG[2][6] ), .A1N(n97), .Y(n44)
         );
  OAI2BB2X1M U60 ( .B0(n108), .B1(n97), .A0N(\REG[2][7] ), .A1N(n97), .Y(n45)
         );
  OAI2BB2X1M U61 ( .B0(n115), .B1(n96), .A0N(\REG[3][0] ), .A1N(n96), .Y(n46)
         );
  OAI2BB2X1M U62 ( .B0(n114), .B1(n96), .A0N(\REG[3][1] ), .A1N(n96), .Y(n47)
         );
  OAI2BB2X1M U63 ( .B0(n113), .B1(n96), .A0N(\REG[3][2] ), .A1N(n96), .Y(n48)
         );
  OAI2BB2X1M U64 ( .B0(n112), .B1(n96), .A0N(\REG[3][3] ), .A1N(n96), .Y(n49)
         );
  OAI2BB2X1M U65 ( .B0(n111), .B1(n96), .A0N(\REG[3][4] ), .A1N(n96), .Y(n50)
         );
  OAI2BB2X1M U66 ( .B0(n110), .B1(n96), .A0N(\REG[3][5] ), .A1N(n96), .Y(n51)
         );
  OAI2BB2X1M U67 ( .B0(n109), .B1(n96), .A0N(\REG[3][6] ), .A1N(n96), .Y(n52)
         );
  OAI2BB2X1M U68 ( .B0(n108), .B1(n96), .A0N(\REG[3][7] ), .A1N(n96), .Y(n53)
         );
  OAI2BB2X1M U69 ( .B0(n115), .B1(n95), .A0N(\REG[5][0] ), .A1N(n95), .Y(n62)
         );
  OAI2BB2X1M U70 ( .B0(n114), .B1(n95), .A0N(\REG[5][1] ), .A1N(n95), .Y(n63)
         );
  OAI2BB2X1M U71 ( .B0(n113), .B1(n95), .A0N(\REG[5][2] ), .A1N(n95), .Y(n64)
         );
  OAI2BB2X1M U72 ( .B0(n112), .B1(n95), .A0N(\REG[5][3] ), .A1N(n95), .Y(n65)
         );
  OAI2BB2X1M U73 ( .B0(n111), .B1(n95), .A0N(\REG[5][4] ), .A1N(n95), .Y(n66)
         );
  OAI2BB2X1M U74 ( .B0(n110), .B1(n95), .A0N(\REG[5][5] ), .A1N(n95), .Y(n67)
         );
  OAI2BB2X1M U75 ( .B0(n109), .B1(n95), .A0N(\REG[5][6] ), .A1N(n95), .Y(n68)
         );
  OAI2BB2X1M U76 ( .B0(n108), .B1(n95), .A0N(\REG[5][7] ), .A1N(n95), .Y(n69)
         );
  OAI2BB2X1M U77 ( .B0(n115), .B1(n94), .A0N(\REG[6][0] ), .A1N(n94), .Y(n70)
         );
  OAI2BB2X1M U78 ( .B0(n114), .B1(n94), .A0N(\REG[6][1] ), .A1N(n94), .Y(n71)
         );
  OAI2BB2X1M U79 ( .B0(n113), .B1(n94), .A0N(\REG[6][2] ), .A1N(n94), .Y(n72)
         );
  OAI2BB2X1M U80 ( .B0(n112), .B1(n94), .A0N(\REG[6][3] ), .A1N(n94), .Y(n73)
         );
  OAI2BB2X1M U81 ( .B0(n111), .B1(n94), .A0N(\REG[6][4] ), .A1N(n94), .Y(n74)
         );
  OAI2BB2X1M U82 ( .B0(n110), .B1(n94), .A0N(\REG[6][5] ), .A1N(n94), .Y(n75)
         );
  OAI2BB2X1M U83 ( .B0(n109), .B1(n94), .A0N(\REG[6][6] ), .A1N(n94), .Y(n76)
         );
  OAI2BB2X1M U84 ( .B0(n108), .B1(n94), .A0N(\REG[6][7] ), .A1N(n94), .Y(n77)
         );
  OAI2BB2X1M U85 ( .B0(n115), .B1(n93), .A0N(\REG[7][0] ), .A1N(n93), .Y(n78)
         );
  OAI2BB2X1M U86 ( .B0(n114), .B1(n93), .A0N(\REG[7][1] ), .A1N(n93), .Y(n79)
         );
  OAI2BB2X1M U87 ( .B0(n113), .B1(n93), .A0N(\REG[7][2] ), .A1N(n93), .Y(n80)
         );
  OAI2BB2X1M U88 ( .B0(n112), .B1(n93), .A0N(\REG[7][3] ), .A1N(n93), .Y(n81)
         );
  OAI2BB2X1M U89 ( .B0(n111), .B1(n93), .A0N(\REG[7][4] ), .A1N(n93), .Y(n82)
         );
  OAI2BB2X1M U90 ( .B0(n110), .B1(n93), .A0N(\REG[7][5] ), .A1N(n93), .Y(n83)
         );
  OAI2BB2X1M U91 ( .B0(n109), .B1(n93), .A0N(\REG[7][6] ), .A1N(n93), .Y(n84)
         );
  OAI2BB2X1M U92 ( .B0(n108), .B1(n93), .A0N(\REG[7][7] ), .A1N(n93), .Y(n85)
         );
  AND2X2M U93 ( .A(W_ADDRESS[2]), .B(n16), .Y(n18) );
  NAND3X2M U94 ( .A(W_ADDRESS[0]), .B(n12), .C(W_ADDRESS[1]), .Y(n15) );
  NAND3X2M U95 ( .A(W_ADDRESS[0]), .B(n107), .C(n18), .Y(n19) );
  NAND3X2M U96 ( .A(n12), .B(n106), .C(W_ADDRESS[1]), .Y(n14) );
  NAND3X2M U97 ( .A(W_ADDRESS[1]), .B(n106), .C(n18), .Y(n20) );
  NAND3X2M U98 ( .A(W_ADDRESS[1]), .B(W_ADDRESS[0]), .C(n18), .Y(n21) );
  INVX2M U99 ( .A(W_ADDRESS[1]), .Y(n107) );
  INVX2M U100 ( .A(W_ADDRESS[0]), .Y(n106) );
  MX2X2M U101 ( .A(n2), .B(n1), .S0(N11), .Y(N38) );
  MX4X1M U102 ( .A(\REG[0][0] ), .B(\REG[1][0] ), .C(\REG[2][0] ), .D(
        \REG[3][0] ), .S0(n92), .S1(N10), .Y(n2) );
  MX4X1M U103 ( .A(\REG[4][0] ), .B(\REG[5][0] ), .C(\REG[6][0] ), .D(
        \REG[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX2X2M U104 ( .A(n4), .B(n3), .S0(N11), .Y(N37) );
  MX4X1M U105 ( .A(\REG[0][1] ), .B(\REG[1][1] ), .C(\REG[2][1] ), .D(
        \REG[3][1] ), .S0(n92), .S1(N10), .Y(n4) );
  MX4X1M U106 ( .A(\REG[4][1] ), .B(\REG[5][1] ), .C(\REG[6][1] ), .D(
        \REG[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX2X2M U107 ( .A(n6), .B(n5), .S0(N11), .Y(N36) );
  MX4X1M U108 ( .A(\REG[0][2] ), .B(\REG[1][2] ), .C(\REG[2][2] ), .D(
        \REG[3][2] ), .S0(n92), .S1(N10), .Y(n6) );
  MX4X1M U109 ( .A(\REG[4][2] ), .B(\REG[5][2] ), .C(\REG[6][2] ), .D(
        \REG[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX2X2M U110 ( .A(n8), .B(n7), .S0(N11), .Y(N35) );
  MX4X1M U111 ( .A(\REG[0][3] ), .B(\REG[1][3] ), .C(\REG[2][3] ), .D(
        \REG[3][3] ), .S0(n92), .S1(N10), .Y(n8) );
  MX4X1M U112 ( .A(\REG[4][3] ), .B(\REG[5][3] ), .C(\REG[6][3] ), .D(
        \REG[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX2X2M U113 ( .A(n10), .B(n9), .S0(N11), .Y(N34) );
  MX4X1M U114 ( .A(\REG[0][4] ), .B(\REG[1][4] ), .C(\REG[2][4] ), .D(
        \REG[3][4] ), .S0(n92), .S1(N10), .Y(n10) );
  MX4X1M U115 ( .A(\REG[4][4] ), .B(\REG[5][4] ), .C(\REG[6][4] ), .D(
        \REG[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX2X2M U116 ( .A(n87), .B(n86), .S0(N11), .Y(N33) );
  MX4X1M U117 ( .A(\REG[0][5] ), .B(\REG[1][5] ), .C(\REG[2][5] ), .D(
        \REG[3][5] ), .S0(n92), .S1(N10), .Y(n87) );
  MX4X1M U118 ( .A(\REG[4][5] ), .B(\REG[5][5] ), .C(\REG[6][5] ), .D(
        \REG[7][5] ), .S0(n92), .S1(N10), .Y(n86) );
  MX2X2M U119 ( .A(n89), .B(n88), .S0(N11), .Y(N32) );
  MX4X1M U120 ( .A(\REG[0][6] ), .B(\REG[1][6] ), .C(\REG[2][6] ), .D(
        \REG[3][6] ), .S0(n92), .S1(N10), .Y(n89) );
  MX4X1M U121 ( .A(\REG[4][6] ), .B(\REG[5][6] ), .C(\REG[6][6] ), .D(
        \REG[7][6] ), .S0(n92), .S1(N10), .Y(n88) );
  MX2X2M U122 ( .A(n91), .B(n90), .S0(N11), .Y(N31) );
  MX4X1M U123 ( .A(\REG[0][7] ), .B(\REG[1][7] ), .C(\REG[2][7] ), .D(
        \REG[3][7] ), .S0(n92), .S1(N10), .Y(n91) );
  MX4X1M U124 ( .A(\REG[4][7] ), .B(\REG[5][7] ), .C(\REG[6][7] ), .D(
        \REG[7][7] ), .S0(n92), .S1(N10), .Y(n90) );
  BUFX4M U125 ( .A(N9), .Y(n92) );
endmodule


module FIFO_WR_ADDRESS_BITS3 ( W_CLK, W_RST, WINC, RINC, WQ2_RPTR, W_FULL, 
        W_ADDRESS, W_PTR );
  input [3:0] WQ2_RPTR;
  output [2:0] W_ADDRESS;
  output [3:0] W_PTR;
  input W_CLK, W_RST, WINC, RINC;
  output W_FULL;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14;

  DFFRQX2M \add_ptr_reg[3]  ( .D(n14), .CK(W_CLK), .RN(W_RST), .Q(W_PTR[3]) );
  DFFRQX2M \add_ptr_reg[2]  ( .D(n11), .CK(W_CLK), .RN(W_RST), .Q(W_ADDRESS[2]) );
  DFFRQX2M \add_ptr_reg[0]  ( .D(n12), .CK(W_CLK), .RN(W_RST), .Q(W_ADDRESS[0]) );
  DFFRQX2M \add_ptr_reg[1]  ( .D(n10), .CK(W_CLK), .RN(W_RST), .Q(W_ADDRESS[1]) );
  NAND2X2M U3 ( .A(WINC), .B(n4), .Y(n3) );
  INVX2M U4 ( .A(n4), .Y(W_FULL) );
  NOR2BX2M U5 ( .AN(W_ADDRESS[0]), .B(n3), .Y(n1) );
  XNOR2X2M U6 ( .A(W_PTR[0]), .B(WQ2_RPTR[0]), .Y(n6) );
  XNOR2X2M U7 ( .A(W_ADDRESS[0]), .B(n3), .Y(n12) );
  XNOR2X2M U8 ( .A(W_ADDRESS[2]), .B(n2), .Y(n11) );
  NAND2X2M U9 ( .A(n1), .B(W_ADDRESS[1]), .Y(n2) );
  NAND4X2M U10 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n4) );
  CLKXOR2X2M U11 ( .A(W_PTR[3]), .B(WQ2_RPTR[3]), .Y(n9) );
  CLKXOR2X2M U12 ( .A(WQ2_RPTR[2]), .B(W_PTR[2]), .Y(n8) );
  XNOR2X2M U13 ( .A(W_PTR[1]), .B(WQ2_RPTR[1]), .Y(n7) );
  XNOR2X2M U14 ( .A(W_PTR[3]), .B(n5), .Y(n14) );
  NAND3X2M U15 ( .A(W_ADDRESS[1]), .B(W_ADDRESS[2]), .C(n1), .Y(n5) );
  CLKXOR2X2M U16 ( .A(W_PTR[3]), .B(W_ADDRESS[2]), .Y(W_PTR[2]) );
  CLKXOR2X2M U17 ( .A(W_ADDRESS[1]), .B(W_ADDRESS[2]), .Y(W_PTR[1]) );
  CLKXOR2X2M U18 ( .A(W_ADDRESS[0]), .B(W_ADDRESS[1]), .Y(W_PTR[0]) );
  CLKXOR2X2M U19 ( .A(W_ADDRESS[1]), .B(n1), .Y(n10) );
endmodule


module FIFO_RD_ADDRESS_BITS3 ( R_CLK, R_RST, RINC, RQ2_WPTR, R_EMPTY, 
        R_ADDRESS, R_PTR );
  input [3:0] RQ2_WPTR;
  output [2:0] R_ADDRESS;
  output [3:0] R_PTR;
  input R_CLK, R_RST, RINC;
  output R_EMPTY;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  DFFRQX2M \add_ptrr_reg[3]  ( .D(n12), .CK(R_CLK), .RN(R_RST), .Q(R_PTR[3])
         );
  DFFRX1M \add_ptrr_reg[0]  ( .D(n15), .CK(R_CLK), .RN(R_RST), .Q(R_ADDRESS[0]), .QN(n2) );
  DFFRQX2M \add_ptrr_reg[2]  ( .D(n13), .CK(R_CLK), .RN(R_RST), .Q(
        R_ADDRESS[2]) );
  DFFRQX2M \add_ptrr_reg[1]  ( .D(n14), .CK(R_CLK), .RN(R_RST), .Q(
        R_ADDRESS[1]) );
  INVX2M U3 ( .A(n7), .Y(R_EMPTY) );
  XNOR2X2M U4 ( .A(R_PTR[1]), .B(RQ2_WPTR[1]), .Y(n8) );
  XNOR2X2M U5 ( .A(n2), .B(R_ADDRESS[1]), .Y(R_PTR[0]) );
  NOR2X2M U6 ( .A(n6), .B(n2), .Y(n5) );
  XNOR2X2M U7 ( .A(R_ADDRESS[2]), .B(n4), .Y(n13) );
  NAND4X2M U8 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n7) );
  XNOR2X2M U9 ( .A(R_PTR[3]), .B(RQ2_WPTR[3]), .Y(n10) );
  XNOR2X2M U10 ( .A(R_PTR[2]), .B(RQ2_WPTR[2]), .Y(n11) );
  XNOR2X2M U11 ( .A(R_PTR[0]), .B(RQ2_WPTR[0]), .Y(n9) );
  NAND2X2M U12 ( .A(n5), .B(R_ADDRESS[1]), .Y(n4) );
  NAND2X2M U13 ( .A(RINC), .B(n7), .Y(n6) );
  XNOR2X2M U14 ( .A(R_PTR[3]), .B(n3), .Y(n12) );
  NAND2BX2M U15 ( .AN(n4), .B(R_ADDRESS[2]), .Y(n3) );
  CLKXOR2X2M U16 ( .A(R_ADDRESS[1]), .B(R_ADDRESS[2]), .Y(R_PTR[1]) );
  CLKXOR2X2M U17 ( .A(R_PTR[3]), .B(R_ADDRESS[2]), .Y(R_PTR[2]) );
  CLKXOR2X2M U18 ( .A(R_ADDRESS[1]), .B(n5), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n2), .B(n6), .Y(n15) );
endmodule


module DF_SYNC_ADDRESS_BITS3 ( W_CLK, W_RST, R_CLK, R_RST, W_PTR, R_PTR, 
        RQ2_WPTR, WQ2_RPTR );
  input [3:0] W_PTR;
  input [3:0] R_PTR;
  output [3:0] RQ2_WPTR;
  output [3:0] WQ2_RPTR;
  input W_CLK, W_RST, R_CLK, R_RST;

  wire   [3:0] W_SYNC;
  wire   [3:0] R_SYNC;

  DFFRQX2M \RQ2_WPTR_reg[3]  ( .D(R_SYNC[3]), .CK(R_CLK), .RN(R_RST), .Q(
        RQ2_WPTR[3]) );
  DFFRQX2M \RQ2_WPTR_reg[2]  ( .D(R_SYNC[2]), .CK(R_CLK), .RN(R_RST), .Q(
        RQ2_WPTR[2]) );
  DFFRQX2M \RQ2_WPTR_reg[1]  ( .D(R_SYNC[1]), .CK(R_CLK), .RN(R_RST), .Q(
        RQ2_WPTR[1]) );
  DFFRQX2M \RQ2_WPTR_reg[0]  ( .D(R_SYNC[0]), .CK(R_CLK), .RN(R_RST), .Q(
        RQ2_WPTR[0]) );
  DFFRQX2M \WQ2_RPTR_reg[1]  ( .D(W_SYNC[1]), .CK(W_CLK), .RN(W_RST), .Q(
        WQ2_RPTR[1]) );
  DFFRQX2M \WQ2_RPTR_reg[0]  ( .D(W_SYNC[0]), .CK(W_CLK), .RN(W_RST), .Q(
        WQ2_RPTR[0]) );
  DFFRQX2M \WQ2_RPTR_reg[3]  ( .D(W_SYNC[3]), .CK(W_CLK), .RN(W_RST), .Q(
        WQ2_RPTR[3]) );
  DFFRQX2M \WQ2_RPTR_reg[2]  ( .D(W_SYNC[2]), .CK(W_CLK), .RN(W_RST), .Q(
        WQ2_RPTR[2]) );
  DFFRQX2M \R_SYNC_reg[3]  ( .D(W_PTR[3]), .CK(R_CLK), .RN(R_RST), .Q(
        R_SYNC[3]) );
  DFFRQX2M \R_SYNC_reg[2]  ( .D(W_PTR[2]), .CK(R_CLK), .RN(R_RST), .Q(
        R_SYNC[2]) );
  DFFRQX2M \R_SYNC_reg[1]  ( .D(W_PTR[1]), .CK(R_CLK), .RN(R_RST), .Q(
        R_SYNC[1]) );
  DFFRQX2M \R_SYNC_reg[0]  ( .D(W_PTR[0]), .CK(R_CLK), .RN(R_RST), .Q(
        R_SYNC[0]) );
  DFFRQX2M \W_SYNC_reg[2]  ( .D(R_PTR[2]), .CK(W_CLK), .RN(W_RST), .Q(
        W_SYNC[2]) );
  DFFRQX2M \W_SYNC_reg[1]  ( .D(R_PTR[1]), .CK(W_CLK), .RN(W_RST), .Q(
        W_SYNC[1]) );
  DFFRQX2M \W_SYNC_reg[0]  ( .D(R_PTR[0]), .CK(W_CLK), .RN(W_RST), .Q(
        W_SYNC[0]) );
  DFFRQX2M \W_SYNC_reg[3]  ( .D(R_PTR[3]), .CK(W_CLK), .RN(W_RST), .Q(
        W_SYNC[3]) );
endmodule


module FIFO_TOP_DATA_WIDTH_TOP8_FIFO_DEPTH_TOP8_ADDRESS_BITS_TOP3 ( W_CLK, 
        W_RST, R_CLK, R_RST, WINC, RINC, W_DATA, W_FULL, R_EMPTY, R_DATA );
  input [7:0] W_DATA;
  output [7:0] R_DATA;
  input W_CLK, W_RST, R_CLK, R_RST, WINC, RINC;
  output W_FULL, R_EMPTY;

  wire   [2:0] W_ADDRESS;
  wire   [2:0] R_ADDRESS;
  wire   [3:0] WQ2_RPTR;
  wire   [3:0] W_PTR;
  wire   [3:0] RQ2_WPTR;
  wire   [3:0] R_PTR;

  FIFO_BUFFER_DATA_WIDTH8_FIFO_DEPTH8_ADDRESS_BITS3 FIFO_BUFFER ( .W_CLK(W_CLK), .W_RST(W_RST), .WINC(WINC), .W_FULL(W_FULL), .W_DATA(W_DATA), .W_ADDRESS(
        W_ADDRESS), .R_ADDRESS(R_ADDRESS), .R_DATA(R_DATA) );
  FIFO_WR_ADDRESS_BITS3 FIFO_WR ( .W_CLK(W_CLK), .W_RST(W_RST), .WINC(WINC), 
        .RINC(RINC), .WQ2_RPTR(WQ2_RPTR), .W_FULL(W_FULL), .W_ADDRESS(
        W_ADDRESS), .W_PTR(W_PTR) );
  FIFO_RD_ADDRESS_BITS3 FIFO_RD ( .R_CLK(R_CLK), .R_RST(R_RST), .RINC(RINC), 
        .RQ2_WPTR(RQ2_WPTR), .R_EMPTY(R_EMPTY), .R_ADDRESS(R_ADDRESS), .R_PTR(
        R_PTR) );
  DF_SYNC_ADDRESS_BITS3 DF_SYNC ( .W_CLK(W_CLK), .W_RST(W_RST), .R_CLK(R_CLK), 
        .R_RST(R_RST), .W_PTR(W_PTR), .R_PTR(R_PTR), .RQ2_WPTR(RQ2_WPTR), 
        .WQ2_RPTR(WQ2_RPTR) );
endmodule


module SYSTEM_TOP ( REF_CLK, UART_CLK, RST, RX_IN, Tx_OUT, Parity_error, 
        Stop_error );
  input REF_CLK, UART_CLK, RST, RX_IN;
  output Tx_OUT, Parity_error, Stop_error;
  wire   RST_SYNC_1, RST_SYNC_2, TX_CLK, RX_CLK, CLK_GATE_EN, ALU_CLK,
         PULSE_GEN, RINC, DATA_VALID, pulse_gen, R_EMPTY, W_FULL, R_DATA_VALID,
         ALU_OUT_VALID, WINC, W_REG_EN, R_REG_EN, ALU_EN, n1, n2, n3, n4, n5;
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

  RESET_SYNC_NUM_STAGES2_0 RESET_SYNC_1 ( .CLK(UART_CLK), .RST(RST), 
        .RST_SYNC(RST_SYNC_1) );
  RESET_SYNC_NUM_STAGES2_1 RESET_SYNC_2 ( .CLK(REF_CLK), .RST(RST), .RST_SYNC(
        RST_SYNC_2) );
  PRESCALE_BLOCK PRESCALE_BLOCK ( .PRESCALE(UART_CONFIG[7:2]), .DIV_RATIO({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO[3:0]}) );
  CLK_DIV_0 CLK_DIV_TX ( .RST_EN(n4), .I_REF_CLK(UART_CLK), .CLK_EN(1'b1), 
        .DIV_RATIO(REG3), .O_DIV_CLK(TX_CLK) );
  CLK_DIV_1 CLK_DIV_RX ( .RST_EN(n4), .I_REF_CLK(UART_CLK), .CLK_EN(1'b1), 
        .DIV_RATIO({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO[3:0]}), .O_DIV_CLK(
        RX_CLK) );
  CLOCK_GATING CLOCK_GATING ( .REF_CLK(REF_CLK), .CLK_GATE_EN(CLK_GATE_EN), 
        .ALU_CLK(ALU_CLK) );
  PULSE_GENRATOR_BLOCK PULSE_GENRATOR_BLOCK ( .TX_CLK(TX_CLK), .PULSE_GEN(
        PULSE_GEN), .RINC(RINC) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 DATA_SYNC ( .CLK(REF_CLK), .RST(n2), .EN(
        DATA_VALID), .UNSYNC_BUS(P_DATA), .enable_pulse(pulse_gen), .SYNC_BUS(
        SYNC_BUS) );
  SYS_UART_TOP_DATA_WIDTH8 SYS_UART_TOP ( .TX_CLK(TX_CLK), .RX_CLK(RX_CLK), 
        .RST_SYNC_1(n4), .RX_IN(RX_IN), .R_EMPTY(R_EMPTY), .UART_CONFIG(
        UART_CONFIG), .R_DATA(R_DATA), .Tx_OUT(Tx_OUT), .DATA_VALID(DATA_VALID), .Stop_error(Stop_error), .Parity_error(Parity_error), .PULSE_GEN(PULSE_GEN), 
        .P_DATA(P_DATA) );
  SYSTEM_CONTROL_DATA_WIDTH8 SYSTEM_CONTROL ( .REF_CLK(REF_CLK), .RST_SYNC_2(
        n2), .pulse_gen(pulse_gen), .W_FULL(W_FULL), .R_DATA_VALID(
        R_DATA_VALID), .ALU_OUT_VALID(ALU_OUT_VALID), .SYNC_BUS(SYNC_BUS), 
        .R_REG_DATA(R_REG_DATA), .ALU_OUT(ALU_OUT), .WINC(WINC), .W_REG_EN(
        W_REG_EN), .R_REG_EN(R_REG_EN), .ALU_EN(ALU_EN), .CLK_GATE_EN(
        CLK_GATE_EN), .W_DATA(W_DATA), .W_REG_DATA(W_REG_DATA), .REG_ADDRESS(
        REG_ADDRESS), .ALU_FUNC(ALU_FUNC) );
  Reg_file_DATA_WIDTH8_ADDRESS_BITS3 Reg_file ( .CLK(REF_CLK), .RST(n2), 
        .R_REG_EN(R_REG_EN), .W_REG_EN(W_REG_EN), .REG_ADDRESS({
        REG_ADDRESS[3:1], n1}), .W_REG_DATA(W_REG_DATA), .R_DATA_VALID(
        R_DATA_VALID), .R_REG_DATA(R_REG_DATA), .REG0(REG0), .REG1(REG1), 
        .REG2(UART_CONFIG), .REG3(REG3) );
  ALU_RTL_DATA_WIDTH8 ALU_RTL ( .ALU_CLK(ALU_CLK), .RST_SYNC_2(n2), .ALU_EN(
        ALU_EN), .REG0(REG0), .REG1(REG1), .ALU_FUNC(ALU_FUNC), .ALU_OUT(
        ALU_OUT), .ALU_OUT_VALID(ALU_OUT_VALID) );
  FIFO_TOP_DATA_WIDTH_TOP8_FIFO_DEPTH_TOP8_ADDRESS_BITS_TOP3 FIFO_TOP ( 
        .W_CLK(REF_CLK), .W_RST(n2), .R_CLK(TX_CLK), .R_RST(n4), .WINC(WINC), 
        .RINC(RINC), .W_DATA(W_DATA), .W_FULL(W_FULL), .R_EMPTY(R_EMPTY), 
        .R_DATA(R_DATA) );
  INVX2M U1 ( .A(n5), .Y(n4) );
  BUFX2M U2 ( .A(REG_ADDRESS[0]), .Y(n1) );
  INVX4M U3 ( .A(n3), .Y(n2) );
  INVX2M U4 ( .A(RST_SYNC_2), .Y(n3) );
  INVX2M U5 ( .A(RST_SYNC_1), .Y(n5) );
endmodule

