# Copyright (C) 2014 ARM Limited. All rights reserved. 

# search path for included .cmake files (set this as early as possible, so that
# indirect includes still use it)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")

include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME mbedOS)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR "armv7-m")

# provide compatibility definitions for compiling with this target: these are
# definitions that legacy code assumes will be defined. Before adding something
# here, think VERY CAREFULLY if you can't change anywhere that relies on the
# definition that you're about to add to rely on the TARGET_LIKE_XXX
# definitions that yotta provides based on the target.json file.
#
set(YOTTA_TARGET_DEFINITIONS "-DCPU_MK64FN1M0VMD12 -DTARGET_K64F -DTOOLCHAIN_GCC -DTOOLCHAIN_GCC_ARM -DMBED_OPERATORS")

# post-process elf files into .bin files:
set(YOTTA_POSTPROCESS_COMMAND "arm-none-eabi-objcopy -O binary YOTTA_CURRENT_EXE_NAME YOTTA_CURRENT_EXE_NAME.bin")

# Set the compiler to ARM-GCC
include(CMakeForceCompiler)

cmake_force_c_compiler(arm-none-eabi-gcc GNU)
cmake_force_cxx_compiler(arm-none-eabi-g++ GNU)

