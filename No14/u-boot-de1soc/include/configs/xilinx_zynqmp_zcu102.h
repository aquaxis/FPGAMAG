/*
 * Configuration for Xilinx ZynqMP zcu102
 *
 * (C) Copyright 2015 Xilinx, Inc.
 * Michal Simek <michal.simek@xilinx.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef __CONFIG_ZYNQMP_ZCU102_H
#define __CONFIG_ZYNQMP_ZCU102_H

#define CONFIG_ZYNQ_SDHCI1
#define CONFIG_ZYNQ_I2C0
#define CONFIG_ZYNQ_I2C1
#define CONFIG_SYS_I2C_MAX_HOPS		1
#define CONFIG_SYS_NUM_I2C_BUSES	18
#define CONFIG_SYS_I2C_BUSES	{ \
				{0, {I2C_NULL_HOP} }, \
				{0, {{I2C_MUX_PCA9544, 0x75, 0} } }, \
				{0, {{I2C_MUX_PCA9544, 0x75, 1} } }, \
				{0, {{I2C_MUX_PCA9544, 0x75, 2} } }, \
				{1, {I2C_NULL_HOP} }, \
				{1, {{I2C_MUX_PCA9548, 0x74, 0} } }, \
				{1, {{I2C_MUX_PCA9548, 0x74, 1} } }, \
				{1, {{I2C_MUX_PCA9548, 0x74, 2} } }, \
				{1, {{I2C_MUX_PCA9548, 0x74, 3} } }, \
				{1, {{I2C_MUX_PCA9548, 0x74, 4} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 0} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 1} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 2} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 3} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 4} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 5} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 6} } }, \
				{1, {{I2C_MUX_PCA9548, 0x75, 7} } }, \
				}

#define CONFIG_SYS_I2C_ZYNQ
#define CONFIG_PCA953X
#define CONFIG_CMD_PCA953X
#define CONFIG_CMD_PCA953X_INFO

#define CONFIG_AHCI
#define CONFIG_SATA_CEVA

#define CONFIG_ZYNQMP_XHCI_LIST {ZYNQMP_USB0_XHCI_BASEADDR}

#define CONFIG_IDENT_STRING	" Xilinx ZynqMP ZCU102"

#define CONFIG_KERNEL_FDT_OFST_SIZE \
	"kernel_offset=0x180000\0" \
	"fdt_offset=0x100000\0" \
	"kernel_size=0x1e00000\0" \
	"fdt_size=0x80000\0" \
	"board=zcu102\0"

#include <configs/xilinx_zynqmp.h>

#endif /* __CONFIG_ZYNQMP_ZCU102_H */
