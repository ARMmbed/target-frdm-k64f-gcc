# Copyright (C) 2014-2015 ARM Limited. All rights reserved.

if(TARGET_FRDM_K64F_GCC_TOOLCHAIN_INCLUDED)
    return()
endif()
set(TARGET_FRDM_K64F_GCC_TOOLCHAIN_INCLUDED 1)

# provide compatibility definitions for compiling with this target: these are
# definitions that legacy code assumes will be defined. Before adding something
# here, think VERY CAREFULLY if you can't change anywhere that relies on the
# definition that you're about to add to rely on the TARGET_LIKE_XXX
# definitions that yotta provides based on the target.json file.
#
add_definitions("-DTARGET_K64F")

