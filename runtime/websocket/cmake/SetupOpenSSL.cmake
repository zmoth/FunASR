# SetupOpenSSL.cmake
# Download and configure OpenSSL library

if(WIN32)
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/openssl-1.1.1w")
        message(STATUS "Downloading OpenSSL (Windows x64)...")
        FetchContent_Declare(
            openssl
            URL "https://isv-data.oss-cn-hangzhou.aliyuncs.com/ics/MaaS/ASR/dep_libs/openssl-1.1.1w.zip"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/openssl-1.1.1w"
        )
        FetchContent_MakeAvailable(openssl)
        message(STATUS "OpenSSL downloaded to: ${CMAKE_SOURCE_DIR}/third_party/openssl-1.1.1w")
    endif()

    if(NOT DEFINED OPENSSL_ROOT_DIR)
        set(OPENSSL_ROOT_DIR "${CMAKE_SOURCE_DIR}/third_party/openssl-1.1.1w" CACHE PATH "OpenSSL root directory")
    endif()

    # Install DLLs to bin directory
    if(EXISTS "${OPENSSL_ROOT_DIR}/bin")
        file(GLOB OPENSSL_dlls "${OPENSSL_ROOT_DIR}/bin/*.dll")
        if(OPENSSL_dlls)
            install(FILES ${OPENSSL_dlls} DESTINATION bin)
        endif()
    endif()

elseif(UNIX)
    # Linux platform uses system-provided OpenSSL
    message(STATUS "Linux platform uses system-provided OpenSSL")
endif()

find_package(OpenSSL REQUIRED)