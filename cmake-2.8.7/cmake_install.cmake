# Install script for directory: /usr/local/src/lnmpp/cmake-2.8.7

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc/cmake-2.8" TYPE FILE FILES "/usr/local/src/lnmpp/cmake-2.8.7/Copyright.txt")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake-2.8" TYPE DIRECTORY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ DIR_PERMISSIONS OWNER_READ OWNER_EXECUTE OWNER_WRITE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES
    "/usr/local/src/lnmpp/cmake-2.8.7/Modules"
    "/usr/local/src/lnmpp/cmake-2.8.7/Templates"
    REGEX "/[^/]*\\.sh[^/]*$" PERMISSIONS OWNER_READ OWNER_EXECUTE OWNER_WRITE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE REGEX "/CVS$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/KWIML/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmzlib/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmcurl/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmcompress/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmbzip2/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmlibarchive/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmexpat/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Source/CursesDialog/form/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Source/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Utilities/cmake_install.cmake")
  INCLUDE("/usr/local/src/lnmpp/cmake-2.8.7/Tests/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/usr/local/src/lnmpp/cmake-2.8.7/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/usr/local/src/lnmpp/cmake-2.8.7/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
