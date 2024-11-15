PLATFORM_FLAVOR ?= baize

ifeq ($(PLATFORM_FLAVOR),baize)
include core/arch/arm/cpu/cortex-armv8-0.mk
platform-debugger-arm := 1
CFG_ARM64_core ?= y
#supported-ta-targets ?= ta_arm64 ta_arm32
supported-ta-targets ?= ta_arm64
else
$(error Error: Not supported PLATFORM_FLAVOR or NULL PLATFORM_FLAVOR)
endif

ifeq ($(platform-debugger-arm),1)
# ARM debugger needs this
platform-cflags-debug-info = -gdwarf-2
platform-aflags-debug-info = -gdwarf-2
endif

ifeq ($(platform-flavor-armv8),1)
$(call force,CFG_WITH_ARM_TRUSTED_FW,y)
endif

$(call force,CFG_PL011,y)
$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)

ifeq ($(CFG_CORE_TPM_EVENT_LOG),y)
# NOTE: Below values for the TPM event log are implementation
# dependent and used mostly for debugging purposes.
# Care must be taken to properly configure them if used.
CFG_TPM_LOG_BASE_ADDR ?= 0x402c951
CFG_TPM_MAX_LOG_SIZE ?= 0x200
$(error Error: need to configure)
endif

ifneq ($(CFG_ARM64_core),y)
$(call force,CFG_ARM32_core,y)
endif

CFG_WITH_STATS ?= y
CFG_ENABLE_EMBEDDED_TESTS ?= y

ifeq ($(CFG_CORE_SEL2_SPMC),y)
$(call force,CFG_CORE_RESERVED_SHM,n)
CFG_GIC ?= n
else
$(call force,CFG_GIC,y)
endif

CFG_TEE_CORE_NB_CORE ?= 1
CFG_BOOT_SECONDARY_REQUEST ?= n
CFG_NUM_THREADS ?= 4
CFG_CRYPTO_WITH_CE ?= y
CFG_CORE_HEAP_SIZE ?= 131072

CFG_TZDRAM_START ?= 0x08100000 # start address 0x8000000 defined in fake_soc.c of qemu
CFG_TZDRAM_SIZE ?= 0x07f00000 # 0x100000 is used by atf
CFG_TEE_RAM_VA_SIZE ?= 0x00400000
CFG_SHMEM_START ?= 0x31000000
CFG_SHMEM_SIZE ?= 0x00400000

