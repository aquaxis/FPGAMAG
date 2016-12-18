/*
 * 認識結果の出力
 */
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>

#define BASE_ADDR 0x41000000
#define MAP_LENG  0x00100000

#define Cell_X 256
#define Cell_Y 144
#define LOOP_COUNT 20

void main(int argc, char **argv){
  int fd, i;
  unsigned int *addr;

  // メモリデバイスのオープン
  fd = open( "/dev/mem", O_RDWR );
  if( fd == -1 ){
    printf( "Can't open /dev/mem.\n" );
    return ;
  }

  addr = mmap( NULL, MAP_LENG,
               PROT_READ | PROT_WRITE,
			   MAP_SHARED, fd,
			   BASE_ADDR & 0xFFFF0000);
  if( addr == MAP_FAILED ){
    printf( "Error: mmap()\n" );
    return ;
  }

  unsigned short *HogBin;

  HogBin = (unsigned short *)calloc(Cell_Y * Cell_X * sizeof(unsigned short), 1);

  // FPGAからデータの取得
  for(int y = 0; y < Cell_Y; y++){
	for(int x = 0; x < Cell_X; x++){
	  HogBin[ y * 256 + x ] = (unsigned short)addr[ y * 256 + x ];
    }
  }

  // 弱認識器の読み込み
  int *ada_list_x;
  int *ada_list_y;
  int *ada_list_h;
  float *ada_list_w;

  ada_list_x = (int *)calloc(LOOP_COUNT * sizeof(int), 1);
  ada_list_y = (int *)calloc(LOOP_COUNT * sizeof(int), 1);
  ada_list_h = (int *)calloc(LOOP_COUNT * sizeof(int), 1);
  ada_list_w = (float *)calloc(LOOP_COUNT * sizeof(float), 1);

  FILE *rfp;
  if(NULL == (rfp=fopen("./weak_data.dat", "a+"))){
	printf("Can not open the outfile.\n");
	return;
  }

  int dummy;
  for(int num = 0; num < LOOP_COUNT; num++){
	fread(&dummy, sizeof(int), 1, rfp);
	fread(&ada_list_x[num], sizeof(int), 1, rfp);
	fread(&ada_list_y[num], sizeof(int), 1, rfp);
	fread(&ada_list_h[num], sizeof(int), 1, rfp);
	fread(&ada_list_w[num], sizeof(float), 1, rfp);
	fread(&dummy, sizeof(int), 1, rfp);
	fread(&dummy, sizeof(int), 1, rfp);
	fread(&dummy, sizeof(int), 1, rfp);
	printf("%d,%d,%f\n", ada_list_x[num],ada_list_y[num],ada_list_w[num]);
  }
  fclose(rfp);

  // 認識
  for(int y = 0; y < Cell_Y; y++){
	for(int x = 0; x < Cell_X; x++){
	  float weight = 0.0;
	  if(((Cell_Y - 25 - y) >= 0) && ((Cell_X - 12 - x) >= 0) ){
		for(int m = 0; m < LOOP_COUNT; m++){
		  if((HogBin[(y + ada_list_y[m]) * Cell_X + (x + ada_list_x[m])] & ada_list_h[m]) > 0){
			weight += ada_list_w[m];
			//printf("%d: %04x:%04x = %f\n", m, HogBin[(y + ada_list_y[m]) * Cell_X + (x + ada_list_x[m])] , ada_list_h[m], ada_list_w[m]);
		  }else{
			weight -= ada_list_w[m];
		  }
		}
		//printf("?: %d:%d = %f\n", x,y,weight);
	  }
	  if(weight > 1.3) {
		printf("?: %d:%d = %f\n", x,y,weight);
		//cv::rectangle(Image, cv::Point(x*CELL_SIZE,y*CELL_SIZE), cv::Point(x*CELL_SIZE+12*5, y*CELL_SIZE+25*5), cv::Scalar(0,0,200), 2, 2);
	  }
	}
  }

  munmap(addr, MAP_LENG);

  return ;
}
