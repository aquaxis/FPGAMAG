#include <math.h>

float CalcCell1(unsigned char calc_rst, float grad_a, float grad_b)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  float buf_grad;

  if(calc_rst == 1){
    buf_grad = grad_a;
  }else{
    buf_grad = grad_a + grad_b;
  }

  return buf_grad;
}
