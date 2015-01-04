# Create a target to install gnutools for ARM if it is not already installed.
ifeq ($(call CMD_EXISTS,arm-none-eabi-gcc),1)
 GNUTOOLS_ARM_PREREQ = gnutools-arm.$(OS)
endif

gnutools-arm:
	$(MAKE) gnutools-arm.$(OS)

gnutools-arm.mac gnutools-arm.linux:
ifndef GCC_ARM_GNU_TOOLS_URL_PREFIX
    $(error GCC_ARM_GNU_TOOLS_URL_PREFIX is undefined. Try https://launchpad.net/gcc-arm-embedded/4.9/4.9-2014-q4-major/+download/gcc-arm-none-eabi-4_9-2014q4-20141203-)
endif
	mkdir -p gnutools-arm
	$(call download,$(GCC_ARM_GNU_TOOLS_URL_PREFIX)$(OS).tar.bz2,gnutools-arm/gnutools-$(OS).tar.bz2)

	cd gnutools-arm; bunzip2 gnutools-$(OS).tar.bz2 && tar xvf gnutools-$(OS).tar && rm gnutools-$(OS).tar
	cd gnutools-arm; mv $$(ls | grep gcc) gnutools && mv gnutools/* . && rmdir gnutools

# Create a target to install openocd if it is not already installed.
ifeq ($(call CMD_EXISTS,openocd),1)
 OPENOCD_PREREQ = openocd.$(OS)
endif

openocd.mac:
	brew install open-ocd

# Create a target to install automake if it is not already installed.
ifeq ($(call CMD_EXISTS,automake),1)
 AUTOMAKE_PREREQ = automake.$(OS)
endif

automake.mac:
	brew install automake


# Create a target to install autoconf if it is not already installed.
ifeq ($(call CMD_EXISTS,autoconf),1)
 AUTOCONF_PREREQ = autoconf.$(OS)
endif

autoconf.mac:
	brew install autoconf

# Create a target to install pkg-config if it is not already installed.
ifeq ($(call CMD_EXISTS,pkg-config),1)
 PKGCONFIG_PREREQ = pkgconfig.$(OS)
endif

pkgconfig.mac:
	brew install pkg-config

# Create a target to install pyyaml if it is not already installed.
ifeq ($(call PYMODULE_EXISTS,yaml),1)
 PYYAML_PREREQ = pyyaml.$(OS)
endif

pyyaml.mac: | $(LIBYAML_PREREQ)
	sudo easy_install pyyaml


# Create a target to install libusb if it is not already installed.
ifeq ($(call LIBRARY_EXISTS,libusb),1)
 LIBUSB_PREREQ = libusb.$(OS)
endif

libusb.mac:
	brew install libusb

# Create a target to install libusb-compat if it is not already installed.
ifeq ($(call LIBRARY_EXISTS,libusb-compat),1)
 LIBUSB_COMPAT_PREREQ = libusb-compat.$(OS)
endif

libusb-compat.mac:
	brew install libusb-compat

# Create a target to install libyaml if it is not already installed.
ifeq ($(call LIBRARY_EXISTS,libyaml),1)
 LIBYAML_PREREQ = libyaml.$(OS)
endif

libyaml.mac:
	brew install libyaml
