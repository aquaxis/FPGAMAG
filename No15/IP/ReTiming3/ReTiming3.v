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
module ReTiming3
   (
    input        RST_N,
    input        CLK,

    input        VSYNC,
    input        HSYNC,

    input [11:0] WIDTH,
    input [11:0] HEIGHT,

    output       VALID,
    output [6:0] ADRS,

    output       RESTART_V,
    output       RESTART_H
   );

`define RETIMING_H 22
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
         buf_vsync_d <= 1'b0;
         buf_hsync_d <= 1'b0;
         buf_width[11:0] <= 12'd0;
         buf_height[11:0] <= 12'd0;
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
   reg [1:0]  bank;
   reg [2:0]  precount1, precount2;

   reg 		  buf_hup;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_valid <= 1'b0;
         hcount[11:0] <= 12'd0;
         vcount[11:0] <= 12'd0;
         buf_restart_v <= 1'b0;
         buf_restart_h <= 1'b0;
         precount1[2:0] <= 3'd0;
         precount2[2:0] <= 3'd0;
         adrs[11:0] <= 12'd0;
         bank[1:0] <= 2'd0;
		 buf_hup <= 1'b0;
      end else begin // if (!RST_N)
		 buf_hup <= w_hup;
         // HSYNC Count
         if(buf_hsync & !buf_hsync_d) begin
            hcount[11:0] <= 12'd0;
            adrs[11:0] <= 12'd0;
            precount1[2:0] <= 3'd0;
            precount2[2:0] <= 3'd0;
			bank[1:0] <= 2'd0;
         end else begin
            if(w_hup) begin
               hcount[11:0] <= hcount[11:0] +12'd1;
            end
            if(w_hup) begin
               if(precount1[2:0] == 3'd4) begin
                  precount1[2:0] <= 3'd0;
                  // precount2
                  if(precount2[2:0] == 3'd4) begin
                     precount2[2:0] <= 3'd0;
					 bank[1:0] <= bank[1:0] + 2'd1;
                  end else begin
                     precount2[2:0] <= precount2[2:0] + 3'd1;
                  end
               end else begin
                  precount1[2:0] <= precount1[2:0] + 3'd1;
               end
               if(adrs[11:0] == 20) begin
                  adrs[11:0] <= 0;
               end else begin
                  adrs[11:0] <= adrs[11:0] + 5;
               end
           end
         end
         // VSYNC Count
         if(buf_vsync & !buf_vsync_d) begin
            vcount[11:0] <= 12'd0;
         end else begin
            if(w_vup) begin
               vcount[11:0] <= vcount[11:0] + 12'd1;
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

   assign ADRS[4:0] = adrs[4:0]+precount2[2:0];
   assign ADRS[6:5] = bank[1:0];
   assign VALID = (href && (precount2[2:0] == 3'd0))?1'b1:1'b0;
   assign RESTART_V = buf_restart_v;
   assign RESTART_H = buf_restart_h;

endmodule
