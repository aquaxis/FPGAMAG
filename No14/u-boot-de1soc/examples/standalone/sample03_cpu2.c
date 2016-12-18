#include <common.h>
#include <exports.h>

int sample02_cpu2 (int argc, char * const argv[])
{
  u32 *buf, *sw, *led;

	buf = (u32 *)0x10000000; // CPU1とのメッセージバッファのアドレス
	sw  = (u32 *)0x40010000; // S/W GPIOのアドレス
	led = (u32 *)0x40020000; // LED GPIOのアドレス

	led[0] = 0xF;            // LEDを点灯
	buf[0] = 0xFFFFFFFF;     // メッセージバッファへ書き込み

	while(1)
	  ;

	return (0);
}
