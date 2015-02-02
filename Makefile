###
#
# A set of Make targets, variables, etc. that are generally useful.
# No need for autoconf! (maybe)
#
# (c) 2015 Jonathan Lung
#
###
.PHONY: help docs

PROJECT_NAME ?= "Makemagic Project"
DOC_DIRECTORY ?= "docs"

cur_makefile = $(realpath $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
# This file's filename.
MAKEMAGIC := $(cur_makefile)
# Path to Makemagic
MAKEMAGIC_DIR := $(dir $(MAKEMAGIC))
# The name of the file originally invoked for Make. Assumes no MAKEFILES used.
MAKEFILE = $(realpath $(word 1,$(MAKEFILE_LIST)))

help:
	@echo "Available targets:"
	@# Only tested on MacOS:
	@HELPS=$$(make -rpn | perl -ne '$$_ =~ s/^(mm\.[^:]+):/$$1/; print "$$_" if /^mm/'); for target in "$${HELPS}"; do make -f $(MAKEFILE) $${target}; done

mm.help.help:
	@echo " * $(EM)help$(NR)              Show this help screen."


include $(MAKEMAGIC_DIR)/os_detection.mk
include $(MAKEMAGIC_DIR)/terminal.mk
include $(MAKEMAGIC_DIR)/dir_functions.mk
include $(MAKEMAGIC_DIR)/file_functions.mk
include $(MAKEMAGIC_DIR)/prerequisite_functions.mk
include $(MAKEMAGIC_DIR)/web_functions.mk
include $(MAKEMAGIC_DIR)/installers.mkmk

### Update everything to get going
getting_started: docs devenv

### Generate documentation
docs: $(doxygen)
	@echo Generating documentation...
	@export PROJECT_NAME=$(PROJECT_NAME); export DOC_DIRECTORY=$(DOC_DIRECTORY); (if [ -f Doxyfile ]; then doxygen 2>&1-; else doxygen $(MAKEMAGIC_DIR)/Doxyfile 2>&1-; fi) | grep ":"; if [ $$? == 0 ]; then exit 1; fi
	@echo "Done."

mm.docs.help:
	@echo " * $(EM)docs$(NR)              Generate documentation. Defaults to docs directory."

### Set up development environment
devenv:

mm.devenv.help:
	@echo " * $(EM)devenv$(NR)            Set up development environment."

### Makefile-making rules.
%.mkmk: %.mkmm %.mkpp
	$*.mkpp < $*.mkmm > $*.mkmk