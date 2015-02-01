###
#
# A set of Make targets, variables, etc. that are generally useful.
# No need for autoconf! (maybe)
#
###
.phony: help

cur_makefile = $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
# This file's filename.
MAKEMAGIC := $(cur_makefile)
# Path to Makemagic
MAKEMAGIC_DIR := $(dir $(MAKEMAGIC))
# The name of the file originally invoked for Make. Assumes no MAKEFILES used.
MAKEFILE = $(CURDIR)/$(word 1,$(MAKEFILE_LIST))

help:

include $(MAKEMAGIC_DIR)/os_detection.mk
include $(MAKEMAGIC_DIR)/terminal.mk
include $(MAKEMAGIC_DIR)/dir_functions.mk
include $(MAKEMAGIC_DIR)/file_functions.mk
include $(MAKEMAGIC_DIR)/prerequisite_functions.mk
include $(MAKEMAGIC_DIR)/web_functions.mk
include $(MAKEMAGIC_DIR)/installers.mk