Getting started                                                             {#mainpage}
===============

Makemagic is a series of Makefiles to complete common tasks on MacOS with future support
for Linux distributions and Windows.

To incorporate it into a project, the recommended method is to use it as a git submodule
and include the following at the top of root project's `Makefile`:

    include makemagic/Makefile
    
    ### Set up development environment
    makemagic/Makefile.inc:
    	git submodule init
    	git submodule update

