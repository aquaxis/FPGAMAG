#include <math.h>

float CalcCell0(unsigned char sel_id, unsigned char calc_rst, unsigned char grad_sel, float grad)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS PIPELINE
  float buf_grad;

  if(sel_id == grad_sel){
    if(calc_rst == 1){
      buf_grad = grad;
    }else{
      buf_grad = buf_grad + grad;
    }
  }else{
    if(calc_rst == 1){
      buf_grad = 0.0;
    }
  }
  return buf_grad;
}
