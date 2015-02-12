## adds a callable as a task which is to be invoked later
function(task_enqueue callable)  
  function_import("${callable}")
  ans(callback)
  map_new()
  ans(task)
  map_set("${task}" state "waiting")
  map_set("${task}" callback "${callback}")
  map_set("${task}" callable "${callable}")
  map_append(global task_queue ${task})

  return_ref(task)
  ## semicolon encode before string_semicolon_encode exists
  string(ASCII  31 us)
  string(REPLACE ";" "${us}" callable "${callable}")
  set_property(GLOBAL APPEND PROPERTY __initial_invoke_later_list "${callable}") 
  return()
endfunction()

# initial version of task_enqueue which is used before cmakepp is loaded
# ## create invoke later functions 
# function(task_enqueue callable)
#   ## semicolon encode before string_semicolon_encode exists
#   string(ASCII  31 us)
#   string(REPLACE ";" "${us}" callable "${callable}")
#   set_property(GLOBAL APPEND PROPERTY __initial_invoke_later_list "${callable}") 
#   return()
# endfunction()
