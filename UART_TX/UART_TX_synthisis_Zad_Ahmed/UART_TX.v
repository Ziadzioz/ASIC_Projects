/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Jul 26 03:52:35 2024
/////////////////////////////////////////////////////////////


module serializer ( P_DATA, ser_en, RST, CLK, ser_done, ser_data );
  input [7:0] P_DATA;
  input ser_en, RST, CLK;
  output ser_done, ser_data;
  wire   N3, N4, N5, N24, n5, n6, n7, n8, n9, n10, n1, n2, n3, n4, n11, n12;

  DFFRX1M \counter_reg[2]  ( .D(n8), .CK(CLK), .RN(RST), .Q(N5) );
  DFFRX2M \counter_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(N3), .QN(n11) );
  DFFRX4M \counter_reg[1]  ( .D(n9), .CK(CLK), .RN(RST), .Q(N4), .QN(n12) );
  NAND4X2M U3 ( .A(N4), .B(N3), .C(ser_en), .D(n1), .Y(n6) );
  OAI32X2M U4 ( .A0(n11), .A1(N4), .A2(n4), .B0(n7), .B1(n12), .Y(n9) );
  INVX2M U5 ( .A(N5), .Y(n1) );
  MX4XLM U6 ( .A(P_DATA[0]), .B(P_DATA[1]), .C(P_DATA[2]), .D(P_DATA[3]), .S0(
        N3), .S1(N4), .Y(n3) );
  MX4XLM U7 ( .A(P_DATA[4]), .B(P_DATA[5]), .C(P_DATA[6]), .D(P_DATA[7]), .S0(
        N3), .S1(N4), .Y(n2) );
  AND2X1M U8 ( .A(n7), .B(N4), .Y(n5) );
  NOR3X4M U9 ( .A(n1), .B(n11), .C(n12), .Y(ser_done) );
  INVX2M U10 ( .A(ser_en), .Y(n4) );
  NOR2X2M U11 ( .A(n11), .B(n4), .Y(n7) );
  NOR2BX2M U12 ( .AN(N24), .B(n4), .Y(ser_data) );
  MX2X2M U13 ( .A(n3), .B(n2), .S0(N5), .Y(N24) );
  XNOR2X2M U14 ( .A(n4), .B(N3), .Y(n10) );
  OAI21X2M U15 ( .A0(n5), .A1(n1), .B0(n6), .Y(n8) );
endmodule


module FSM ( CLK, RST, party_en, ser_done, data_valid, busy, ser_en, mux_sel
 );
  output [2:0] mux_sel;
  input CLK, RST, party_en, ser_done, data_valid;
  output busy, ser_en;
  wire   n4, n5, n6, n7, n3, n8, n10, n11;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRX4M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]), .QN(n11) );
  DFFRX4M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n10) );
  DFFRQX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  NOR3X6M U3 ( .A(n10), .B(n8), .C(n11), .Y(ser_en) );
  AO22X1M U4 ( .A0(current_state[0]), .A1(n8), .B0(n11), .B1(n10), .Y(
        mux_sel[2]) );
  AOI21X2M U5 ( .A0(n6), .A1(n7), .B0(n8), .Y(next_state[0]) );
  OAI21X2M U6 ( .A0(current_state[0]), .A1(data_valid), .B0(n11), .Y(n7) );
  AOI21X2M U7 ( .A0(n11), .A1(current_state[0]), .B0(mux_sel[1]), .Y(n5) );
  NOR2X3M U8 ( .A(n11), .B(current_state[0]), .Y(mux_sel[1]) );
  INVXLM U9 ( .A(current_state[2]), .Y(n3) );
  INVX4M U10 ( .A(n3), .Y(n8) );
  INVX8M U11 ( .A(mux_sel[2]), .Y(busy) );
  OR2X2M U12 ( .A(n5), .B(n8), .Y(mux_sel[0]) );
  AOI2B1X1M U13 ( .A1N(mux_sel[1]), .A0(n4), .B0(n8), .Y(next_state[2]) );
  NAND3BXLM U14 ( .AN(party_en), .B(current_state[1]), .C(ser_done), .Y(n4) );
  OR2X1M U15 ( .A(ser_done), .B(n10), .Y(n6) );
  OAI21BX1M U16 ( .A0(n8), .A1(n5), .B0N(ser_en), .Y(next_state[1]) );
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


module UART_TOP ( CLK, RST, party_en, data_valid, party_typ, P_DATA, busy, 
        Tx_OUT );
  input [7:0] P_DATA;
  input CLK, RST, party_en, data_valid, party_typ;
  output busy, Tx_OUT;
  wire   ser_done, ser_en, ser_data, party_bit, n1, n2;
  wire   [2:0] mux_sel;

  serializer serial ( .P_DATA(P_DATA), .ser_en(ser_en), .RST(n2), .CLK(CLK), 
        .ser_done(ser_done), .ser_data(ser_data) );
  FSM FSM ( .CLK(CLK), .RST(n2), .party_en(party_en), .ser_done(ser_done), 
        .data_valid(data_valid), .busy(busy), .ser_en(ser_en), .mux_sel(
        mux_sel) );
  parity_calc parity ( .party_typ(party_typ), .data_valid(data_valid), 
        .P_DATA(P_DATA), .party_bit(party_bit) );
  MUX MUX ( .mux_sel(mux_sel), .ser_data(ser_data), .party_bit(party_bit), 
        .Tx_OUT(Tx_OUT) );
  INVXLM U1 ( .A(RST), .Y(n1) );
  INVX4M U2 ( .A(n1), .Y(n2) );
endmodule

