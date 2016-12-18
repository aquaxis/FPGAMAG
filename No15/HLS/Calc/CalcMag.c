#include <math.h>

float CalcMag(short x, short y)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return (float)sqrt((x * x) + (y * y));
}
