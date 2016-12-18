#include <math.h>

unsigned char CalcComp(float data)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  if(data >= 0.15f){
	return (unsigned char)1;
  }else{
	return (unsigned char)0;
  }
}
