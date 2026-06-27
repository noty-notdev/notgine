#
#	Archivo para la configuración de las
#	librerias estáticas y dinámicas que creará
#	CMake mediante compilación.
#

#	Incluir el modulo "FetchContent" para generar las dependencias.
include(FetchContent)


#	Función para crear y generar bibliotecas del sistema.
function(create_library lib type)
	set(oneValueArgs PUBLIC_INCLUDE_DIR)
	set(multiValueArgs SOURCES DEPENDENCIES)

	cmake_parse_arguments(ARG "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

	#	Protección contra función con número de argumentos no válido.
	if(NOT ARG_SOURCES)
		message(
			FATAL_ERROR
			"Error crítico: "
			"No se especificaron los archivos fuente de la librería <${lib}>."
		)
	endif()

	#	Generar directorio público de sus headers <.h>
	if(ARG_PUBLIC_INCLUDE_DIR)
		set(INCLUDE_DIR "${ARG_PUBLIC_INCLUDE_DIR}")
	else()
		set(INCLUDE_DIR "${CMAKE_SOURCE_DIR}/include")
	endif()

	#	Generar alcance de la libreria.
	if(${type} STREQUAL "INTERFACE")
		set(S_TYPE "INTERFACE")
		set(H_TYPE "INTERFACE")
	else()
		set(S_TYPE "PRIVATE")
		set(H_TYPE "PUBLIC")
	endif()

	#	Crear y configurar librería.
	add_library(${lib} ${type})

	target_sources(${lib} ${S_TYPE} ${ARG_SOURCES})

	target_include_directories(${lib} ${H_TYPE} $<BUILD_INTERFACE:${INCLUDE_DIR}>)

	#	Enlazar dependencias (si es el caso).
	if(ARG_DEPENDENCIES)
		target_link_directories(${lib} PRIVATE ${ARG_DEPENDENCIES})
	endif()

	message(STATUS "[Librería]: <${lib}> fue creada correctamente.")
endfunction()


#	Función para crear y generar bibliotecas del sistema.
function(resolve_dependency sys_name pkg repository version use_exact)

	#	Establecer el nombre de la dependencia en el sistema (si aplica).
	set(FIND_ARGS NAMES ${sys_name})

	#	Establecer la versión del paquete.
	list(APPEND FIND_ARGS CONFIG ${version})

	#	Si se requiere una versión exacta.
	if(use_exact)
		list(APPEND FIND_ARGS EXACT)
	endif()

	list(APPEND FIND_ARGS QUIET)

	FetchContent_Declare(
		${pkg}
		GIT_REPOSITORY	${repository}
		GIT_TAG			${version}
		GIT_SHALLOW		TRUE

		FIND_PACKAGE_ARGS NAMES ${FIND_ARGS}
	)

	FetchContent_MakeAvailable(${pkg})

	message(STATUS "[Dependencia]: <${pkg}> fue resuelta correctamente.")
endfunction()


