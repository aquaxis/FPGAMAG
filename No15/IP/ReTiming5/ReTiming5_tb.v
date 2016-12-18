`timescale 1ns / 1ps

module ReTiming5_tb;

   reg RST_N, CLK;

   wire VSYNC, HSYNC;

   wire        RESTART_V, RESTART_H;
   wire [9:0] ADRS;
   wire [3:0]  SELECT;

   localparam CLK100M = 10;

initial begin
   RST_N <= 1'b0;
   CLK <= 1'b0;
   #100;

   @(posedge CLK);

   RST_N <= 1'b1;

   $display("Simulatin Start");
end

always  begin
   #(CLK100M/2) CLK <= ~CLK;
end

initial begin
   wait(RESTART_V);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   @(posedge CLK);
   $display("Simulatin Finish");
   $finish();
end

initial begin
   wait(!RST_N);

   @(posedge CLK);

   $display("Process Start");

  wait(CLK);

end

   integer pixel, line;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         pixel <= 9999;
         line <= 9999;
      end else begin
         if(pixel >= (3200-1)) begin
            pixel <= 0;
         end else begin
            pixel <= pixel +1;
         end
         if(pixel >= (3200-1)) begin
            if(line >= (960-1)) begin
               line <= 0;
            end else begin
               line <= line +1;
            end
         end
      end // else: !if(!RST_N)
   end // always @ (posedge CLK or negedge RST_N)

   assign HSYNC = (pixel == 0);
   assign VSYNC = (line == 0);

ReTiming5
  #(
    .RETIMING_H(66),
    .RETIMING_V(0)
    )
   u_ReTiming5
     (
      .RST_N(RST_N),
      .CLK(CLK),

      .VSYNC(VSYNC),
      .HSYNC(HSYNC),

      .WIDTH(1280),
      .HEIGHT(720),

      .ADRS(ADRS),
      .SELECT(SELECT),

      .RESTART_H(RESTART_H),
      .RESTART_V(RESTART_V)
      );
endmodule
