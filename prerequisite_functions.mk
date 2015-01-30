### Check whether things are installed
# 0 if true, 1 otherwise
COMMAND_EXISTS = $(strip $(shell (which $(1) > /dev/null); echo $$?))

# 0 if library is installed, 1 otherwise
ifeq ($(OS), mac)
 LIBRARY_EXISTS = $(strip $(shell (brew ls $(1) > /dev/null 2> /dev/null); echo $$?))
else
 $(error "I don't know how to check if a library is installed on this system.")
endif

# 0 if Python module exists, 1 otherwise
PYMODULE_EXISTS = $(strip $(shell (python -c "import $(1)" 2&> /dev/null); echo $$?))

# 0 if file exists, 1 otherwise
FILE_EXISTS = $(strip $(shell [ -f "$(1)" ]; echo $$?))

isinstalled = $(if $(findstring undefined,$(origin $(1))),,$(1).missing)
