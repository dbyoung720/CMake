#工程文件名称
project(HELLO)

#设置库 libhello 包含的文件
set(LIB_SRC hello.c hello.h)

#编译 libhello 库
add_library(libhello ${LIB_SRC})

#指定输出库的名称
set_target_properties(libhello PROPERTIES OUTPUT_NAME "hello")

#设置主程序 hello.exe 包含的文件
set(APP_SRC main.c)

#编译 hello.exe
add_executable(hello ${APP_SRC})

#编译 hello.exe 所要用到的第三方库
target_link_libraries(hello libhello)
