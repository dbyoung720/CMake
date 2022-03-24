#库包含文件
set(LIB_SRC hello.c hello.h)

#编译库
add_library(libhello ${LIB_SRC})

#设置库输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

#指定库输出的名称
set_target_properties(libhello PROPERTIES OUTPUT_NAME "hello")