################################################################################
#
# libble++
#
################################################################################

LIBBLEPP_VERSION = 809af6404dce59f5692b9411f58c51034384e2d7
LIBBLEPP_SITE = $(call github,edrosten,libblepp,$(LIBBLEPP_VERSION))

LIBBLEPP_INSTALL_STAGING = YES
LIBBLEPP_INSTALL_TARGET = YES

LIBBLEPP_LICENSE = MIT
LIBBLEPP_LICENSE_FILES = COPYING

LIBBLEPP_DEPENDENCIES = boost bluez5_utils
LIBBLEPP_AUTORECONF = YES

LIBBLEPP_CONF_OPTIONS += --prefix=/usr

define LIBBLEPP_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) lib -C $(@D)
endef

$(eval $(autotools-package))

