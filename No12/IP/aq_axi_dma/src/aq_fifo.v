/*
 * Copyright (C)2014-2015 AQUAXIS TECHNOLOGY.
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
module aq_fifo(
  input         RST,

  input         WRCLK,
  input         WREN,
  input [63:0]  DI,
  output        FULL,
  output        AFULL,
  output [12:0] WRCOUNT,

  input         RDCLK,
  input         RDEN, 
  output [63:0] DO,
  output        EMPTY,
  output        AEMPTY,
  output [12:0] RDCOUNT
);
/*
FIFO36E1 
  #(
    .ALMOST_EMPTY_OFFSET      ( 13'd128      ),
    .ALMOST_FULL_OFFSET       ( 13'd258      ),
    .DATA_WIDTH               ( 72           ),
    .DO_REG                   ( 1            ),
    .EN_ECC_READ              ( "FALSE"      ),
    .EN_ECC_WRITE             ( "FALSE"      ),
    .EN_SYN                   ( "FALSE"      ),
    .FIFO_MODE                ( "FIFO36_72"  ),
    .FIRST_WORD_FALL_THROUGH  ( "TRUE"       ),
    .INIT                     ( 72'h0        ),
    .SIM_DEVICE               ( "7SERIES"    ),
    .SRVAL                    ( 72'h0        )
  )
  u_FIFO(
    .RST           ( RST      ),

    .WRCLK         ( WRCLK    ),
    .WREN          ( WREN     ),
    .DI            ( DI       ),
    .DIP           ( 8'h00    ),
    .WRCOUNT       ( WRCOUNT  ),
    .WRERR         (),
    .FULL          ( FULL     ),
    .ALMOSTFULL    ( AFULL    ),
      
    .RDCLK         ( RDCLK    ),
    .RDEN          ( RDEN     ),
    .DO            ( DO       ),
    .DOP           (),
    .RDCOUNT       ( RDCOUNT  ),
    .RDERR         (),
    .EMPTY         ( EMPTY    ),
    .ALMOSTEMPTY   ( AEMPTY   ),
      
    .REGCE         ( 1'b1     ),
    .RSTREG        ( RST      ),
      
    .ECCPARITY     (),
      
    .DBITERR       (),
    .SBITERR       (),
      
    .INJECTDBITERR ( 1'b0     ),
    .INJECTSBITERR ( 1'b0     )
  );
*/
aq_fifo_org
#(
	.FIFO_DEPTH(13),
	.FIFO_WIDTH(64)
)
(
	.RST_N(~RST),

	.FIFO_WR_CLK(WRCLK),
	.FIFO_WR_ENA(WREN),
	.FIFO_WR_DATA(DI),
	.FIFO_WR_LAST(1'b1),
	.FIFO_WR_FULL(FULL),
	.FIFO_WR_ALM_FULL(AFULL),
	.FIFO_WR_ALM_COUNT(13'd128),

	.FIFO_RD_CLK(RDCLK),
	.FIFO_RD_ENA(RDEN),
	.FIFO_RD_DATA(DO),
	.FIFO_RD_EMPTY(EMPTY),
	.FIFO_RD_ALM_EMPTY(AEMPTY),
	.FIFO_RD_ALM_COUNT(13'd258)
);

endmodule

