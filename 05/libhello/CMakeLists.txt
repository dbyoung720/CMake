#库包含文件
set(LIB_SRC hello.c hello.h)

#编译库
add_library(libhello ${LIB_SRC})

#指定库输出的名称
set_target_properties(libhello PROPERTIES OUTPUT_NAME "hello")
