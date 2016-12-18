#include <math.h>

float CalcFAdd9(float a, float b, float c, float d, float e, float f, float g, float h, float i)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return a + b + c + d + e + f + g + h + i;
}
