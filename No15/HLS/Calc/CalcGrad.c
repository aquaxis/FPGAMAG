#include <math.h>

unsigned char CalcGrad(short x, short y, unsigned char atan2_table[65536])
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE bram port=atan2_table
#pragma HLS PIPELINE
	unsigned char c = ((x < 0) ^ (y < 0))?1:0;

	unsigned char j = (unsigned char)((x < 0)?(x * (-1)):x);
	unsigned char k = (unsigned char)((y < 0)?(y * (-1)):y);

  unsigned char m = atan2_table[(k << 8) | j];

  unsigned char z = (c)?(8-m):(m);

  return (unsigned char)(z);
}
