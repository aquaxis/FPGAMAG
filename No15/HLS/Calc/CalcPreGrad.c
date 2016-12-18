#include <math.h>

unsigned char CalcPreGrad(short x)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  if(x >= 0){
    return (unsigned char)x;
  }else{
	  return (unsigned char)x*(-1);
  }
}
