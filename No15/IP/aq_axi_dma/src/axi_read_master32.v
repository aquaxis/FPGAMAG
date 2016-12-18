module axi_read_master32(
  // Reset, Clock
  input           ARESETN,
  input           ACLK,

  // Master Read Address
  output [3:0]  M_AXI_ARID,
  output [31:0] M_AXI_ARADDR,
  output [7:0]  M_AXI_ARLEN,
  output [2:0]  M_AXI_ARSIZE,
  output [1:0]  M_AXI_ARBURST,
  output [1:0]  M_AXI_ARLOCK,
  output [3:0]  M_AXI_ARCACHE,
  output [2:0]  M_AXI_ARPROT,
  output [3:0]  M_AXI_ARQOS,
  output [0:0]  M_AXI_ARUSER,
  output        M_AXI_ARVALID,
  input         M_AXI_ARREADY,

  // Master Read Data
  input [3:0]   M_AXI_RID,
  input [31:0]  M_AXI_RDATA,
  input [1:0]   M_AXI_RRESP,
  input         M_AXI_RLAST,
  input [0:0]   M_AXI_RUSER,
  input         M_AXI_RVALID,
  output        M_AXI_RREADY,

  // Local Bus
  input         MASTER_RST,

  input         RD_START,
  input [31:0]  RD_ADRS,
  input [31:0]  RD_LEN,
  output        RD_READY,
  output        RD_FIFO_WE,
  input         RD_FIFO_FULL,
  input         RD_FIFO_AFULL,
  output [31:0] RD_FIFO_DATA
);

  localparam S_RD_IDLE  = 3'd0;
  localparam S_RA_WAIT  = 3'd1;
  localparam S_RA_START = 3'd2;
  localparam S_RD_WAIT  = 3'd3;
  localparam S_RD_PROC  = 3'd4;

  reg [2:0]   rd_state;
  reg [31:0]  reg_rd_adrs;
  reg [31:0]  reg_rd_len;
  reg         reg_arvalid, reg_r_last;
  reg [7:0]   reg_r_len;

  reg [15:0]  arready_count;
  always @(posedge ACLK or negedge ARESETN) begin
    if(!ARESETN) begin
		arready_count <= 16'd0;
	end else begin
		if(M_AXI_ARREADY) begin
			arready_count <= arready_count + 16'd1;
		end
	end
  end

  // Read State
  always @(posedge ACLK or negedge ARESETN) begin
    if(!ARESETN) begin
      rd_state          <= S_RD_IDLE;
      reg_rd_adrs[31:0] <= 32'd0;
      reg_rd_len[31:0]  <= 32'd0;
      reg_arvalid       <= 1'b0;
      reg_r_len[7:0]    <= 8'd0;
      reg_r_last		<= 1'b0;
    end else begin
      case(rd_state)
        S_RD_IDLE: begin
          if(RD_START) begin
            rd_state          <= S_RA_WAIT;
            reg_rd_adrs[31:0] <= RD_ADRS[31:0];
            reg_rd_len[31:0]  <= RD_LEN[31:0] -32'd1;
          end
          reg_arvalid     <= 1'b0;
          reg_r_len[7:0]  <= 8'd0;
        end
        S_RA_WAIT: begin
          if(~RD_FIFO_AFULL) begin
            rd_state          <= S_RA_START;
          end
        end
        S_RA_START: begin
          rd_state          <= S_RD_WAIT;
          reg_arvalid       <= 1'b1;
          reg_rd_len[31:9] <= reg_rd_len[31:9] -23'd1;
          if(reg_rd_len[31:9] != 23'd0) begin
            reg_r_last      <= 1'b0;
            reg_r_len[7:0]  <= 8'h7F;
          end else begin
            reg_r_last      <= 1'b1;
            reg_r_len[7:0]  <= {1'b0, reg_rd_len[8:2]};
          end
        end
        S_RD_WAIT: begin
          if(M_AXI_ARREADY) begin
            rd_state        <= S_RD_PROC;
            reg_arvalid     <= 1'b0;
          end
        end
        S_RD_PROC: begin
          if(M_AXI_RVALID) begin
            if(M_AXI_RLAST) begin
              if(reg_r_last) begin
                rd_state          <= S_RD_IDLE;
              end else begin
                rd_state          <= S_RA_WAIT;
                reg_rd_adrs[31:0] <= reg_rd_adrs[31:0] + 32'd512;
              end
            end else begin
              reg_r_len[7:0] <= reg_r_len[7:0] -8'd1;
            end
          end
        end
      endcase
    end
  end

  // Master Read Address
  assign M_AXI_ARID[3:0]    = 4'b0000;
  assign M_AXI_ARADDR[31:0] = reg_rd_adrs[31:0];
  assign M_AXI_ARLEN[7:0]   = reg_r_len[7:0];
  assign M_AXI_ARSIZE[2:0]  = 3'b010;
  assign M_AXI_ARBURST[1:0] = 2'b01;
  assign M_AXI_ARLOCK[1:0]  = 2'b00;
  assign M_AXI_ARCACHE[3:0] = 4'b0011;
  assign M_AXI_ARPROT[2:0]  = 3'b000;
  assign M_AXI_ARQOS[3:0]   = 4'b0000;
  assign M_AXI_ARUSER[0]    = 1'b1;
  assign M_AXI_ARVALID      = reg_arvalid;

  assign M_AXI_RREADY       = M_AXI_RVALID & ~RD_FIFO_FULL;

  assign RD_READY           = (rd_state == S_RD_IDLE)?1'b1:1'b0;
  assign RD_FIFO_WE         = M_AXI_RVALID;
  assign RD_FIFO_DATA[31:0] = M_AXI_RDATA[31:0];
endmodule

