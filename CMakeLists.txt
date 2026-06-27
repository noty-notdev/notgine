
cmake_minimum_required(VERSION 3.30)

project(
	notgine
	VERSION 0.1.0
	LANGUAGES C CXX
)

include(cmake/Compiler.cmake)
include(cmake/Warnings.cmake)

include(cmake/Libraries.cmake)
include(cmake/Executables.cmake)

include(cmake/Dependencies.cmake)


#add_subdirectory(examples/01-hello_window)


