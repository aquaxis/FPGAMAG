`timescale 1ns / 1ps

module Timing_tb;

   reg RST_N, CLK;

   wire VSYNC, HSYNC, ENA;
   reg [7:0]   DIN;

   wire [10:0] CAM_ADRS;
   wire 	   CAM_BANK0_WE;
   wire 	   CAM_BANK1_WE;
   wire 	   CAM_BANK2_WE;
   wire [7:0]  CAM_DOUT;
   wire [11:0] CAM_HC;
   wire [11:0] CAM_VC;
   wire [10:0] RT1_ADRS;
   wire [5:0]  RT2G_ADRS;
   wire 	   RT2G_VALID;
   wire [5:0]  RT2M_ADRS;
   wire 	   RT2M_VALID;
   wire [5:0]  RT3_ADRS;
   wire 	   RT3_VALID;
   wire [9:0]  RT4_ADDR;
   wire 	   RT4_SEL;
   wire 	   RT4_VALID;
   wire 	   RT5_RESTART_H;
   wire 	   RT5_RESTART_V;
   wire [3:0]  RT5_SEL;
   wire [9:0]  RT5_ADDR0;
   wire [9:0]  RT5_ADDR1;
   wire [9:0]  RT5_ADDR2;
   wire [9:0]  RT5_ADDR3;
   wire [9:0]  RT5_ADDR4;
   wire [9:0]  RT5_ADDR5;
   wire [9:0]  RT5_ADDR6;
   wire [9:0]  RT5_ADDR7;
   wire [9:0]  RT5_ADDR8;

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
   wait(CAM_VC == 20);
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
   reg     buf_ena;


   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         pixel <= 9999;
         line <= 9999;
         buf_ena <= 0;

      end else begin
         if(pixel >= (1300-1)) begin
            pixel <= 0;
         end else begin
            pixel <= pixel +1;
         end
         if(pixel >= (1300-1)) begin
            if(line >= (800-1)) begin
               line <= 0;
            end else begin
               line <= line +1;
            end
         end
         if(pixel < 1280) begin
            buf_ena <= 1'b1;
         end else begin
            buf_ena <= 1'b0;
         end
      end // else: !if(!RST_N)
   end // always @ (posedge CLK or negedge RST_N)

   assign ENA = ((pixel < 1280) && (line < 720))?1'b1:1'b0;
   assign HSYNC = (pixel == 0);
   assign VSYNC = (line == 0);

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
		 DIN <= 8'd0;
	  end else begin
		 if(ENA) begin
			DIN <= DIN + 8'd1;
		 end
	  end
   end


Timing_wrapper u_Timing_wrapper
  (
   .RST_N(RST_N),
   .CLK(CLK),

   .DIN(DIN),
   .ENA(ENA),
   .HSYNC(ENA),
   .VSYNC(VSYNC),

   .CAM_ADRS(CAM_ADRS),
   .CAM_BANK0_WE(CAM_BANK0_WE),
   .CAM_BANK1_WE(CAM_BANK1_WE),
   .CAM_BANK2_WE(CAM_BANK2_WE),
   .CAM_DOUT(CAM_DOUT),
   .CAM_HC(CAM_HC),
   .CAM_VC(CAM_VC),

   .RT1_ADRS(RT1_ADRS),

   .RT2G_ADRS(RT2G_ADRS),
   .RT2G_VALID(RT2G_VALID),
   .RT2M_ADRS(RT2M_ADRS),
   .RT2M_VALID(RT2M_VALID),

   .RT3_ADRS(RT3_ADRS),
   .RT3_VALID(RT3_VALID),

   .RT4_ADDR(RT4_ADDR),
   .RT4_SEL(RT4_SEL),
   .RT4_VALID(RT4_VALID),

   .RT5_RESTART_H(RT5_RESTART_H),
   .RT5_RESTART_V(RT5_RESTART_V),
   .RT5_SEL(RT5_SEL),

   .RT5_ADDR0(RT5_ADDR0),
   .RT5_ADDR1(RT5_ADDR1),
   .RT5_ADDR2(RT5_ADDR2),
   .RT5_ADDR3(RT5_ADDR3),
   .RT5_ADDR4(RT5_ADDR4),
   .RT5_ADDR5(RT5_ADDR5),
   .RT5_ADDR6(RT5_ADDR6),
   .RT5_ADDR7(RT5_ADDR7),
   .RT5_ADDR8(RT5_ADDR8)
);
endmodule
