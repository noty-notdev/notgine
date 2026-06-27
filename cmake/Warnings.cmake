#
#	Archivo para la configuración de las advertencias
#	consideradas para los compiladores de C y C++.
#


function(target_set_warnings target)

	#	Si se compila con mingw (Visual C)
	if(MSVC)
	
		target_compile_options(
			${target}
			PRIVATE
				/W4
				/permissive-
		)

	else()

		target_compile_options(
			${target}
			PRIVATE
				-Wall
				-Wextra
				-Wpedantic

				-Wcast-align
				-Wconversion
				-Wdouble-promotion

				-Wformat=2

				-Wimplicit-fallthrough

				-Wnull-dereference

				-Wold-style-cast

				-Wshadow

				-Wundef

				-Wunused

				-Wnon-virtual-dtor

				-Woverloaded-virtual
		)

	endif()

endfunction()

