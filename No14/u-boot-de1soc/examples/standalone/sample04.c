#include <common.h>
#include <exports.h>

int sample04 (int argc, char * const argv[])
{
  int i;
  unsigned long s, e;
  unsigned char  *buf;

  e = 0;
  s = 0;
  app_startup(argv);
  buf = (u32 *)0x10000000;
  s = timer_get_us();
  for(i=0;i<100000;i++){
	buf[i] = i;
  }
  e = timer_get_us();
  printf(" time = %d\n", e - s );

  return (0);
}
