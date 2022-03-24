#头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/libhello)

#主程序包含的文件
set(APP_SRC main.c)

#设置主程序输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

#编译 exe 文件
add_executable(hello ${APP_SRC})

#链接主程序需要使用到的第三方库
target_link_libraries(hello libhello)
