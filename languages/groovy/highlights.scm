(identifier) @variable

((identifier) @boolean
    (#any-of? @boolean
        "true"
        "false"))

[
    (line_comment)
    (block_comment)
] @comment

((block_comment) @comment.doc
    (#match? @comment.doc "^/\\*\\*"))

(number) @number

(operators) @operator

; ("." . (identifier) @property)

(command
    .
    (unit
        ((identifier) @not-import
            (#not-eq? @not-import "import")))
    (unit
        "."
        .
        (identifier) @property)
    .)

((identifier) @type
    (#match? @type "^_*[A-Z].*$"))

((identifier) @constant
    (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))

(
    (unit
        (identifier) @function
        .)
    .
    (arg_block)
)

(
    (identifier) @function
    .
    (arg_block)
)

(block
    (unit
        (identifier) @function
        .))

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
        "null"
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
        "while"
        "as"
        "in"
        "permitsrecord"
        "sealed"
        "trait"
        "var"
        "yields"))

[
    "{" "}"
    "<" ">"
    "(" ")"
    "[" "]"
] @punctuation.bracket

[
    ";"
    ","
    ":"
    "."
] @punctuation.delimiter

(string) @string

(escape_sequence) @string.escape

((leading_key) . (identifier) @string.special)

(leading_key) @string.special.symbol

(_
    (leading_key)
    .
    "{" @string.special.symbol
    "}" @string.special.symbol
    .)

((identifier) @text.literal
    (#eq? @text.literal "null"))

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
