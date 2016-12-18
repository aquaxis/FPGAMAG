module RAM8x2048
  (
  input [10:0] addra,
  input clka,
  input [7:0] dina,
  output [7:0] douta,
  input [0:0] wea,
  input [10:0] addrb,
  input clkb,
  input [7:0] dinb,
  output [7:0] doutb,
  input [0:0] web
   );

ram8x2048 u_ram8x2048
(
    .clka(clka),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .wea(wea),
    .clkb(clkb),
    .addrb(addrb),
    .dinb(dinb),
    .doutb(doutb),
    .web(web)
		   );

endmodule // RAM8x2048
