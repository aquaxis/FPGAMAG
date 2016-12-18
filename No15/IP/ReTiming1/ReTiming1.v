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
module ReTiming1
   (
    input 		  RST_N,
    input 		  CLK,

    input 		  VSYNC,
    input 		  HSYNC,

    input [11:0]  WIDTH,
    input [11:0]  HEIGHT,

    output [10:0] ADRS,
	output [1:0]  SEL,

    output 		  RESTART_V_G,
    output 		  RESTART_H_G,

    output 		  RESTART_V_M,
    output 		  RESTART_H_M
   );

`define RETIMING_H 1
`define RETIMING_V 0

   reg            buf_hsync, buf_vsync;
   reg            buf_hsync_d, buf_vsync_d;

   reg [11:0]     hcount, vcount;
   reg [11:0]     buf_width, buf_height;
   reg            buf_valid;

   reg            buf_restart_v, buf_restart_h;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_vsync <= 1'b0;
         buf_hsync <= 1'b0;
		 buf_width[11:0] <= 12'd0;
		 buf_height[11:0] <= 12'd0;
         buf_vsync_d <= 1'b0;
         buf_hsync_d <= 1'b0;
      end else begin
         buf_vsync <= VSYNC;
         buf_hsync <= HSYNC;
         buf_width[11:0] <= WIDTH[11:0];
         buf_height[11:0] <= HEIGHT[11:0];
         buf_vsync_d <= buf_vsync;
         buf_hsync_d <= buf_hsync;
      end
   end

   wire w_hlast, w_vlast,href;

   assign w_hlast = (hcount[11:0] == (buf_width[11:0] -12'd1));
   assign w_vlast = (vcount[11:0] == (buf_height[11:0] -12'd1));
   assign href = (hcount[11:0] < buf_width[11:0]) && (vcount[11:0] < buf_height[11:0]);

   wire w_hup, w_vup;

   assign w_hup = (hcount[11:0] < buf_width[11:0]);
   assign w_vup = href && w_hlast && (vcount[1:0] < buf_height[11:0]);

   reg [11:0] adrs;
   reg [2:0]  r_sel;

   reg [37:0] buf_restart_h_d, buf_restart_v_d;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_valid <= 1'b0;
         hcount[11:0] <= 12'd0;
         vcount[11:0] <= 12'd0;
         buf_restart_v <= 1'b0;
         buf_restart_h <= 1'b0;
         adrs[11:0] <= 12'd0;
		 buf_restart_h_d[37:0] <= 38'd0;
		 buf_restart_v_d[37:0] <= 38'd0;
		 r_sel[1:0] <= 2'd0;
      end else begin
         // HSYNC Count
         if(buf_hsync & !buf_hsync_d) begin
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
			r_sel[2:0] <= 3'd0;
         end else begin
            if(w_vup) begin
               vcount[11:0] <= vcount[11:0] + 12'd1;
			   if(r_sel[1:0] == 2'd2) begin
				  r_sel[1:0] <= 2'd0;
			   end else begin
				  r_sel[1:0] <= r_sel[1:0] + 2'd1;
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

		 buf_restart_h_d[37:0] <= {buf_restart_h_d[36:0], buf_restart_h};
		 buf_restart_v_d[37:0] <= {buf_restart_v_d[36:0], buf_restart_v};

      end
   end

   assign ADRS[10:0] = adrs[10:0];
   assign SEL[1:0] = r_sel[1:0];
   assign RESTART_V_G = buf_restart_v;
   assign RESTART_H_G = buf_restart_h;
   assign RESTART_V_M = buf_restart_v_d[37];
   assign RESTART_H_M = buf_restart_h_d[37];

endmodule