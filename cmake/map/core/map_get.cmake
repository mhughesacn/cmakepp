macro(map_get this key)
	set(__map_get_property_ref "${this}.${key}")
  get_property(__map_get_property_exists GLOBAL PROPERTY "${__map_get_property_ref}" SET)
  if(NOT __map_get_property_exists)
    message(FATAL_ERROR "map '${this}' does not have key '${key}'")    
  endif()

  get_property(__ans GLOBAL PROPERTY "${__map_get_property_ref}")
#  return_ref(property_val)
endmacro()
#function(map_get this key)
#  set(property_ref "${this}.${key}")
#  get_property(property_exists GLOBAL PROPERTY "${property_ref}" SET)
#  if(NOT property_exists)
#    message(FATAL_ERROR "map '${this}' does not have key '${key}'")    
#  endif()
#  
#  get_property(property_val GLOBAL PROPERTY "${property_ref}")
#  return_ref(property_val)
#
#  
#endfunction()