# CMake generated Testfile for 
# Source directory: /usr/local/src/lnmpp/cmake-2.8.7/Utilities
# Build directory: /usr/local/src/lnmpp/cmake-2.8.7/Utilities
# 
# This file includes the relevent testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(CMake.HTML "/usr/local/src/lnmpp/cmake-2.8.7/bin/cmake" "-E" "chdir" "/usr/local/src/lnmpp/cmake-2.8.7/Utilities/xml" "/usr/bin/xmllint" "--valid" "--noout" "--nonet" "--path" "." "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-policies.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-properties.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-variables.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-modules.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-commands.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cmake-compatcommands.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ctest.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/cpack.html" "/usr/local/src/lnmpp/cmake-2.8.7/Docs/ccmake.html")
SUBDIRS(Doxygen)
SUBDIRS(KWStyle)
