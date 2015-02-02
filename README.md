Getting started                                                             {#mainpage}
===============

Makemagic is a series of Makefiles to complete common tasks on MacOS with future support
for Linux distributions and Windows.

To incorporate it into a project, the recommended method is to use it as a git submodule
and include the following at the top of root project's `Makefile`:

    DEPENDENCY_DIRECTORY=dep

    include $(DEPENDENCY_DIRECTORY)/makemagic/Makefile

    ### Set up makemagic.
    $(DEPENDENCY_DIRECTORY)/makemagic:
    	git submodule add git@heresjono.com:makemagic $(DEPENDENCY_DIRECTORY)/makemagic

    $(DEPENDENCY_DIRECTORY)/makemagic/Makefile: | $(DEPENDENCY_DIRECTORY)/makemagic
    	git submodule init
    	git submodule update

Then, to install, run `make`.