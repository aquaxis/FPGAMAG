/*
 * atan2テーブルの登録
 */
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/mman.h>

#define BASE_ADDR 0x40000000
#define MAP_LENG  0x00100000

#define IMG_OFFSET (0x1000/4)

void main(int argc, char **argv){
  int fd, i;
  unsigned int *addr;

  if((argv[1] == NULL) || (argv[2] == NULL) || (argv[3] == NULL)){
    printf("Usage: run_hog ImageFielName Width Height\n");
    return;
  }

  int width  = atoi(argv[2]);
  int height = atoi(argv[3]);

  printf("size: %d x %d\n", width, height);

  // メモリデバイスのオープン
  fd = open( "/dev/mem", O_RDWR );
  if( fd == -1 ){
    printf( "Can't open /dev/mem.\n" );
    return;
  }

  addr = mmap( NULL, MAP_LENG,
               PROT_READ | PROT_WRITE,
			   MAP_SHARED, fd,
			   BASE_ADDR & 0xFFFF0000);
  if( addr == MAP_FAILED ){
    printf( "Error: mmap()\n" );
    return ;
  }

  FILE *fp = fopen(argv[1], "r");

  unsigned long *img;

  img = (unsigned long *)calloc(((width+3)/4) * sizeof(unsigned char), 1);

  printf("Start\n");

  for(int y = 0; y < height; y++){
    if(feof(fp)){
      printf("data not found\n");
      break;
    }
    while(addr[0] != 0x80000000);
    int size = fread(img, width, 1, fp);
    printf("read: %d[Byte]\n", size);
    for(int x = 0; x < width/4; x++){
      addr[IMG_OFFSET + x] = img[x];
    }
    addr[1] = width-1; // Width-1
    addr[2] = y;       // Line番号
    addr[0] = 0x0;     // スタート
  }

  while(addr[0] != 0x80000000);

  printf("Finish\n");

  munmap(addr, MAP_LENG);
  fclose(fp);

  return;
}
