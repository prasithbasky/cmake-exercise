cmake_minimum_required(VERSION 3.16)
project(cmake_excercise)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

add_executable(main main.cpp)

target_sources(main PRIVATE
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

target_include_directories(main PUBLIC
    ${CMAKE_SOURCE_DIR}/flatset
    ${CMAKE_SOURCE_DIR}/filesystem
    ${CMAKE_SOURCE_DIR}/fem
    ${CMAKE_SOURCE_DIR}/yamlParser
)

target_link_libraries(main Boost::filesystem)

DEAL_II_SETUP_TARGET(main)
target_link_libraries(main ${DEAL_II_LIBRARIES})

target_link_libraries(main yaml-cpp)
