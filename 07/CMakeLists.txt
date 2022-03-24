cmake_minimum_required(VERSION 3.22)

#工程文件名称
project(HELLO)

#编译子目录
add_subdirectory(src)

#编译子目录
add_subdirectory(libhello)

#指定安装目录(如果不指定目录，默认是 C:\Program Files (x86)\hello)
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/SDK)

#头文件安装位置
INSTALL(FILES ${PROJECT_SOURCE_DIR}/libhello/hello.h DESTINATION include)    

#库文件安装位置               
INSTALL(TARGETS libhello DESTINATION lib) 

#主程序 exe 文件安装位置
INSTALL(TARGETS hello    DESTINATION bin) 
