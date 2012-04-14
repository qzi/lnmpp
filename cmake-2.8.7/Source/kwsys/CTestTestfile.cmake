# CMake generated Testfile for 
# Source directory: /usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys
# Build directory: /usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys
# 
# This file includes the relevent testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(kwsys.testEncode "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsC" "testEncode")
ADD_TEST(kwsys.testTerminal "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsC" "testTerminal")
ADD_TEST(kwsys.testAutoPtr "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testAutoPtr")
ADD_TEST(kwsys.testHashSTL "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testHashSTL")
ADD_TEST(kwsys.testRegistry "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testRegistry")
ADD_TEST(kwsys.testIOS "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testIOS")
ADD_TEST(kwsys.testSystemTools "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testSystemTools")
ADD_TEST(kwsys.testCommandLineArguments "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testCommandLineArguments" "--another-bool-variable" "--long3=opt" "--set-bool-arg1" "-SSS" "ken" "brad" "bill" "andy" "--some-bool-variable=true" "--some-double-variable12.5" "--some-int-variable" "14" "--some-string-variable=test string with space" "--some-multi-argument" "5" "1" "8" "3" "7" "1" "3" "9" "7" "1" "-N" "12.5" "-SS=andy" "-N" "1.31" "-N" "22" "-SS=bill" "-BBtrue" "-SS=brad" "-BBtrue" "-BBfalse" "-SS=ken" "-A" "-C=test" "--long2" "hello")
ADD_TEST(kwsys.testCommandLineArguments1 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testCommandLineArguments1" "--ignored" "-n" "24" "--second-ignored" "-m=test value" "third-ignored" "-p" "some" "junk" "at" "the" "end")
ADD_TEST(kwsys.testSystemInformation "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testSystemInformation")
ADD_TEST(kwsys.testDynamicLoader "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestsCxx" "testDynamicLoader")
ADD_TEST(kwsys.testProcess-1 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "1")
SET_TESTS_PROPERTIES(kwsys.testProcess-1 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testProcess-2 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "2")
SET_TESTS_PROPERTIES(kwsys.testProcess-2 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testProcess-3 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "3")
SET_TESTS_PROPERTIES(kwsys.testProcess-3 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testProcess-4 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "4")
SET_TESTS_PROPERTIES(kwsys.testProcess-4 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testProcess-5 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "5")
SET_TESTS_PROPERTIES(kwsys.testProcess-5 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testProcess-6 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "6")
SET_TESTS_PROPERTIES(kwsys.testProcess-6 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testProcess-7 "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestProcess" "7")
SET_TESTS_PROPERTIES(kwsys.testProcess-7 PROPERTIES  TIMEOUT "120")
ADD_TEST(kwsys.testSharedForward "/usr/local/src/lnmpp/cmake-2.8.7/Source/kwsys/cmsysTestSharedForward" "1")
