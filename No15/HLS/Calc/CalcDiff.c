#include <math.h>

short CalcDiff(unsigned char a, unsigned char b)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return (short)b - (short)a;
}
