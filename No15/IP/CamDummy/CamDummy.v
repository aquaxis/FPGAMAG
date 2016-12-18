module CamDummy
  (
   input         RST_N,
   input         CLK,

   input         LOCAL_CS,
   input         LOCAL_RNW,
   output        LOCAL_ACK,
   input [31:0]  LOCAL_ADDR,
   input [3:0]   LOCAL_BE,
   input [31:0]  LOCAL_WDATA,
   output [31:0] LOCAL_RDATA,

   output        CAM_CLK,
   output        CAM_ENA,
   output        CAM_VSYNC,
   output        CAM_HSYNC,
   output [7:0]  CAM_DATA,

   output        A_CLK,
   output [9:0]  A_ADDR,
   output        A_WE,
   input [31:0]  A_DI,
   output [31:0] A_DO,

   output        B_CLK,
   output [11:0] B_ADDR,
   input [7:0]   B_DI
   );

   localparam A_CTL     = 8'h00;
   localparam A_WIDTH   = 8'h04;
   localparam A_HEIGHT  = 8'h08;

   wire wr_ena, rd_ena, wr_ack;
   reg rd_ack;
   reg [31:0] reg_rdata;

   assign wr_ena = (LOCAL_CS & ~LOCAL_RNW)?1'b1:1'b0;
   assign rd_ena = (LOCAL_CS &  LOCAL_RNW)?1'b1:1'b0;
   assign wr_ack = wr_ena;

   reg 		  req_start, reg_finish;
   reg [11:0] reg_width, reg_height;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 req_start <= 1'b0;
		 reg_width[11:0] <= 12'd0;
		 reg_height[11:0] <= 12'd0;
	  end else begin
		 if(wr_ena) begin
		    if(LOCAL_ADDR[15:12] == 4'd0) begin
			   case(LOCAL_ADDR[7:0] & 8'hFC)
			     A_CTL:
				   begin
				   end
			     A_WIDTH:
				   begin
				      reg_width[11:0] <= LOCAL_WDATA[11:0];
				   end
			     A_HEIGHT:
				   begin
				      reg_height[11:0] <= LOCAL_WDATA[11:0];
				   end
			     default:
				   begin
				   end
			   endcase
		    end
         end

		 if(cam_state != S_IDLE) begin
			req_start <= 1'b0;
		 end if(LOCAL_ADDR[15:12] == 4'd0 &
                ((LOCAL_ADDR[7:0] & 8'hFC) == A_CTL) & wr_ena) begin
			req_start <= 1'b1;
		 end
	  end
   end

   reg rd_ack_d;
   wire [9:0] wire_sp;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 rd_ack <= 1'b0;
		 rd_ack_d <= 1'b0;
		 reg_rdata[31:0] <= 32'd0;
	  end else begin
		 if(LOCAL_ADDR[15:12] == 4'd0) begin
			rd_ack <= rd_ena;
			case(LOCAL_ADDR[7:0] & 8'hFC)
			  A_CTL: reg_rdata[31:0]    <= {reg_finish, 30'd0, req_start};
			  A_WIDTH: reg_rdata[31:0]  <= {20'd0, reg_width[11:0]};
			  A_HEIGHT: reg_rdata[31:0] <= {20'd0, reg_height[11:0]};
			  default: reg_rdata[31:0]  <= 32'd0;
			endcase
		 end else if(LOCAL_ADDR[15:12] == 4'd1) begin
			rd_ack_d <= rd_ena;
			rd_ack <= rd_ack_d;
			reg_rdata[31:0] <= A_DI[31:0];
		 end else begin
			rd_ack <= rd_ena;
			reg_rdata[31:0] <= 32'd0;
		 end
	  end
   end

   assign LOCAL_ACK = (wr_ack | rd_ack);
   assign LOCAL_RDATA[31:0] = reg_rdata[31:0];

   assign A_CLK       = CLK;
   assign A_WE        = (LOCAL_ADDR[15:12] == 4'd1 && LOCAL_CS)?~LOCAL_RNW:1'b0;
   assign A_ADDR[9:0] = LOCAL_ADDR[11:2];
   assign A_DO[31:0]  = LOCAL_WDATA[31:0];

   //
   reg [1:0] cam_state;
   reg [11:0] cam_cnt;
   reg       cam_ena, cam_vsync, cam_hsync;

   localparam S_IDLE = 2'd0;
   localparam S_WAIT = 2'd1;
   localparam S_RUN  = 2'd2;
   localparam S_FIN  = 2'd3;

   always @(posedge CLK or negedge RST_N) begin
	  if(!RST_N) begin
		 cam_state     <= S_IDLE;
	     cam_cnt[11:0] <= 12'd0;
		 cam_ena       <= 1'b0;
         reg_finish    <= 1'b1;
	  end else begin
		 case(cam_state)
		   S_IDLE:
			 begin
				if(req_start) begin
				   cam_state  <= S_RUN;
                   reg_finish <= 1'b0;
				end
				cam_cnt[11:0] <= 12'd0;
			 end
		   S_RUN:
			 begin
				//if(cam_cnt[11:0] == reg_width[11:0]) begin
				if(cam_cnt[11:0] == (12'd3000-12'd1)) begin
				   cam_state  <= S_FIN;
				end
				cam_cnt[11:0] <= cam_cnt[11:0] + 12'd1;
			 end
		   S_FIN:
			 begin
				cam_state  <= S_IDLE;
                reg_finish <= 1'b1;
			 end
		   default:
			 begin
				cam_state <= S_IDLE;
			 end
		 endcase
         cam_ena   <= ((cam_state == S_RUN) && (cam_cnt[11:0] <= reg_width[11:0]))?1'b1:1'b0;
         cam_vsync <= ((cam_state == S_RUN) && (reg_height[11:0] == 12'd0))?1'b1:1'b0;
         cam_hsync <= ((cam_state == S_RUN) && (cam_cnt[11:0]    == 12'd0))?1'b1:1'b0;
	  end
   end

   assign B_CLK        = CLK;
   assign B_ADDR[11:0] = cam_cnt[11:0];

   assign CAM_CLK       = CLK;
   assign CAM_ENA       = cam_ena;
   assign CAM_VSYNC     = cam_vsync;
   assign CAM_HSYNC     = cam_hsync;
   assign CAM_DATA[7:0] = (cam_ena)?B_DI[7:0]:32'd0;

endmodule
