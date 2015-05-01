#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <fcntl.h>

#define AUDIO_BASE		(0x42010000)
#define AUDIO_I2C_BASE	(0x42020000)
#define SIZE (0x10000)

unsigned int *i2c;

#define SLAVE_ADRS	(0x34)

void i2c_write(unsigned char adrs, unsigned char data){
	i2c[0]       = (data << 16) | (adrs << 9) | (SLAVE_ADRS);
	i2c[0x200/4] = 0xAA55AA55;
	i2c[0x400/4] = 0x0000003;

	while((i2c[0x404/4] & 0x40000000) == 0);
}

unsigned short i2c_read(unsigned char adrs){
	i2c[0]       = ((SLAVE_ADRS | 0x01) << 16) | (adrs << 9) | (SLAVE_ADRS);
	i2c[0x200/4] = 0xAA55AA55;
	i2c[0x400/4] = 0x80020003;

	while((i2c[0x404/4] & 0x40000000) == 0);

	return (unsigned short)(i2c[0x200/4] & 0xFFFF);
}

void main(){
	int fd;
	int i;
	unsigned int *buf;
	unsigned int old, now;

	fd = open("/dev/mem", O_RDWR);
	if(fd < 0){
		printf("can't open device\n");
		return;
	}

	// mmap
	buf = mmap(NULL, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, AUDIO_BASE);
	if(buf == MAP_FAILED){
		printf("can't mmap");
		return;
	}

	buf[0] = 0x1;	// 32 bit mode, Enable
//	buf[1] = 0x1;	// Half=0,Max=1
	buf[1] = 0x103;	// Half=3,Max=7

//	buf[0] = 0x101;	// 16 bit mode, Enable
//	buf[1] = 0x307;	// Half=3,Max=7
//	buf[1] = 0x103;	// Half=3,Max=7

	printf("ssm2603: [0] %08x\n", buf[0]);
	printf("ssm2603: [4] %08x\n", buf[1]);

	munmap(buf, SIZE);

	// mmap
	i2c = mmap(NULL, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, AUDIO_I2C_BASE);
	if(buf == MAP_FAILED){
		printf("can't mmap");
		return;
	}

	//
	printf("CMD: %08X\n", buf[0x400/4]);

	for(i=0;i<0x15;i++){
		printf("%02X: ", i);
		i2c_read(i);
		printf("%08X, %08X, %08X\n", i2c[0x000/4], i2c[0x200/4], i2c[0x404/4]);

	}
	printf("0x40040208: %08X\n", i2c[0x408/4]);

	i2c_write(0x06, 0x00);	// Power On
//	i2c_write(0x04, 0x08);	// enable Bypass
	i2c_write(0x04, 0x18);	// select DAC, enable Bypass
	i2c_write(0x05, 0x00);	// DAC no mute, no de-emphasis
//	i2c_write(0x07, 0x01);	// slave mode, 16bit, Left justfied
//	i2c_write(0x07, 0x00);	// slave mode, 16bit, Right justfied
	i2c_write(0x07, 0x0D);	// slave mode, 32bit, Left justfied
//	i2c_write(0x07, 0x0C);	// slave mode, 16bit, Left justfied
	i2c_write(0x09, 0x01);	// Active Digital Core

//	i2c_write(0x02, 0x51);	// Left -40dB
//	i2c_write(0x03, 0x51);	// Left -40dB
	i2c_write(0x00, 0x17);	// Input mute disable/ 0dB
	i2c_write(0x01, 0x17);	// Input mute disable/ 0dB
	i2c_write(0x02, 0x79);	// Left 0dB
	i2c_write(0x03, 0x79);	// Left 0dB

	munmap(i2c, SIZE);

	close(fd);
}
