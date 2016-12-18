#include <math.h>

unsigned char CalcComp(float data, float comp)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  if(data >= comp){
	return (unsigned char)1;
  }else{
	return (unsigned char)0;
  }
}
