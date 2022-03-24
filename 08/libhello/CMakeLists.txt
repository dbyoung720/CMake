#库包含文件
set(LIB_SRC hello.c hello.h)

#编译动态库(SHARED 必须是大写)
add_library(libhello SHARED ${LIB_SRC})

#设置库输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

#指定库输出的名称
set_target_properties(libhello PROPERTIES OUTPUT_NAME "hello")

#生成导出库
set_target_properties(libhello PROPERTIES DEFINE_SYMBOL HELLO_DLL)
set_target_properties(libhello PROPERTIES VERSION 1 SOVERSION 0)
