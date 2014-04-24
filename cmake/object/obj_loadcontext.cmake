function(obj_loadcontext ctx)
#	debug_message("loading context ${ctx}")
	obj_getkeys(${ctx} keys)
	foreach(key ${keys})
		obj_get(${ctx}  ${key})
    ans(value)
		#debug_message("loading ${key} into scope value: '${value}'")
		set(${key} "${value}" PARENT_SCOPE)
	endforeach()
endfunction()