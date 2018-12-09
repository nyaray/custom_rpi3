################################################################################
#
# lescan
#
################################################################################

#LESCAN_VERSION = 809af6404dce59f5692b9411f58c51034384e2d7
#LESCAN_SITE = $(call github,edrosten,libblepp,$(LIBBLEPP_VERSION))

LESCAN_VERSION = 0.1
LESCAN_SITE = ./package/lescan/src
LESCAN_SITE_METHOD = local

LESCAN_INSTALL_STAGING = YES
LESCAN_INSTALL_TARGET = YES

LESCAN_LICENSE = MIT
#LESCAN_LICENSE_FILES = COPYING

LESCAN_DEPENDENCIES = libblepp
LESCAN_AUTORECONF = YES

LESCAN_CONF_OPTIONS += --prefix=/usr

define LESCAN_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) lib -C $(@D)
endef

$(eval $(autotools-package))


