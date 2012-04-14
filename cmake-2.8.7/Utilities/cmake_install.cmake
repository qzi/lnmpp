# Install script for directory: /usr/local/src/lnmpp/cmake-2.8.7/Utilities

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/tmp/lnmpp/lnmpp-0.01/cmake/cmake-2.8.7")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/man/man1" TYPE FILE FILES
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmakecommands.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmakecompat.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmakeprops.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmakepolicies.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmakevars.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmakemodules.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ctest.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cpack.1"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ccmake.1"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc/cmake-2.8" TYPE FILE FILES
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-policies.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-properties.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-variables.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-modules.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-commands.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-compatcommands.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ctest.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cpack.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ccmake.html"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake.docbook"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-policies.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-properties.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-variables.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-modules.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-commands.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-compatcommands.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ctest.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ctest.docbook"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cpack.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cpack.docbook"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ccmake.txt"
    "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ccmake.docbook"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/aclocal" TYPE FILE FILES "/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmake.m4")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/Doxygen/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/KWStyle/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

