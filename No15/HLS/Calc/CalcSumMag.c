#include <math.h>

float CalcSumMag(
				 float l00, float l01, float l02,
				 float l10, float l11, float l12,
				 float l20, float l21, float l22
)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  return
	((float)l00*l00 + (float)l01*l01 + (float)l02*l02 +
     (float)l10*l10 + (float)l11*l11 + (float)l12*l12 +
     (float)l20*l20 + (float)l21*l21 + (float)l22*l22);
}
