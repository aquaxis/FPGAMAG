#ifndef _AA_FIFO_COMMON_H_
#define _AA_FIFO_COMMON_H_

#define FALSE   0
#define TRUE    1

typedef unsigned char    BOOL;

typedef struct _AA_FIFO_INFO
{
  unsigned long    driver_version;
  unsigned long    board_version;
} AA_FIFO_INFO, *pAA_FIFO_INFO;

typedef struct _AA_FIFO_START
{
  unsigned char *buf;   // JPEG Data
  unsigned int  size;   // Size of JPEG Data
} AA_FIFO_START, *pAA_FIFO_START;

typedef struct _AA_FIFO_STATUS
{
  unsigned char   busy;     // Status
  unsigned char   tmp1;     // Status
  unsigned char   tmp2;     // Status
  unsigned char   tmp3;     // Status
  unsigned short  width;    // Width
  unsigned short  height;   // Height
} AA_FIFO_STATUS, *pAA_FIFO_STATUS;

/*******************************************************************************
    DJPEG COMMAND
*******************************************************************************/
#define AA_FIFO_CMD_MAGIC   0xF0
#define AA_FIFO_CMD_NR_MAX  7
#define AA_FIFO_DMABUF_ALLOC        _IOW(AA_FIFO_CMD_MAGIC, 0, unsigned int)
#define AA_FIFO_DMABUF_FREE         _IOW(AA_FIFO_CMD_MAGIC, 1, unsigned int)
#define AA_FIFO_DMA_TXSTART         _IOW(AA_FIFO_CMD_MAGIC, 2, unsigned int)
#define AA_FIFO_DMA_RXSTART         _IOW(AA_FIFO_CMD_MAGIC, 3, unsigned int)
#define AA_FIFO_DMA_TXSTATUS        _IOR(AA_FIFO_CMD_MAGIC, 4, unsigned int)
#define AA_FIFO_DMA_RXSTATUS        _IOR(AA_FIFO_CMD_MAGIC, 5, unsigned int)
#define AA_FIFO_DMA_RESET           _IOR(AA_FIFO_CMD_MAGIC, 6, unsigned int)
#endif
