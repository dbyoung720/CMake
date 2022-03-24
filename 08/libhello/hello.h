#ifndef HELLO_H
#define HELLO_H

#if defined(WINDOWS) || defined(WIN32)
#  ifdef HELLO_DLL
#      define EXPORT_DLL  extern __declspec(dllexport)
#    else
#      define EXPORT_DLL  extern __declspec(dllimport)
#  endif
#endif

EXPORT_DLL void hello(const char* name);

#endif
