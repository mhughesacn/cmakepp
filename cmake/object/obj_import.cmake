
  function(obj_import obj)
    obj_keys("${obj}")
    ans(keys)
    foreach(key ${keys})
      obj_get("${obj}" "${key}")
      ans(val)
      set("${key}" "${val}" PARENT_SCOPE)
    endforeach()
  endfunction()