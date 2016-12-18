#include <math.h>

float CalcFAdd2(float a, float b)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
	float m = 0;
    //#pragma HLS RESOURCE variable=m core=FAddSub_nodsp
    //#pragma HLS RESOURCE variable=m core=FMul_nodsp
	m = b + a;
  return m;
}
