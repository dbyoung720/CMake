cmake_minimum_required(VERSION 3.22)

#工程文件名称
project(HELLO)

#编译子目录
add_subdirectory(src)

#编译子目录
add_subdirectory(libhello)

#指定安装目录(如果不指定目录，默认是 C:\Program Files (x86)\hello)
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/SDK)

#安装头文件
INSTALL(FILES ${PROJECT_SOURCE_DIR}/libhello/hello.h DESTINATION include)    

#安装库文件             
INSTALL(TARGETS libhello LIBRARY DESTINATION lib) 

#安装主程序 EXE 文件连同 DLL 文件
INSTALL(TARGETS hello    RUNTIME DESTINATION bin) 
