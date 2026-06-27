#
#	Archivo con la configuración para instalar,
#	encontrar y generar las dependencias para
#	el proyecto.
#
#

set(DEPS_DIR "${CMAKE_SOURCE_DIR}/deps")

#	Generar <glad.a>
create_library(glad STATIC
	PUBLIC_INCLUDE_DIR ${DEPS_DIR}/glad/include
	SOURCES
		${DEPS_DIR}/glad/src/glad.c
)

#	Generar <stb.a>
create_library(stb INTERFACE
	PUBLIC_INCLUDE_DIR ${DEPS_DIR}/stb/include
	SOURCES
		${DEPS_DIR}/stb/src/stb_image.h
)

#	Encontrar paquetes.
find_package(OpenGL 4.0 QUIET)
if(NOT OpenGL_FOUND)
	message(FATAL_ERROR "[Dependencia]: <OpenGL> no fue encontrado.")
else()
	message(STATUS "[Dependencia]: <OpenGL> fue encontrada correctamente.")
endif()

resolve_dependency(
	glfw3
	glfw
	https://github.com/glfw/glfw.git
	3.4
	FALSE
)

resolve_dependency(
	glm
	glm
	https://github.com/g-truc/glm.git
	1.0.0
	FALSE
)


