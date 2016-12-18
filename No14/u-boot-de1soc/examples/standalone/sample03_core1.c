#include <common.h>
#include <exports.h>

int sample03_core1 (int argc, char * const argv[])
{
  int i, j;
  u32 *buf, *core2;

  app_startup(argv);

  printf("CPU0 Start\n");

  buf = (u32 *)0x10000000; // CPU1と通信用領域
  core2 = 0xFFFFFFF0; // CPU1の実行開始アドレス格納場所

  printf("zero clear\n");
  buf[0] = 0x0;  // ゼロクリア

  printf("set address for cpu1\n");
  printf("address: %08x\n", core2[0]);
  printf("sev\n");
  asm volatile("sev");
  printf("loop start\n");

  while(!buf[0]){
	mdelay(1000);
	printf("Wait message\n");
  }

  printf("Message from CORE-2\n");
  
  return (0);
}
