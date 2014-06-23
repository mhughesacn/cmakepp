
function(semver_constraint_evaluate  constraint version)
  semver_constraint_compile("${constraint}")
  ans(compiled_constraint)
  #message("cc ${compiled_constraint}")
  if(NOT compiled_constraint)
    return(false)
  endif()
  semver_constraint_compiled_evaluate("${compiled_constraint}" "${version}")
  ans(res)
  #message("eval ${res}")
  return(${res})
endfunction()