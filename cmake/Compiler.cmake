#
#	Archivo para la configuración de los compiladores
#	de C y C++.
#

#	Desactivar extensiones de GNU y utilizar solo el estándar.
set(CMAKE_C_EXTENSIONS   OFF)
set(CMAKE_CXX_EXTENSIONS OFF)


#	Estándares de los compiladores.
set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


#	Exportar comandos de compilación.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#	nose :p
set(CMAKE_POSITION_INDEPENDENT_CODE ON)


