#include <common.h>
#include <exports.h>

int sample02 (int argc, char * const argv[])
{
	char * const table[6] = {
	  "fatload",
	  "mmc",
	  "0:1",
	  "0x01000000",
	  "zybo_wrapper.bit",
	  NULL
	};
	char * const table2[6] = {
	  "fpga",
	  "loadb",
	  "0",
	  "0x01000000",
	  "1fcc08",
	  NULL
	};
	cmd_tbl_t *cmdtp;

	app_startup(argv);

	printf("Start FPGA Load App.\n");

	// コマンドの検索
	cmdtp = find_cmd("fatload");
	if(!cmdtp){
	  printf("not found fatload\n");
	  return 1;
	}

	// FPGAバイナリをメモリにロード
	if( do_fat_fsload( cmdtp, 0, 5, table) != 0 ){
	  printf("load error\n");
	  return 1;
	}

	// コマンドの検索
	cmdtp = find_cmd("fpga");
	if(!cmdtp){
	  printf("not found fatload\n");
	  return 1;
	}

	// FPGA起動
	if( do_fpga(cmdtp, 0, 5, table2) != 0 ){
	  printf("run error\n");
	}

	printf ("Hit any key to exit ... ");
	while (!tstc())
		;
	/* consume input */
	(void) getc();

	printf ("\n\n");
	return (0);
}
