#include <math.h>

float CalcFMul(float a, float b)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return (float)b * (float)a;
}
