#工程文件名称
project(HELLO)

#工程包含的源代码
set(SRC_LIST main.c hello.c hello.h)

# 编译 exe 文件
add_executable(hello ${SRC_LIST})
