### OS detection
ifeq ($(OS), linux)
 SED_IN_PLACE = sed -i
endif
ifeq ($(OS), mac)
 SED_IN_PLACE = sed -i ""
endif
