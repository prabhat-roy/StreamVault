cmake_minimum_required(VERSION 3.22)
project(transcoding_service LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS system)
find_package(Threads REQUIRED)

# FFmpeg discovery (libavcodec, libavformat, libavutil, libswscale).
# Linked at runtime; transcoding pipeline added in subsequent waves.
find_package(PkgConfig REQUIRED)
pkg_check_modules(FFMPEG QUIET libavcodec libavformat libavutil libswscale)

add_executable(transcoding_service src/main.cpp)
target_link_libraries(transcoding_service PRIVATE Boost::system Threads::Threads ${FFMPEG_LIBRARIES})
target_include_directories(transcoding_service PRIVATE ${FFMPEG_INCLUDE_DIRS})
