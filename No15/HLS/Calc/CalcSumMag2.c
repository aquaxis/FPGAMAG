#include <math.h>

float CalcSumMag2(
                  float x0, float x1, float x2,
                  float x3, float x4, float x5,
                  float x6, float x7, float x8
)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return
	sqrt((float)x0 + (float)x1 + (float)x2 +
         (float)x3 + (float)x4 + (float)x5 +
         (float)x6 + (float)x7 + (float)x8);
}
