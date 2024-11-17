/* SPDX-License-Identifier: BSD-2-Clause */
/*
 * Copyright (c) 2014, Linaro Limited
 */

#ifndef PLATFORM_CONFIG_H
#define PLATFORM_CONFIG_H

#include <mm/generic_ram_layout.h>
#include <stdint.h>

/* Make stacks aligned to data cache line length */
#define STACK_ALIGNMENT		64

#if defined(PLATFORM_FLAVOR_baize)

#define GIC_BASE		0x10000000
#define UART0_BASE		0x20000000
#define UART1_BASE              0x20000000 // only one uart

#define IT_UART1		16
#define IT_SEC_PHY_TIMER	29

#define CONSOLE_UART_BASE	UART0_BASE
//#define IT_CONSOLE_UART		IT_UART1

#define GICD_OFFSET		0x10000
#define GICC_OFFSET		0x0
#ifdef CFG_ARM_GICV3
#define GIC_REDIST_BASE		0x10020000
#define GIC_REDIST_SIZE		0x04000000
#endif

#else
#error "unknown platform flavor"
#endif

#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
#define GICC_BASE		(GIC_BASE + GICC_OFFSET)

#ifndef UART_BAUDRATE
#define UART_BAUDRATE		115200
#endif
#ifndef CONSOLE_BAUDRATE
#define CONSOLE_BAUDRATE	UART_BAUDRATE
#endif

/* For virtual platforms where there isn't a clock */
#ifndef CONSOLE_UART_CLK_IN_HZ
#define CONSOLE_UART_CLK_IN_HZ	1
#endif

#endif /*PLATFORM_CONFIG_H*/

