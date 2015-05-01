#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <sys/time.h>
#include <stdlib.h>

#include "aq_axi_fifo_common.h"

#define WR_START 0x00
#define WR_ADRS  0x04
#define WR_LEN   0x08
#define RD_START 0x0C
#define RD_ADRS  0x10
#define RD_LEN   0x14
#define STATUS   0x18
#define TEST     0x1C
#define TESTRST  0x20
#define DEBUG    0x24
#define FSTATUS0 0x28
#define FSTATUS1 0x2C
#define FSTATUS2 0x30
#define FSTATUS3 0x34

double gettimeofday_sec()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec * 1e-6;
}

void main(int argc, char** argv){
  int fd_fifo,fd_mem;
  short *buf;
  unsigned short *buf_r;
	FILE *fp, *wfp;
  unsigned int BuffSize;
  int i, j;
  unsigned int ret;
  unsigned int phyaddr1, phyaddr2;
  signed short buf_rd;

  unsigned char fileout[256], filein[256];

  double st,et;

  // 引数の取り込み
    int m;

    strcpy(fileout, "sample1.wav");
    strcpy(filein, "sample0.wav");

  // ファイルのコピー
  printf("Wave Control\n");
	if((fp = fopen(filein, "rb")) == NULL){
		perror(0);
		return;
	}
	if((wfp = fopen(fileout, "wa+")) == NULL){
		perror(0);
		return;
	}

	unsigned int filesize, fmtsize, listsize, wavsize;
	unsigned char dummy[16];

	// RIFF header
	for(i=0;i<4;i++){
		fread(&dummy, 1, 1, fp);
		fwrite(dummy, 1,1, wfp);
		printf("%s", dummy);
	}
	printf("\n");

	// file size
	fread(&filesize, 1, 4, fp);
	fwrite(&filesize,1,4,wfp);
	printf("Filesize: %d\n",  filesize);

	// WAVE header
	for(i=0;i<4;i++){
		fread(&dummy, 1, 1, fp);
		fwrite(dummy, 1,1, wfp);
		printf("%s", dummy);
	}
	printf("\n");

	// fmt header
	for(i=0;i<4;i++){
		fread(&dummy, 1, 1, fp);
		fwrite(dummy, 1,1, wfp);
		printf("%s", dummy);
	}
	printf("\n");

	// fmt size
	fread(&fmtsize, 1, 4, fp);
	fwrite(&fmtsize,1,4,wfp);
	printf("fmtsize: %d\n",  fmtsize);

	for(i=0;i<fmtsize;i++){
		fread(&dummy,1,1,fp);
		fwrite(dummy, 1,1, wfp);
	}

	// LIST header
	for(i=0;i<4;i++){
		fread(&dummy, 1, 1, fp);
		fwrite(dummy, 1,1, wfp);
		printf("%s", dummy);
	}
	printf("\n");

	// list size
	fread(&listsize, 1, 4, fp);
	fwrite(&listsize,1,4,wfp);
	printf("listsize: %d\n",  listsize);

	for(i=0;i<listsize;i++){
		fread(&dummy,1,1,fp);
		fwrite(dummy, 1,1, wfp);
	}

	// data header
	for(i=0;i<4;i++){
		fread(&dummy, 1, 1, fp);
		fwrite(dummy, 1,1, wfp);
		printf("%s", dummy);
	}
	printf("\n");

	// data size
	fread(&wavsize, 1, 4, fp);
	fwrite(&wavsize,1,4,wfp);
	printf("wavsize: %d\n",  wavsize);

	buf = malloc(wavsize);
	buf_r = malloc(wavsize);

    fread(buf, 1, wavsize, fp);

    for(i=0;i<wavsize/2;i++){
		buf_r[i] = (unsigned short)(buf[i]+32768) ;
	}

	fwrite(buf_r, 1, wavsize, wfp);

	free(buf);
	free(buf_r);

	fclose(fp);
	fclose(wfp);
}
