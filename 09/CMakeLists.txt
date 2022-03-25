#CMake 的最低版本要求
cmake_minimum_required(VERSION 3.16)

#工程文件名称
set(PROJECT_NAME sqlite3) 

#设置代码是何种语言编写
project(${PROJECT_NAME} C)

#设置 C 语言规范版本
set(CMAKE_C_STANDARD 11)

#编译的平台
message("Building on: ${CMAKE_SYSTEM_NAME}")

#指定 sqlite3 源代码目录；CMAKE_CURRENT_SOURCE_DIR 是 CMakeLists.txt 所在的目录
set(SQILITE3_SOURCE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src)

#sqlite 版本
file(STRINGS "${SQILITE3_SOURCE_PATH}/sqlite3.h" _sqlite_api_h_VER_STRING REGEX ".*#define[ ]+SQLITE_VERSION[ ]+")
string(REGEX MATCH    "[0-9\\.]+" SQLITE_VER_STRING ${_sqlite_api_h_VER_STRING})
string(REGEX MATCHALL "[0-9]+" _sqlite_ver_LIST "${SQLITE_VER_STRING}")
list(GET _sqlite_ver_LIST 0 SQLITE_VER_MAJOR)
list(GET _sqlite_ver_LIST 1 SQLITE_VER_MINOR)
list(GET _sqlite_ver_LIST 2 SQLITE_VER_PATCH)
message("FOUND: SQLite version = ${SQLITE_VER_STRING}")

#编译 sqlite3 源码要使用到的文件
set(SRC_LIB_FILE    ${SQILITE3_SOURCE_PATH}/sqlite${SQLITE_VER_MAJOR}.c)
set(SRC_SHELL_FILE  ${SQILITE3_SOURCE_PATH}/shell.c)
file(GLOB HDR_FILES ${SQILITE3_SOURCE_PATH}/*.h)
set(SRC_RES_FILE    ${SQILITE3_SOURCE_PATH}/${PROJECT_NAME}.rc)

#编译参数
option(SQLITE_BUILD_STATIC  "Build SQLite static library" ON) # 是否编译静态库
option(SQLITE_BUILD_SHARED  "Build SQLite shared library" ON) # 是否编译动态库

set(SQLITE_WIN_BUILD OFF) # Windows 环境下编译
if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    set(SQLITE_WIN_BUILD ON)
endif()

set(SQLITE_STATIC_NAME "${PROJECT_NAME}_static") # 静态库名称
set(SQLITE_SHARED_NAME "${PROJECT_NAME}_shared") # 动态库名称；如果同时编译静态库、动态库，那么名称不能重复；

if (SQLITE_BUILD_STATIC)
    add_library(${SQLITE_STATIC_NAME} STATIC ${SRC_LIB_FILE}) # 编译静态库
endif()

if (SQLITE_BUILD_SHARED)
    add_library(${SQLITE_SHARED_NAME} SHARED ${SRC_LIB_FILE}) # 编译动态库
    if (SQLITE_WIN_BUILD)
        set_target_properties(${SQLITE_SHARED_NAME} PROPERTIES DEFINE_SYMBOL "SQLITE_API=__declspec(dllexport)")
    endif()
endif()

add_executable(${PROJECT_NAME} ${SRC_SHELL_FILE} ${SRC_LIB_FILE} ${SRC_RES_FILE}) # 编译 shell 可执行文件

#安装
set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/SDK) #指定安装目录(如果不指定目录，默认是 C:\Program Files (x86)\sqlite3)

list(APPEND TO_INSTALL ${PROJECT_NAME})

if(SQLITE_BUILD_SHARED)
    list(APPEND TO_INSTALL ${SQLITE_SHARED_NAME})
endif()

if(SQLITE_BUILD_STATIC)
    list(APPEND TO_INSTALL ${SQLITE_STATIC_NAME})
endif()

install(TARGETS ${TO_INSTALL}
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib)
install(FILES ${HDR_FILES} DESTINATION include)

