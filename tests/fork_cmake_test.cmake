function(test)
  function(fork_cmake script_ish)
    file_make_temporary("${script_ish}")
    ans(tmp_file)
    message("scriptish ${script_ish}")
    message("file ${tmp_file}")
    cmake(-P "${tmp_file}")
    ans(res)
    json_print(${res})
    file(REMOVE "${tmp_file}")
    return_ref(res)
  endfunction()


  fork_cmake("message(hello)\ndbg(hello)")
  ans(res)

  message("wot ${res}")

endfunction()