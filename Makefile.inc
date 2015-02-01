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
# The name of the file originally invoked for Make. Assumes no MAKEFILES used.
MAKEFILE = $(CURDIR)/$(word 1,$(MAKEFILE_LIST))

help:

include $(MAKEMAGIC_DIR)makemagic/os_detection.mk
include $(MAKEMAGIC_DIR)makemagic/terminal.mk
include $(MAKEMAGIC_DIR)makemagic/dir_functions.mk
include $(MAKEMAGIC_DIR)makemagic/file_functions.mk
include $(MAKEMAGIC_DIR)makemagic/prerequisite_functions.mk
include $(MAKEMAGIC_DIR)makemagic/web_functions.mk
include $(MAKEMAGIC_DIR)makemagic/installers.mk