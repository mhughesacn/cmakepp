function(json2_definition)
map()
 key("name")
  val("json2")
 key("phases")
 map()
  key("name")
   val("parse")
  key("function")
   val("parse_string\(/1\ /2\ /3\ /4\ /5\)")
  key("input")
   val("input_ref")
   val("def")
   val("definitions")
   val("parsers")
   val("global")
  key("output")
   val("output")
 end()
 map()
  key("name")
   val("create\ input\ ref")
  key("function")
   val("ref_setnew\(/1\)")
  key("input")
   val("input")
  key("output")
   val("input_ref")
 end()
 key("parsers")
 map()
  key("regex")
   val("parse_regex")
  key("match")
   val("parse_match")
  key("sequence")
   val("parse_sequence")
  key("any")
   val("parse_any")
  key("many")
   val("parse_many")
  key("object")
   val("parse_object")
 end()
 key("definitions")
 map()
  key("json")
  map()
   key("parser")
    val("any")
   key("any")
    val("value")
  end()
  key("value")
  map()
   key("parser")
    val("any")
   key("any")
    val("string")
    val("number")
    val("boolean")
    val("object")
    val("array")
  end()
  key("object")
  map()
   key("parser")
    val("object")
   key("begin")
    val("brace_open")
   key("keyvalue")
    val("keyvalue")
   key("end")
    val("brace_close")
   key("separator")
    val("comma")
  end()
  key("keyvalue")
  map()
   key("parser")
    val("sequence")
   key("sequence")
   map()
    key("key")
     val("string")
    key("colon")
     val("/colon")
    key("value")
     val("value")
   end()
  end()
  key("array")
  map()
   key("parser")
    val("many")
   key("begin")
    val("bracket_open")
   key("element")
    val("value")
   key("separator")
    val("comma")
   key("end")
    val("bracket_close")
  end()
  key("string")
  map()
   key("parser")
    val("regex")
   key("regex")
    val("\"\(\([\^\\\"]|\\\\|\(\\\\([\"tnr]\)\)\)*\)\"")
   #key("replace")
   # val("\\\\1")
   key("transform")
    val("json_string_ref_to_cmake")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("number")
  map()
   key("parser")
    val("regex")
   key("regex")
    val("0|[1-9][0-9]*")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("boolean")
  map()
   key("parser")
    val("regex")
   key("regex")
    val("(true|false)")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("whitespace")
  map()
   key("parser")
    val("regex")
   key("regex")
    val("[\ \n\r\t]+")
  end()
  key("colon")
  map()
   key("parser")
    val("match")
   key("search")
    val(":")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("comma")
  map()
   key("parser")
    val("match")
   key("search")
    val(",")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("brace_open")
  map()
   key("parser")
    val("match")
   key("search")
    val("{")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("brace_close")
  map()
   key("parser")
    val("match")
   key("search")
    val("}")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("bracket_open")
  map()
   key("parser")
    val("match")
   key("search")
    val("[")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
  key("bracket_close")
  map()
   key("parser")
    val("match")
   key("search")
    val("]")
   key("ignore_regex")
    val("[\ \n\r\t]+")
  end()
 end()
end()
return_ans()
endfunction()