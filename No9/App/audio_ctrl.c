#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <sys/time.h>

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
  unsigned int *buf;
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
  {
    int m;

    strcpy(fileout, "sample2.wav");
    strcpy(filein, "sample1.wav");
  }

  // ファイルのオープン
  fd_fifo = open("/dev/aa_fifo", O_RDWR);
  if(fd_fifo < 0){
    printf("/dev/aa_fifo can't open device\n");
    return;
  }

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

	if(wavsize > 0x800000) wavsize = 0x800000;
	printf("wavsize: %d\n",  wavsize);


  int blsize = (int)((wavsize+0x1FFFFFF)/0x2000000);  // 転送するブロックサイズを算出
  int size = wavsize;

  // CMAバッファの取得
  phyaddr1 = ioctl(fd_fifo, AA_FIFO_DMABUF_ALLOC, wavsize);
  printf("IOCTL: DMABUF_ALLOC(1) = %08X\n", phyaddr1);
  // CMA領域にファイルを転送する
  fd_mem = open("/dev/mem", O_RDWR);
  if(fd_mem < 0){
    printf("can't open device\n");
    return;
  }
  for(i=0;i<blsize;i++){
    buf = mmap(NULL, 0x2000000, PROT_READ | PROT_WRITE, MAP_SHARED, fd_mem, phyaddr1+(0x2000000*i));
    // バッファに読み込む
    if(size >= 0x2000000){
      fread(buf, 1, 0x2000000, fp);
    }else{
      fread(buf, 1, size, fp);
    }
    size-=0x2000000;
    munmap(buf, 0x2000000);
  }
  close(fd_mem);
	fclose(fp);
  printf("Load Audio - Finish\n");

  st = gettimeofday_sec();
#if 1
{
  ret = ioctl(fd_fifo, AA_FIFO_DMA_TXSTATUS, phyaddr1);
  printf("TX Status: %08x\n",ret);

  // FIFO Reset
  ioctl(fd_fifo, AA_FIFO_DMA_RESET, 0);

  ret = ioctl(fd_fifo, AA_FIFO_DMA_TXSTATUS, phyaddr1);
  printf("TX Status: %08x\n",ret);

  // TX DMA Start
  printf("TX DMA Start(%08x)\n",phyaddr1);
  ioctl(fd_fifo, AA_FIFO_DMA_TXSTART, phyaddr1);

  while(1){
    ret = ioctl(fd_fifo, AA_FIFO_DMA_TXSTATUS, phyaddr1);
	printf("TX Status: %08x\n",ret);
    if(ret & 0x00000100) break;
  }

  ret = ioctl(fd_fifo, AA_FIFO_DMA_TXSTATUS, phyaddr1);
  printf("TX Status: %08x\n",ret);
}
#else
{
  ret = ioctl(fd_fifo, AA_FIFO_DMA_RXSTATUS, phyaddr1);
  printf("RX Status: %08x\n",ret);

  // FIFO Reset
  ioctl(fd_fifo, AA_FIFO_DMA_RESET, 0);

  ret = ioctl(fd_fifo, AA_FIFO_DMA_RXSTATUS, phyaddr1);
  printf("RX Status: %08x\n",ret);

  // RX DMA Start
  printf("RX DMA Start(%08x)\n",phyaddr1);
  ioctl(fd_fifo, AA_FIFO_DMA_RXSTART, phyaddr1);

  while(1){
    ret = ioctl(fd_fifo, AA_FIFO_DMA_RXSTATUS, phyaddr1);
	printf("RX Status: %08x\n",ret);
    if(ret & 0x00000100) break;
  }

  ret = ioctl(fd_fifo, AA_FIFO_DMA_RXSTATUS, phyaddr1);
  printf("RX Status: %08x\n",ret);

  // CMA領域からファイルを転送する
  fd_mem = open("/dev/mem", O_RDWR);
  if(fd_mem < 0){
    printf("can't open device\n");
    return;
  }
  int size = wavsize;
  for(i=0;i<blsize;i++){
    buf = mmap(NULL, 0x2000000, PROT_READ | PROT_WRITE, MAP_SHARED, fd_mem, phyaddr1+(0x2000000*i));
    // バッファに読み込む
    if(size >= 0x2000000){
      fwrite(buf, 1, 0x2000000, wfp);
    }else{
      fwrite(buf, 1, size, wfp);
    }
    size-=0x2000000;
    munmap(buf, 0x2000000);
  }
  close(fd_mem);

}
#endif
  et = gettimeofday_sec();
	fclose(wfp);

  printf("%10.10f(sec)\n", et - st);

  ret = ioctl(fd_fifo, AA_FIFO_DMABUF_FREE, phyaddr1);

  printf("Finish\n");

  close(fd_fifo);
}
