/* SPDX-License-Identifier: BSD-2-Clause */
/*
 * Copyright (c) 2014, Linaro Limited
 */

#include <asm.S>
#include <arm.h>

/* the A57 core */
FUNC get_core_pos_mpidr , :
	/* calculate CorePos = (ClusterId * 4) + CoreId */
	and	x1, x0, #MPIDR_CPU_MASK
	and	x0, x0, #MPIDR_CLUSTER_MASK
	lsr	x0, x0, #6
	add	x0, x0, x1
	ret
END_FUNC get_core_pos_mpidr
