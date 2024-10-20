global-incdirs-y += .
srcs-y += main.c
ifeq ($(PLATFORM_FLAVOR_baize),y)
srcs-$(CFG_ARM64_core) += baize_a64.S
endif
srcs-$(CFG_WITH_USER_TA) += vendor_props.c
