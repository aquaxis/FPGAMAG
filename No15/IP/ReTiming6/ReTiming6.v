module ReTiming6
   (
    input 		  RST_N,
    input 		  CLK,

    input 		  VSYNC,
    input 		  HSYNC,

    output 		  VALID,
    output [15:0] ADRS
   );

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
      end else begin
         buf_vsync <= VSYNC;
         buf_hsync <= HSYNC;
         buf_vsync_d <= buf_vsync;
         buf_hsync_d <= buf_hsync;
      end
   end

   reg [3:0]  precount1;
   reg 		  hcount_e;

   always @(posedge CLK or negedge RST_N) begin
      if(!RST_N) begin
         hcount[11:0] <= 12'd0;
         vcount[11:0] <= 12'd0;
         buf_restart_v <= 1'b0;
         buf_restart_h <= 1'b0;
         precount1[3:0] <= 4'd0;
		 hcount_e <= 1'b0;
      end else begin
         // HSYNC Count
         if(buf_hsync & !buf_hsync_d) begin
            hcount[11:0] <= 12'd0;
			hcount_e <= 1'b1;
            precount1[3:0] <= 4'd0;
		 end else begin
			if(hcount_e) begin
			   if(precount1[3:0] == 4'd8) begin
				  precount1[3:0] <= 4'd0;
				  if(hcount[7:0] == 8'd255) begin
					 hcount[7:0] <= 8'd0;
					 hcount_e <= 1'b0;
				  end else begin
					 hcount[7:0] <= hcount[11:0] +12'd1;
				  end
			   end else begin
				  precount1[3:0] <= precount1[3:0] + 4'd1;
			   end
			end
         end
         // VSYNC Count
         if(buf_vsync & !buf_vsync_d) begin
            vcount[7:0] <= 8'd0;
         end else begin
            if(hcount_e && (precount1[3:0] == 4'd8) && (hcount[7:0] == 8'd255)) begin
               vcount[7:0] <= vcount[7:0] + 8'd1;
            end
         end

      end
   end

   assign ADRS[15:0] = {vcount[7:0], hcount[7:0]};
   assign VALID = (precount1[3:0] == 4'd8)?1'b1:1'b0;

endmodule
