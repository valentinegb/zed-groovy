(class_definition
    (access_modifier)? @context
    ["@interface" "interface" "class"] @context
    name: (_) @name) @item

(declaration
    (access_modifier)? @context
    [
        (builtintype)
        (identifier)
        (dotted_identifier)
        (index)
        (function_call)
        (string)
        (array_type)
        (type_with_generics)
        "def"
    ]? @context
    name: (_) @name) @item

(function_declaration
    (access_modifier)? @context
    [
        (builtintype)
        (identifier)
        (dotted_identifier)
        (index)
        (function_call)
        (string)
        (array_type)
        (type_with_generics)
        "def"
    ] @context
    function: (_) @name) @item

(function_definition
    (access_modifier)? @context
    [
        (builtintype)
        (identifier)
        (dotted_identifier)
        (index)
        (function_call)
        (string)
        (array_type)
        (type_with_generics)
        "def"
    ] @context
    function: (_) @name) @item
