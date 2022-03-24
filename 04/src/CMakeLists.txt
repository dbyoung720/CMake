#头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/libhello)

#主程序包含的文件
set(APP_SRC main.c)

#编译 exe 文件
add_executable(hello ${APP_SRC})

#链接第三方库
target_link_libraries(hello libhello)