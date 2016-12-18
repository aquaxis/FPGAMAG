#include <common.h>
#include <exports.h>

int sample02_core2 (int argc, char * const argv[])
{
  u32 *buf, *sw, *led;

	buf = (u32 *)0x10000000; //
	sw  = (u32 *)0x40010000; //
	led = (u32 *)0x40020000; //

	led[0] = 0xF; // LEDを点灯
	buf[0] = 0xFFFFFFFF;

	return (0);
}
