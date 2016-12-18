#include <math.h>

float CalcFDiv(float a, float b)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return (float)a / (float) b;
}
