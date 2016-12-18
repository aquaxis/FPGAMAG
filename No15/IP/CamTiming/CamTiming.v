/*
 * Copyright (C)2016 AQUAXIS TECHNOLOGY.
 *  Don't remove this header.
 * When you use this source, there is a need to inherit this header.
 *
 * License
 *  For no commercial -
 *   License:     The Open Software License 3.0
 *   License URI: http://www.opensource.org/licenses/OSL-3.0
 *
 *  For commmercial -
 *   License:     AQUAXIS License 1.0
 *   License URI: http://www.aquaxis.com/licenses
 *
 * For further information please contact.
 *	URI:    http://www.aquaxis.com/
 *	E-Mail: info(at)aquaxis.com
 */
/*
 Camera timinig
 please, custominze for YUYV
 */
module CamTiming
   (
    input 		  RST_N,
    input 		  CLK,

    input 		  VSYNC,
    input 		  HSYNC,
    input 		  ENA,

    output [10:0] ADRS,

    output 		  RESTART_H,
    output 		  RESTART_V,

	input [7:0]   DIN,
	output [7:0]  DOUT,

	output [11:0] HC,
	output [11:0] VC,

	output 		  BANK0_WE,
	output 		  BANK1_WE,
	output 		  BANK2_WE
    );

`define RETIMING_H 1279
`define RETIMING_V 1

   reg            buf_vsync, buf_hsync, buf_ena;
   reg            buf_vsync_d, buf_hsync_d;
   reg            buf_valid, buf_restart_h, buf_restart_v;
   reg [7:0] 	  buf_data;

   reg [11:0] 	  hcount;
   reg [11:0]     vcount;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_vsync <= 1'b0;
         buf_hsync <= 1'b0;
         buf_ena <= 1'b0;
         buf_vsync_d <= 1'b0;
         buf_hsync_d <= 1'b0;
		 buf_data[7:0] <= 8'd0;
      end else begin
         buf_vsync <= VSYNC;
         buf_hsync <= HSYNC;
         buf_ena <= ENA;
         buf_vsync_d <= buf_vsync;
         buf_hsync_d <= buf_hsync;
		 buf_data[7:0] <= DIN[7:0];
      end
   end

   wire w_hup, w_vup;

   assign w_hup = buf_ena;
   assign w_vup = !buf_hsync & buf_hsync_d;

   reg [11:0] adrs;
   reg [1:0]  bank;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_valid     <= 1'b0;
         hcount[11:0]  <= 12'd0;
         vcount[11:0]  <= 12'd0;
         buf_restart_v <= 1'b0;
         buf_restart_h <= 1'b0;
         adrs[11:0]    <= 12'd0;
         bank[1:0]     <= 2'd0;
      end else begin
         buf_valid <= buf_ena;
         // HSYNC Count
         if(!w_hup) begin
            hcount[11:0] <= 12'd0;
            adrs[11:0] <= 12'd0;
         end else begin
            if(w_hup) begin
               hcount[11:0] <= hcount[11:0] +12'd1;
            end
            if(w_hup) begin
               adrs[11:0] <= adrs[11:0] + 12'd1;
            end

         end
         // VSYNC Count
         if(buf_vsync & !buf_vsync_d) begin
            vcount[11:0] <= 12'd0;
            bank[1:0] <= 2'd0;
         end else begin
            if(w_vup) begin
               vcount[11:0] <= vcount[11:0] + 12'd1;
            end
            if(w_vup) begin
               if(bank[1:0] == 2'd2) begin
                  bank[1:0] <= 2'd0;
               end else begin
                  bank[1:0] <= bank[1:0] +2'd1;
               end
            end
         end

         if((hcount[11:0] == `RETIMING_H) && (vcount[11:0] == `RETIMING_V)) begin
            buf_restart_v <= 1'b1;
         end else begin
            buf_restart_v <= 1'b0;
         end
         if(hcount[11:0] == `RETIMING_H) begin
            buf_restart_h <= 1'b1;
         end else begin
            buf_restart_h <= 1'b0;
         end
      end
   end

   assign HC = hcount;
   assign VC = vcount;

//   assign ADRS[10:0] = adrs[11:1];
   assign ADRS[10:0] = adrs[10:0];
   assign RESTART_V = buf_restart_v;
   assign RESTART_H = buf_restart_h;

   assign DOUT[7:0] = buf_data[7:0];
//   assign BANK0_WE = ((bank[1:0] == 2'b00) && buf_ena && ~hcount[0])?1'b1:1'b0;
//   assign BANK1_WE = ((bank[1:0] == 2'b01) && buf_ena && ~hcount[0])?1'b1:1'b0;
//   assign BANK2_WE = ((bank[1:0] == 2'b10) && buf_ena && ~hcount[0])?1'b1:1'b0;
   assign BANK0_WE = ((bank[1:0] == 2'b00) && buf_ena)?1'b1:1'b0;
   assign BANK1_WE = ((bank[1:0] == 2'b01) && buf_ena)?1'b1:1'b0;
   assign BANK2_WE = ((bank[1:0] == 2'b10) && buf_ena)?1'b1:1'b0;
endmodule
