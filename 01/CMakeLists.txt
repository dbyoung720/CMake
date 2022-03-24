#工程文件名称
project(HELLO)

#工程包含的源代码
set(SRC_LIST main.c)

#编译 exe 文件
add_executable(hello ${SRC_LIST})
