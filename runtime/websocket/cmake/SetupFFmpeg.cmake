# SetupFFmpeg.cmake
# Download and configure FFmpeg library

if(WIN32)
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-win64-gpl-shared")
        message(STATUS "Downloading FFmpeg (Windows x64)...")
        FetchContent_Declare(
            ffmpeg
            URL "https://isv-data.oss-cn-hangzhou.aliyuncs.com/ics/MaaS/ASR/dep_libs/ffmpeg-master-latest-win64-gpl-shared.zip"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-win64-gpl-shared"
        )
        FetchContent_MakeAvailable(ffmpeg)
        message(STATUS "FFmpeg downloaded to: ${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-win64-gpl-shared")
    endif()

    if(NOT DEFINED FFMPEG_DIR)
        set(FFMPEG_DIR "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-win64-gpl-shared" CACHE PATH "FFmpeg root directory")
    endif()

    # Install DLLs to bin directory
    if(EXISTS "${FFMPEG_DIR}/bin")
        file(GLOB FFMPEG_dlls "${FFMPEG_DIR}/bin/*.dll")
        if(FFMPEG_dlls)
            install(FILES ${FFMPEG_dlls} DESTINATION bin)
        endif()
    endif()

elseif(UNIX AND CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-linux64-gpl-shared")
        message(STATUS "Downloading FFmpeg (Linux x64)...")
        FetchContent_Declare(
            ffmpeg
            URL "https://isv-data.oss-cn-hangzhou.aliyuncs.com/ics/MaaS/ASR/dep_libs/ffmpeg-master-latest-linux64-gpl-shared.tar.xz"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-linux64-gpl-shared"
        )
        FetchContent_MakeAvailable(ffmpeg)
        message(STATUS "FFmpeg downloaded to: ${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-linux64-gpl-shared")
    endif()

    if(NOT DEFINED FFMPEG_DIR)
        set(FFMPEG_DIR "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-master-latest-linux64-gpl-shared" CACHE PATH "FFmpeg root directory")
    endif()

elseif(UNIX AND CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-n5.1.6-2-g0e8b267a97-linuxarm64-gpl-shared-5.1")
        message(STATUS "Downloading FFmpeg (Linux aarch64)...")
        FetchContent_Declare(
            ffmpeg
            URL "https://github.com/BtbN/FFmpeg-Builds/releases/download/autobuild-2024-08-31-12-50/ffmpeg-n5.1.6-2-g0e8b267a97-linuxarm64-gpl-shared-5.1.tar.xz"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-n5.1.6-2-g0e8b267a97-linuxarm64-gpl-shared-5.1"
        )
        FetchContent_MakeAvailable(ffmpeg)
        message(STATUS "FFmpeg downloaded to: ${CMAKE_SOURCE_DIR}/third_party/ffmpeg-n5.1.6-2-g0e8b267a97-linuxarm64-gpl-shared-5.1")
    endif()

    if(NOT DEFINED FFMPEG_DIR)
        set(FFMPEG_DIR "${CMAKE_SOURCE_DIR}/third_party/ffmpeg-n5.1.6-2-g0e8b267a97-linuxarm64-gpl-shared-5.1" CACHE PATH "FFmpeg root directory")
    endif()

endif()

link_directories(${FFMPEG_DIR}/lib)