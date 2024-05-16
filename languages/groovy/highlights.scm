[
  "!in"
  "!instanceof"
  "as"
  "assert"
  "case"
  "catch"
  "class"
  "def"
  "default"
  "else"
  "extends"
  "finally"
  "for"
  "if"
  "import"
  "in"
  "instanceof"
  "package"
  "pipeline"
  "return"
  "switch"
  "try"
  "while"
  (break)
  (continue)
] @keyword

[
  "true"
  "false"
] @boolean

(null) @constant
"this" @variable.special

[
  "int"
  "char"
  "short"
  "long"
  "boolean"
  "float"
  "double"
  "void"
] @type

[
  "final"
  "private"
  "protected"
  "public"
  "static"
  "synchronized"
] @keyword

(comment) @comment
(shebang) @comment

(string) @string
(string (escape_sequence) @string.escape)
(string (interpolation ([ "$" ]) @string.special.symbol))

("(") @punctuation.bracket
(")") @punctuation.bracket
("[") @punctuation.bracket
("]") @punctuation.bracket
("{") @punctuation.bracket
("}") @punctuation.bracket
(":") @punctuation.delimiter
(",") @punctuation.delimiter
(".") @punctuation.delimiter

(number_literal) @number
(identifier) @variable

((identifier) @constant
  (#match? @constant "^[A-Z][A-Z_]+"))

[
  "%" "*" "/" "+" "-" "<<" ">>" ">>>" ".." "..<" "<..<" "<.." "<"
  "<=" ">" ">=" "==" "!=" "<=>" "===" "!==" "=~" "==~" "&" "^" "|"
  "&&" "||" "?:" "+" "*" ".&" ".@" "?." "*." "*" "*:" "++" "--" "!"
] @operator

(string ("/") @string.regex)

(ternary_op ([ "?" ":" ]) @operator)

(map (map_item key: (identifier) @variable))

(parameter type: (identifier) @type name: (identifier) @variable)
(generic_param name: (identifier) @variable)

(declaration type: (identifier) @type)
(function_definition type: (identifier) @type)
(function_declaration type: (identifier) @type)
(class_definition name: (identifier) @type)
(class_definition superclass: (identifier) @type)
(generic_param superclass: (identifier) @type)

(type_with_generics (identifier) @type)
(type_with_generics (generics (identifier) @type))
(generics [ "<" ">" ] @punctuation.bracket)
(generic_parameters [ "<" ">" ] @punctuation.bracket)
; TODO: Class literals with PascalCase

(declaration ("=") @operator)
(assignment ("=") @operator)


(function_call
  function: (identifier) @function)
(function_call
  function: (dotted_identifier
	  (identifier) @function . ))
(function_call (argument_list
		 (map_item key: (identifier) @variable)))
(juxt_function_call
  function: (identifier) @function)
(juxt_function_call
  function: (dotted_identifier
	  (identifier) @function . ))
(juxt_function_call (argument_list
		      (map_item key: (identifier) @variable)))

(function_definition
  function: (identifier) @function)
(function_declaration
  function: (identifier) @function)

(annotation) @attribute
(annotation (identifier) @attribute)
"@interface" @attribute

"pipeline" @keyword

(groovy_doc) @comment.doc
(groovy_doc
  [
    (groovy_doc_param)
    (groovy_doc_throws)
    (groovy_doc_tag)
  ] @string.special)
(groovy_doc (groovy_doc_param (identifier) @variable))
(groovy_doc (groovy_doc_throws (identifier) @type))
