CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

# Settings:
SET(CTEST_DASHBOARD_ROOT                "/usr/local/src/lnmpp/cmake-2.8.7/Tests/CTestTest")
SET(CTEST_SITE                          "BTG")
SET(CTEST_BUILD_NAME                    "CTestTest-Linux-g++-ConfigFileInBuildDir2")

SET(CTEST_SOURCE_DIRECTORY              "/usr/local/src/lnmpp/cmake-2.8.7/Tests/CTestTestConfigFileInBuildDir")
SET(CTEST_BINARY_DIRECTORY              "/usr/local/src/lnmpp/cmake-2.8.7/Tests/CTestTestConfigFileInBuildDir2")
SET(CTEST_CVS_COMMAND                   "/usr/bin/cvs")
SET(CTEST_CMAKE_GENERATOR               "Unix Makefiles")
SET(CTEST_BUILD_CONFIGURATION           "$ENV{CMAKE_CONFIG_TYPE}")
SET(CTEST_COVERAGE_COMMAND              "/usr/bin/gcov")
SET(CTEST_NOTES_FILES                   "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")

CTEST_START(Experimental)
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
