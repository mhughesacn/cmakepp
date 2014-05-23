# parses simple json: only arrays, objects and double quoted strings as values and only double quoted strings as keys
# little to no error notification (be sure your json is valid)
function(json_deserialize json)
	json2("${json}")
	return_ans()
	
	json_tokenize(tokens "${json}")
	# add a , before every end of array and end of object
	set(toks)
	foreach(token ${tokens})
		if(${token} STREQUAL ">")
			set(toks ${toks} ",")
		elseif(${token} STREQUAL "}")			
			set(toks ${toks} ",")
		endif()

		set(toks ${toks} ${token})
	endforeach()

	macro(unquote_last_value)
		string(LENGTH "${last_value}" len)
		if(${len} GREATER 0)
			math(EXPR len "${len} -2")

			string(SUBSTRING "${last_value}" 1 ${len} last_value)
			string(REGEX REPLACE "\\\\;" ";" last_value "${last_value}")
			#string(REGEX REPLACE "\\\\([rnt])" "\\\\1" last_value "${last_value}")
		
			string(REPLACE "\\r" "\r" last_value "${last_value}")
			string(REPLACE "\\n" "\n" last_value "${last_value}")
			string(REPLACE "\\t" "\t" last_value "${last_value}")
			string(REPLACE "†" "[" last_value "${last_value}")
			string(REPLACE "‡" "]" last_value "${last_value}")
		endif()
	endmacro()

	function(set_last_value)		
		unquote_last_value()	

		#message("set last value '${last_value}'")
		value(${ARGN} "${last_value}")
		set(last_value PARENT_SCOPE)
	endfunction()

	set(tokens ${toks})
	set(last_value)
	set(res)
	element()
	foreach(token ${tokens})
	#message("token ${token}")
		#message("${token}")

		if(${token} STREQUAL ",")
			if(last_value)
				if(last_key)
					set_last_value(KEY "${last_key}")
					set(last_key)
				else()
					set_last_value()
				endif()
			endif()

		elseif(${token} STREQUAL ":")
			unquote_last_value()	
			set(last_key "${last_value}")
			set(last_value)
		elseif(${token} STREQUAL "{")
			# start new object
			if(last_key)
				element("${last_key}" MAP)
				set(last_key)
			else()
				element(MAP)
			endif()
		elseif(${token} STREQUAL "}")
			# end object
			element(END)
		elseif(${token} STREQUAL "<")
			if(last_key)
				element("${last_key}" LIST)
				set(last_key)
			else()
				element(LIST)
			endif()
		elseif(${token} STREQUAL ">")
			element(END)		
		else()			
			set(last_value ${last_value} "${token}")			
		endif()
	endforeach()

	if(last_value)
		set_last_value()
	endif()

	element(END root)
	ref_get( "${root}" )
	ans(res)
	return_ref(res)
endfunction()