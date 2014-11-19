# Copyright (C) 2014 ARM Limited. All rights reserved. 

message("mbedOS-GNU-C.cmake included")

# Override the link rules:
set(CMAKE_C_CREATE_SHARED_LIBRARY "echo 'shared libraries not supported' && 1")
set(CMAKE_C_CREATE_SHARED_MODULE  "echo 'shared modules not supported' && 1")
set(CMAKE_C_CREATE_STATIC_LIBRARY "<CMAKE_AR> -cr <LINK_FLAGS> <TARGET> <OBJECTS>")
set(CMAKE_C_COMPILE_OBJECT        "<CMAKE_C_COMPILER> ${YOTTA_TARGET_DEFINITIONS} <DEFINES> <FLAGS> -o <OBJECT> -c <SOURCE>")
set(CMAKE_C_LINK_EXECUTABLE       "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES> -Wl,--start-group -lnosys -lm -lc -lgcc -lnosys -lnosys -lm -lc -lgcc -lnosys -Wl,--end-group -o <TARGET>")


set(CMAKE_C_FLAGS_INIT "-fno-exceptions -fno-unwind-tables -mcpu=cortex-m4 -mthumb -ffunction-sections -fdata-sections -Wall -Wextra -D__thumb2__")
set(CMAKE_C_FLAGS_DEBUG_INIT          "${CMAKE_C_FLAGS_INIT} -g")
set(CMAKE_C_FLAGS_MINSIZEREL_INIT     "${CMAKE_C_FLAGS_INIT} -Os -DNDEBUG")
set(CMAKE_C_FLAGS_RELEASE_INIT        "${CMAKE_C_FLAGS_INIT} -Os -DNDEBUG")
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "${CMAKE_C_FLAGS_INIT} -Os -g -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_C "-isystem ")


set(CMAKE_ASM_FLAGS_INIT  "-fno-exceptions -fno-unwind-tables -mcpu=cortex-m4 -mthumb -x assembler-with-cpp -D__thumb2__")
set(CMAKE_ASM_FLAGS_DEBUG_INIT          "${CMAKE_ASM_FLAGS_INIT} -g")
set(CMAKE_ASM_FLAGS_MINSIZEREL_INIT     "${CMAKE_ASM_FLAGS_INIT} -Os -DNDEBUG")
set(CMAKE_ASM_FLAGS_RELEASE_INIT        "${CMAKE_ASM_FLAGS_INIT} -Os -DNDEBUG")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO_INIT "${CMAKE_ASM_FLAGS_INIT} -Os -g -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_ASM  "-isystem ")


# include paths for standard libs (use gcc's)
exec_program("${CMAKE_C_COMPILER} -print-libgcc-file-name" OUTPUT_VARIABLE _ARM_GNU_LIBGCC)
get_filename_component(_ARM_GNU_GCC_DIR ${CMAKE_C_COMPILER} DIRECTORY)
get_filename_component(_ARM_GNU_LIBGCC_DIR ${_ARM_GNU_LIBGCC} DIRECTORY)

# set link flags
set(CMAKE_C_LINK_FLAGS "")
set(CMAKE_MODULE_LINKER_FLAGS_INIT
    "-fno-exceptions -fno-unwind-tables -mcpu=cortex-m4 -mthumb -Wl,--gc-sections -Wl,--sort-common -Wl,--sort-section=alignment"
)

# set the link script
set(CMAKE_EXE_LINKER_FLAGS_INIT
    "${CMAKE_MODULE_LINKER_FLAGS_INIT} -T${CMAKE_CURRENT_LIST_DIR}/../../ld/K64FN1M0xxx12.ld"
) 
