module aq_fifosplit32_w(
  input CLK,

  output WR_IN_RE,
  input [31:0] WR_IN_DATA,
  input WR_IN_EMPTY,

  input WR_OUT_RE,
  output [31:0] WR_OUT_DO,
  output WR_OUT_EMPTY
);

assign WR_IN_RE = WR_OUT_RE;
assign WR_OUT_DO = WR_IN_DATA;
assign WR_OUT_EMPTY = WR_IN_EMPTY;

endmodule
