### OS detection
UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
 OS = linux
endif
ifeq ($(UNAME), Darwin)
 OS = mac
endif
ifndef OS
 OS = win
endif
