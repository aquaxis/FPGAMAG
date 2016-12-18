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
module ReTiming5
   (
    input        RST_N,
    input        CLK,

    input        VSYNC,
    input        HSYNC,

    input [11:0] WIDTH,
    input [11:0] HEIGHT,

    output [9:0] ADRS,
	output [3:0] SEL,

    output       RESTART_V,
    output       RESTART_H
   );

`define RETIMING_H 130
`define RETIMING_V 0

   reg           buf_hsync, buf_vsync;
   reg           buf_hsync_d, buf_vsync_d;

   reg [11:0]    hcount, vcount;
   reg [11:0]    buf_width, buf_height;
   reg           buf_valid;

   reg           buf_restart_v, buf_restart_h;

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
   reg [2:0]  precount1;
   reg [7:0]  precount2;
   reg [4:0]  precount3;
   reg [3:0]  precount4;
   reg [3:0]  precount4d;
   reg [1:0]  vcount1;

   reg        precount_e;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         buf_valid <= 1'b0;
         hcount[11:0] <= 12'd0;
         vcount[11:0] <= 12'd0;
         buf_restart_v <= 1'b0;
         buf_restart_h <= 1'b0;
         precount1[2:0] <= 3'd0;
         precount2[7:0] <= 8'd0;
         precount3[4:0] <= 5'd0;
         precount4[3:0] <= 4'd0;
         precount4d[3:0] <= 4'd0;
         precount_e <= 1'b0;
         adrs[11:0] <= 12'd0;
		 vcount1[1:0] <= 2'd0;
      end else begin
         // HSYNC Count
         if(buf_hsync & !buf_hsync_d) begin
            hcount[11:0]   <= 12'd0;
            adrs[11:0]     <= 12'd0;
            precount1[2:0] <= 3'd0;
            precount2[7:0] <= 5'd0;
			precount3[4:0] <= 5'd0;
			precount4[3:0] <= 4'd0;
            precount_e     <= 1'b1;
         end else begin
            if(w_hup) begin
               hcount[11:0] <= hcount[11:0] +12'd1;
            end

			if(precount1[2:0] == 3'd2 && precount3[2:0] == 3'd2 && precount2[7:0] == 8'd255) begin
			   precount_e <= 1'b0;
			end

            if(precount_e) begin
               if(precount1[2:0] == 3'd2) begin
                  precount1[2:0] <= 3'd0;
               end else begin
                  precount1[2:0] <= precount1[2:0] + 3'd1;
               end

			   if((precount1[2:0] == 3'd2) && (precount3[2:0] == 3'd2)) begin
				  precount2[7:0] <= precount2[7:0] + 8'd1;
			   end

               if(precount1[2:0] == 3'd2) begin
				  if(precount3[2:0] == 3'd2) begin
					 precount3[2:0] <= 3'd0;
				  end else begin
					 precount3[2:0] <= precount3[2:0] + 3'd1;
				  end
			   end

			   if((precount1[2:0] == 3'd2) && (precount3[2:0] == 3'd2)) begin
				  precount4[3:0] <= 4'd0;
			   end else begin
				  precount4[3:0] <= precount4[3:0] + 8'd1;
			   end

           end
         end // else: !if(buf_hsync & !buf_hsync_d)
         precount4d[3:0] <= precount4[3:0];

         // VSYNC Count
         if(buf_vsync & !buf_vsync_d) begin
            vcount[11:0] <= 12'd0;
         end else begin
            if(w_vup) begin
               vcount[11:0] <= vcount[11:0] + 12'd1;
            end
         end

		 if(buf_vsync & !buf_vsync_d) begin
            vcount1[1:0] <= 2'd0;
         end else begin
            if(precount_e && precount1[2:0] == 3'd2 && precount3[2:0] == 3'd2 && precount2[7:0] == 8'd255) begin
               vcount1[1:0] <= vcount1[1:0] + 2'd1;
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

   assign ADRS[7:0] = precount1[2:0] + precount2[7:0];
   assign ADRS[9:8] = precount3[1:0] + vcount1[1:0];

   assign SEL[3:0] = precount4d[3:0];
   assign RESTART_V = buf_restart_v;
   assign RESTART_H = buf_restart_h;

endmodule
