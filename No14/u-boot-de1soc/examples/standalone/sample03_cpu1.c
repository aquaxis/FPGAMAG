#include <common.h>
#include <exports.h>

int sample03_cpu1 (int argc, char * const argv[])
{
  u32 *buf, *cpu2;

  app_startup(argv);

  printf("CPU1 Start\n");

  buf = (u32 *)0x10000000;  // CPU2と通信用領域
  cpu2 = (u32 *)0xFFFFFFF0; // CPU2の実行開始アドレス格納場所

  printf("zero clear\n");
  buf[0] = 0x0;             // メッセージのゼロクリア

  printf("set address for CPU2\n");
  printf("old address: %08x\n", cpu2[0]);
  cpu2[0] = 0x09000000;     // CPU2の実行開始アドレスを設定
  printf("new address: %08x\n", cpu2[0]);
  printf("sev\n");
  asm volatile("sev");      // sevコマンドの実行
  printf("loop start\n");

  while(!buf[0]){
	mdelay(1000);
	printf("Wait message\n");
  }

  printf("Message from CPU2\n");
  
  return (0);
}
