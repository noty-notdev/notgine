#
#	Archivo para la configuración de las
#	librerias estáticas y dinámicas que creará
#	CMake mediante compilación.
#


function(create_executable exe)
	set(multiValueArgs SOURCES DEPENDENCIES)

	cmake_parse_arguments(ARG "" "" "${multiValueArgs}" ${ARGN})

	if(NOT ARG_SOURCES)
		message(FATAL_ERROR
			"Error crítico: "
			"No se especificaron los archivos fuente del ejecutable <${exe}>."
		)
	endif()

	add_executable(${exe})

	target_sources(${exe} PRIVATE ${ARG_SOURCES})

	set_target_properties(${exe} PROPERTIES
		RUNTIME_OUTPUT_DIRECTORY	${CMAKE_CURRENT_SOURCE_DIR}
	)

	if(ARG_DEPENDENCIES)
		target_link_libraries(${exe} PRIVATE ${ARG_DEPENDENCIES})
	endif()

	message(STATUS "El ejecutable <${exe}> fue creado correctamente.")
endfunction()


