#include <common.h>
#include <exports.h>

int sample01 (int argc, char * const argv[])
{
  int i;
  u32 *buf;

  app_startup(argv);

  buf = (u32 *)0x40020000;

  buf[0] = 0xF;
  for(i=0;i<5;i++){
	mdelay(1000);
	buf[0] = 0x0;
	mdelay(1000);
	buf[0] = 0xF;
  }

  return (0);
}
