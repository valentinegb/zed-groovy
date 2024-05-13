; Brackets
[
    "[" "]"
    "{" "}"
    "(" ")"
] @punctuation.bracket

; Delimiters
[
    ","
    ";"
    "."
    ":"
] @punctuation.delimiter

; Strings
(string) @string

; Escape sequences
(escape_sequence) @string.escape

; String interpolation
(string
    (leading_key) @string.special.symbol
    "{"? @string.special.symbol
    (_)* @primary
    (identifier)? @string.special
    "}"? @string.special.symbol)

; Numbers
(number) @number

; Operators
(operators) @operator

; Contextual keywords
((identifier) @keyword
    (#any-of? @keyword
        "as"
        "in"
        "permits"
        "record"
        "sealed"
        "trait"
        "var"
        "yields"))

; Properties
("." . (identifier) @property)

; Packages
(command
    (unit
        ((identifier) @keyword
            (#any-of? @keyword
                "import"
                "package")))
    (unit
        (identifier) @primary))

; Classes
((identifier) @type
    (#match? @type "^[A-Z]"))

; Constants
((identifier) @constant
    (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))

; Methods
(func
    (identifier) @function)
(
    (unit
        (identifier) @function
        .)
    .
    (arg_block)
)

; Constructors
(func
    ((identifier) @constructor
        (#match? @constructor "^[A-Z]")))
(
    (unit
        ((identifier) @constructor
            (#match? @constructor "^[A-Z]"))
        .)
    .
    (arg_block)
)

; Primative types
((identifier) @type
    (#any-of? @type
        "boolean"
        "char"
        "byte"
        "short"
        "int"
        "long"
        "float"
        "double"))

; Boolean literals
((identifier) @boolean
    (#any-of? @boolean
        "true"
        "false"))

; null literal
((identifier) @text.literal
    (#eq? @text.literal "null"))

; Reserved keywords
((identifier) @keyword
    (#any-of? @keyword
        "abstract"
        "assert"
        "break"
        "case"
        "catch"
        "class"
        "const"
        "continue"
        "def"
        "default"
        "do"
        "else"
        "enum"
        "extends"
        "final"
        "finally"
        "for"
        "goto"
        "if"
        "implements"
        "import"
        "instanceof"
        "interface"
        "native"
        "new"
        "non-sealed"
        "package"
        "public"
        "protected"
        "private"
        "return"
        "static"
        "strictfp"
        "super"
        "switch"
        "synchronized"
        "this"
        "threadsafe"
        "throw"
        "throws"
        "transient"
        "try"
        "while"))

; Annotations
(decorate
    (identifier) @attribute) @attribute

; Comments
[
    (line_comment)
    (block_comment)
] @comment

; Documentation comments
((block_comment) @comment.doc
    (#match? @comment.doc "^/\\*\\*"))
