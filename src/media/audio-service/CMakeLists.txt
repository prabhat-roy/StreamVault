cmake_minimum_required(VERSION 3.22)
project(audio_service LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS system)
find_package(Threads REQUIRED)

find_package(PkgConfig REQUIRED)
pkg_check_modules(FFMPEG QUIET libavcodec libavformat libavutil libswresample)

add_executable(audio_service src/main.cpp)
target_link_libraries(audio_service PRIVATE Boost::system Threads::Threads ${FFMPEG_LIBRARIES})
target_include_directories(audio_service PRIVATE ${FFMPEG_INCLUDE_DIRS})
