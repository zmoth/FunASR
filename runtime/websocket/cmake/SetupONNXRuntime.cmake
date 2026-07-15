# SetupONNXRuntime.cmake
# Download and configure ONNX Runtime library

if(WIN32)
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-win-x64-1.16.1")
        message(STATUS "Downloading ONNX Runtime (Windows x64)...")
        FetchContent_Declare(
            onnxruntime
            URL "https://isv-data.oss-cn-hangzhou.aliyuncs.com/ics/MaaS/ASR/dep_libs/onnxruntime-win-x64-1.16.1.zip"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-win-x64-1.16.1"
        )
        FetchContent_MakeAvailable(onnxruntime)
        message(STATUS "ONNX Runtime downloaded to: ${CMAKE_SOURCE_DIR}/third_party/onnxruntime-win-x64-1.16.1")
    endif()

    if(NOT DEFINED ONNXRUNTIME_DIR)
        set(ONNXRUNTIME_DIR "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-win-x64-1.16.1" CACHE PATH "ONNX Runtime root directory")
    endif()

    # Install DLLs to bin directory
    if(EXISTS "${ONNXRUNTIME_DIR}/lib")
        file(GLOB ONNXRUNTIME_DLLs "${ONNXRUNTIME_DIR}/lib/*.dll")
        if(ONNXRUNTIME_DLLs)
            install(FILES ${ONNXRUNTIME_DLLs} DESTINATION bin)
        endif()
    endif()

elseif(UNIX AND CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-x64-1.14.0")
        message(STATUS "Downloading ONNX Runtime (Linux x64)...")
        FetchContent_Declare(
            onnxruntime
            URL "https://isv-data.oss-cn-hangzhou.aliyuncs.com/ics/MaaS/ASR/dep_libs/onnxruntime-linux-x64-1.14.0.tgz"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-x64-1.14.0"
        )
        FetchContent_MakeAvailable(onnxruntime)
        message(STATUS "ONNX Runtime downloaded to: ${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-x64-1.14.0")
    endif()

    if(NOT DEFINED ONNXRUNTIME_DIR)
        set(ONNXRUNTIME_DIR "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-x64-1.14.0" CACHE PATH "ONNX Runtime root directory")
    endif()

elseif(UNIX AND CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-aarch64-1.14.0")
        message(STATUS "Downloading ONNX Runtime (Linux aarch64)...")
        FetchContent_Declare(
            onnxruntime
            URL "https://github.com/microsoft/onnxruntime/releases/download/v1.14.0/onnxruntime-linux-aarch64-1.14.0.tgz"
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-aarch64-1.14.0"
        )
        FetchContent_MakeAvailable(onnxruntime)
        message(STATUS "ONNX Runtime downloaded to: ${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-aarch64-1.14.0")
    endif()

    if(NOT DEFINED ONNXRUNTIME_DIR)
        set(ONNXRUNTIME_DIR "${CMAKE_SOURCE_DIR}/third_party/onnxruntime-linux-aarch64-1.14.0" CACHE PATH "ONNX Runtime root directory")
    endif()

endif()

link_directories(${ONNXRUNTIME_DIR}/lib)