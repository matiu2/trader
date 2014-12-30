include(ExternalProject)

# Forex Connect

# Pretty non-c++ api

ExternalProject_Add(ForexConnect
    PREFIX 3rd_party
    #--Download step--------------
    URL http://fxcodebase.com/bin/forexconnect/1.3.1/ForexConnectAPI-1.3.1-Linux-x86_64.tar.gz
    URL_HASH SHA1=7fdb90a2d45085feb8b76167cae419ad4c211d6b
    #--Configure step-------------
    CONFIGURE_COMMAND ""
    #--Build step-----------------
    BUILD_COMMAND ""
    #--Install step---------------
    UPDATE_COMMAND "" # Skip annoying updates for every build
    INSTALL_COMMAND ""
)

SET(FXCM_DIR ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/ForexConnectAPI-1.3.1-Linux-x86_64)
SET(FXCM_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/ForexConnectAPI-1.3.1-Linux-x86_64/include)
SET(FXCM_LIB_DIR ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/ForexConnectAPI-1.3.1-Linux-x86_64/lib)
find_library(FXCM_FOREX_CONNECT ForexConnect ${FXCM_LIB_DIR})
find_library(FXCM_FXMSG fxmsg ${FXCM_LIB_DIR})
find_library(FXCM_GSEXPAT gsexpat ${FXCM_LIB_DIR})
find_library(FXCM_GSTOOL3 gstool3 ${FXCM_LIB_DIR})
find_library(FXCM_HTTPLIB httplib ${FXCM_LIB_DIR})
find_library(FXCM_LOG4CPLUS log4cplus ${FXCM_LIB_DIR})
find_library(FXCM_PDAS pdas ${FXCM_LIB_DIR})
SET(FXCM_LIBRARIES ${FXCM_FOREX_CONNECT} ${FXCM_FXMSG} ${FXCM_GSEXPAT} ${FXCM_GSTOOL3} ${FXCM_HTTPLIB} ${FXCM_LOG4CPLUS} ${FXCM_PDAS})


# Quick Fix

# Provides only live data, nothing historical
# https://github.com/quickfix/quickfix.git
