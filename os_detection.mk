### OS detection
UNAME := $(shell uname)
UNAME_A := $(shell uname -a)

ifeq ($(UNAME), Linux)
 KERNEL = linux
 ifneq (,$(findstring Debian,$(UNAME_A)))
  DISTRO = debian
 endif
 OS = $(KERNEL)-$(DISTRO)
endif

ifeq ($(UNAME), Darwin)
 KERNEL = darwin
 OS = mac
endif

ifndef OS
 KERNEL = win
 OS = win
endif
