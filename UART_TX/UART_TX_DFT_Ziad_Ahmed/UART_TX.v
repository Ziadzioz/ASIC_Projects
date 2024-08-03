/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug  2 02:34:42 2024
/////////////////////////////////////////////////////////////


module DFT_MUX_1 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  CLKMX2X4M U1 ( .A(in_0), .B(in_1), .S0(sel), .Y(out) );
endmodule


module DFT_MUX_0 ( in_0, in_1, sel, out );
  input in_0, in_1, sel;
  output out;


  CLKMX2X4M U1 ( .A(in_0), .B(in_1), .S0(sel), .Y(out) );
endmodule


module serializer_test_1 ( P_DATA, ser_en, RST, CLK, ser_done, ser_data, 
        test_si, test_so, test_se );
  input [7:0] P_DATA;
  input ser_en, RST, CLK, test_si, test_se;
  output ser_done, ser_data, test_so;
  wire   N3, N4, N5, N24, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19;

  MX4XLM U7 ( .A(P_DATA[0]), .B(P_DATA[1]), .C(P_DATA[2]), .D(P_DATA[3]), .S0(
        N3), .S1(N4), .Y(n15) );
  MX4XLM U8 ( .A(P_DATA[4]), .B(P_DATA[5]), .C(P_DATA[6]), .D(P_DATA[7]), .S0(
        N3), .S1(N4), .Y(n14) );
  AND3X1M U9 ( .A(N4), .B(test_so), .C(N3), .Y(ser_done) );
  INVX2M U13 ( .A(ser_en), .Y(n16) );
  NOR2X2M U14 ( .A(n17), .B(n16), .Y(n10) );
  NOR2BX2M U15 ( .AN(N24), .B(n16), .Y(ser_data) );
  MX2X2M U16 ( .A(n15), .B(n14), .S0(N5), .Y(N24) );
  XNOR2X2M U18 ( .A(n16), .B(N3), .Y(n13) );
  OAI21X2M U19 ( .A0(n8), .A1(n19), .B0(n9), .Y(n11) );
  AND2X2M U20 ( .A(n10), .B(N4), .Y(n8) );
  DLY1X1M U21 ( .A(N5), .Y(test_so) );
  SDFFRX1M \counter_reg[2]  ( .D(n11), .SI(n18), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(N5), .QN(n19) );
  SDFFRX4M \counter_reg[1]  ( .D(n12), .SI(n17), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(N4), .QN(n18) );
  SDFFRX4M \counter_reg[0]  ( .D(n13), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(N3), .QN(n17) );
  NAND4X2M U3 ( .A(N4), .B(N3), .C(ser_en), .D(n19), .Y(n9) );
  OAI32X2M U4 ( .A0(n17), .A1(N4), .A2(n16), .B0(n10), .B1(n18), .Y(n12) );
endmodule


module FSM_test_1 ( CLK, RST, party_en, ser_done, data_valid, busy, ser_en, 
        mux_sel, test_si, test_so, test_se );
  output [2:0] mux_sel;
  input CLK, RST, party_en, ser_done, data_valid, test_si, test_se;
  output busy, ser_en, test_so;
  wire   n7, n8, n9, n10, n13, n14;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  AO22X1M U6 ( .A0(current_state[0]), .A1(current_state[2]), .B0(n14), .B1(n13), .Y(mux_sel[2]) );
  OAI21X2M U7 ( .A0(current_state[0]), .A1(data_valid), .B0(n14), .Y(n10) );
  AOI21X2M U8 ( .A0(n14), .A1(current_state[0]), .B0(mux_sel[1]), .Y(n8) );
  NOR2X4M U9 ( .A(n14), .B(current_state[0]), .Y(mux_sel[1]) );
  NOR3X6M U10 ( .A(n13), .B(current_state[2]), .C(n14), .Y(ser_en) );
  AOI21X1M U11 ( .A0(n9), .A1(n10), .B0(current_state[2]), .Y(next_state[0])
         );
  OR2X1M U12 ( .A(n8), .B(current_state[2]), .Y(mux_sel[0]) );
  INVX8M U16 ( .A(mux_sel[2]), .Y(busy) );
  OR2X2M U17 ( .A(ser_done), .B(n13), .Y(n9) );
  AOI2B1X1M U18 ( .A1N(mux_sel[1]), .A0(n7), .B0(current_state[2]), .Y(
        next_state[2]) );
  NAND3BX2M U19 ( .AN(party_en), .B(current_state[1]), .C(ser_done), .Y(n7) );
  OAI21BX1M U20 ( .A0(current_state[2]), .A1(n8), .B0N(ser_en), .Y(
        next_state[1]) );
  SDFFRX4M \current_state_reg[1]  ( .D(next_state[1]), .SI(n13), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]), .QN(n14) );
  SDFFRX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]), .QN(n13) );
  SDFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
endmodule


module parity_calc ( party_typ, data_valid, P_DATA, party_bit );
  input [7:0] P_DATA;
  input party_typ, data_valid;
  output party_bit;
  wire   n1, n2, n3, n4, n5;

  AND2X2M U2 ( .A(data_valid), .B(n1), .Y(party_bit) );
  XNOR2X2M U3 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n4) );
  XOR3XLM U4 ( .A(party_typ), .B(n2), .C(n3), .Y(n1) );
  XOR3XLM U5 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n5), .Y(n2) );
  XOR3XLM U6 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n4), .Y(n3) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n5) );
endmodule


module MUX ( mux_sel, ser_data, party_bit, Tx_OUT );
  input [2:0] mux_sel;
  input ser_data, party_bit;
  output Tx_OUT;
  wire   n2;

  AOI211X4M U3 ( .A0(ser_data), .A1(mux_sel[0]), .B0(mux_sel[2]), .C0(
        mux_sel[1]), .Y(n2) );
  INVX8M U4 ( .A(n2), .Y(Tx_OUT) );
endmodule


module UART_TOP ( CLK, RST, party_en, data_valid, party_typ, SI, test_mode, SE, 
        scan_clk, scan_rst, P_DATA, busy, Tx_OUT, SO );
  input [7:0] P_DATA;
  input CLK, RST, party_en, data_valid, party_typ, SI, test_mode, SE, scan_clk,
         scan_rst;
  output busy, Tx_OUT, SO;
  wire   scanclk, scanrst, ser_done, ser_en, ser_data, party_bit, n3;
  wire   [2:0] mux_sel;

  DFT_MUX_1 DFT_MUX_0 ( .in_0(CLK), .in_1(scan_clk), .sel(test_mode), .out(
        scanclk) );
  DFT_MUX_0 DFT_MUX_1 ( .in_0(RST), .in_1(scan_rst), .sel(test_mode), .out(
        scanrst) );
  serializer_test_1 serial ( .P_DATA(P_DATA), .ser_en(ser_en), .RST(scanrst), 
        .CLK(scanclk), .ser_done(ser_done), .ser_data(ser_data), .test_si(n3), 
        .test_so(SO), .test_se(SE) );
  FSM_test_1 FSM ( .CLK(scanclk), .RST(scanrst), .party_en(party_en), 
        .ser_done(ser_done), .data_valid(data_valid), .busy(busy), .ser_en(
        ser_en), .mux_sel(mux_sel), .test_si(SI), .test_so(n3), .test_se(SE)
         );
  parity_calc parity ( .party_typ(party_typ), .data_valid(data_valid), 
        .P_DATA(P_DATA), .party_bit(party_bit) );
  MUX MUX ( .mux_sel(mux_sel), .ser_data(ser_data), .party_bit(party_bit), 
        .Tx_OUT(Tx_OUT) );
endmodule

