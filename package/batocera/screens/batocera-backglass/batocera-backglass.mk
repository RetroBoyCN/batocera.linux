################################################################################
#
# batocera-backglass
#
################################################################################

BATOCERA_BACKGLASS_VERSION = 1.0
BATOCERA_BACKGLASS_LICENSE = GPL
BATOCERA_BACKGLASS_SOURCE=

BACKGLASS_PATH = $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/screens/batocera-backglass

define BATOCERA_BACKGLASS_INSTALL_TARGET_CMDS
	# script
	mkdir -p $(TARGET_DIR)/usr/bin
	install -m 0755 $(BACKGLASS_PATH)/batocera-backglass.sh        $(TARGET_DIR)/usr/bin/batocera-backglass
	install -m 0755 $(BACKGLASS_PATH)/batocera-backglass-window.py $(TARGET_DIR)/usr/bin/batocera-backglass-window

	# hooks
        mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/scripts
        $(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/screens/batocera-backglass/scripts/*.sh $(TARGET_DIR)/usr/share/batocera-backglass/scripts/

	# default web page
        mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-default
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/screens/batocera-backglass/www/backglass-default/*.{js,css,htm} $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-default/
endef

$(eval $(generic-package))