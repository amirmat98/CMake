# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.


# support for the nasm assembler

set(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS nasm asm)

if(NOT CMAKE_ASM_NASM_OBJECT_FORMAT)
  if(WIN32)
    if(CMAKE_C_SIZEOF_DATA_PTR EQUAL 8)
      set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
    else()
      set(CMAKE_ASM_NASM_OBJECT_FORMAT win32)
    endif()
  elseif(APPLE)
    if(CMAKE_C_SIZEOF_DATA_PTR EQUAL 8)
      set(CMAKE_ASM_NASM_OBJECT_FORMAT macho64)
    else()
      set(CMAKE_ASM_NASM_OBJECT_FORMAT macho)
    endif()
  else()
    if(CMAKE_C_SIZEOF_DATA_PTR EQUAL 8)
      set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
    else()
      set(CMAKE_ASM_NASM_OBJECT_FORMAT elf)
    endif()
  endif()
endif()

if(NOT CMAKE_ASM_NASM_COMPILE_OBJECT)
  set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")
endif()

# Load the generic ASMInformation file:
set(ASM_DIALECT "_NASM")
include(CMakeASMInformation)
set(ASM_DIALECT)
