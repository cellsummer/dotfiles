" Predawn Color Scheme for Vim 9.1 with nvim-coc LSP support
" Place in ~/.vim/colors/predawn.vim

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "predawn"

" Color definitions
let s:predawn    = "#F18260"
let s:pale_yellow = "#F5F5AE"
let s:yellow     = "#EDE480"
let s:orange     = "#F49D62"
let s:red        = "#CF5340"
let s:dark_red   = "#893121"
let s:maroon     = "#55201B"
let s:pale_blue  = "#BDDCDC"
let s:blue       = "#92BFBF"
let s:slate      = "#5F777E"
let s:green      = "#B4D388"
let s:pale_green = "#D0EDA7"
let s:dark_green = "#809161"
let s:white      = "#F1F1F1"
let s:grey1      = "#999999"
let s:grey2      = "#777777"
let s:grey3      = "#4C4C4C"
let s:grey4      = "#3C3C3C"
let s:grey5      = "#282828"
let s:grey7      = "#232323"
let s:black      = "#151515"

" Helper function
function! s:hi(group, fg, bg, attr)
    let l:cmd = "hi " . a:group
    if a:fg != ""
        let l:cmd .= " guifg=" . a:fg
    endif
    if a:bg != ""
        let l:cmd .= " guibg=" . a:bg
    endif
    if a:attr != ""
        let l:cmd .= " gui=" . a:attr
    endif
    execute l:cmd
endfunction

" ============================================================================
" Core Editor
" ============================================================================
call s:hi("Normal",       s:white,      s:grey5,      "")
call s:hi("Visual",       "",           s:grey3,      "")
call s:hi("Cursor",       s:grey5,      s:predawn,    "")
call s:hi("CursorLine",   "",           s:grey7,      "NONE")
call s:hi("CursorColumn", "",           s:grey7,      "")
call s:hi("LineNr",       s:grey3,      s:grey5,      "")
call s:hi("CursorLineNr", s:predawn,    s:grey7,      "")
call s:hi("VertSplit",    s:grey3,      s:grey5,      "")
call s:hi("StatusLine",   s:white,      s:grey4,      "")
call s:hi("StatusLineNC", s:grey2,      s:grey4,      "")
call s:hi("Pmenu",        s:white,      s:grey4,      "")
call s:hi("PmenuSel",     s:grey5,      s:predawn,    "")
call s:hi("PmenuSbar",    "",           s:grey3,      "")
call s:hi("PmenuThumb",   "",           s:predawn,    "")
call s:hi("TabLine",      s:grey2,      s:grey4,      "")
call s:hi("TabLineFill",  s:grey2,      s:grey5,      "")
call s:hi("TabLineSel",   s:white,      s:grey5,      "")
call s:hi("Search",       s:grey5,      s:predawn,    "")
call s:hi("IncSearch",    s:grey5,      s:yellow,     "")
call s:hi("Folded",       s:grey2,      s:grey4,      "")
call s:hi("FoldColumn",   s:grey3,      s:grey5,      "")
call s:hi("SignColumn",   "",           s:grey5,      "")
call s:hi("ColorColumn",  "",           s:grey7,      "")
call s:hi("MatchParen",   s:predawn,    s:grey3,      "bold")
call s:hi("NonText",      s:grey3,      "",           "")
call s:hi("SpecialKey",   s:grey3,      "",           "")
call s:hi("Directory",    s:blue,       "",           "")
call s:hi("ErrorMsg",     s:red,        s:grey5,      "")
call s:hi("WarningMsg",   s:yellow,     s:grey5,      "")
call s:hi("ModeMsg",      s:green,      "",           "")
call s:hi("MoreMsg",      s:green,      "",           "")
call s:hi("Question",     s:green,      "",           "")
call s:hi("Title",        s:orange,     "",           "bold")
call s:hi("WildMenu",     s:grey5,      s:predawn,    "")

" ============================================================================
" Syntax Highlighting
" ============================================================================
call s:hi("Comment",      s:grey2,      "",           "italic")
call s:hi("String",       s:pale_blue,  "",           "")
call s:hi("Character",    s:pale_blue,  "",           "")
call s:hi("Number",       s:yellow,     "",           "")
call s:hi("Float",        s:yellow,     "",           "")
call s:hi("Boolean",      s:green,      "",           "")
call s:hi("Constant",     s:yellow,     "",           "")
call s:hi("Identifier",   s:orange,     "",           "")
call s:hi("Function",     s:blue,       "",           "")
call s:hi("Statement",    s:orange,     "",           "")
call s:hi("Conditional",  s:yellow,     "",           "italic")
call s:hi("Repeat",       s:yellow,     "",           "italic")
call s:hi("Label",        s:orange,     "",           "")
call s:hi("Operator",     s:white,      "",           "")
call s:hi("Keyword",      s:orange,     "",           "")
call s:hi("Exception",    s:red,        "",           "")
call s:hi("PreProc",      s:orange,     "",           "")
call s:hi("Include",      s:orange,     "",           "")
call s:hi("Define",       s:orange,     "",           "")
call s:hi("Macro",        s:orange,     "",           "")
call s:hi("PreCondit",    s:orange,     "",           "")
call s:hi("Type",         s:yellow,     "",           "italic")
call s:hi("StorageClass", s:yellow,     "",           "italic")
call s:hi("Structure",    s:yellow,     "",           "")
call s:hi("Typedef",      s:yellow,     "",           "")
call s:hi("Special",      s:predawn,    "",           "")
call s:hi("SpecialChar",  s:predawn,    "",           "")
call s:hi("Tag",          s:green,      "",           "")
call s:hi("Delimiter",    s:white,      "",           "")
call s:hi("Debug",        s:red,        "",           "")
call s:hi("Underlined",   s:blue,       "",           "underline")
call s:hi("Ignore",       s:grey3,      "",           "")
call s:hi("Error",        s:red,        s:grey5,      "")
call s:hi("Todo",         s:predawn,    s:grey5,      "bold")

" ============================================================================
" Diff
" ============================================================================
call s:hi("DiffAdd",      s:green,      s:grey7,      "")
call s:hi("DiffChange",   s:yellow,     s:grey7,      "")
call s:hi("DiffDelete",   s:red,        s:grey7,      "")
call s:hi("DiffText",     s:blue,       s:grey4,      "")
call s:hi("diffAdded",    s:green,      "",           "")
call s:hi("diffRemoved",  s:red,        "",           "")
call s:hi("diffChanged",  s:yellow,     "",           "")

" ============================================================================
" Git Signs
" ============================================================================
call s:hi("GitGutterAdd",          s:green,   s:grey5, "")
call s:hi("GitGutterChange",       s:yellow,  s:grey5, "")
call s:hi("GitGutterDelete",       s:red,     s:grey5, "")
call s:hi("GitGutterChangeDelete", s:orange,  s:grey5, "")

" ============================================================================
" CoC.nvim LSP Highlighting
" ============================================================================

" Diagnostics
call s:hi("CocErrorSign",       s:red,         s:grey5,  "")
call s:hi("CocWarningSign",     s:yellow,      s:grey5,  "")
call s:hi("CocInfoSign",        s:blue,        s:grey5,  "")
call s:hi("CocHintSign",        s:pale_green,  s:grey5,  "")
call s:hi("CocErrorFloat",      s:red,         s:grey4,  "")
call s:hi("CocWarningFloat",    s:yellow,      s:grey4,  "")
call s:hi("CocInfoFloat",       s:blue,        s:grey4,  "")
call s:hi("CocHintFloat",       s:pale_green,  s:grey4,  "")
call s:hi("CocErrorHighlight",  "",            "",       "undercurl")
call s:hi("CocWarningHighlight","",            "",       "undercurl")
call s:hi("CocInfoHighlight",   "",            "",       "undercurl")
call s:hi("CocHintHighlight",   "",            "",       "undercurl")
call s:hi("CocErrorVirtualText",   s:red,      "",       "italic")
call s:hi("CocWarningVirtualText", s:yellow,   "",       "italic")
call s:hi("CocInfoVirtualText",    s:blue,     "",       "italic")
call s:hi("CocHintVirtualText",    s:slate,    "",       "italic")

" Floating windows
call s:hi("CocFloating",        s:white,       s:grey4,  "")
call s:hi("CocFloatDividingLine", s:grey3,     s:grey4,  "")

" Menu/Completion
call s:hi("CocMenuSel",         s:white,       s:slate,    "")
call s:hi("CocPumSearch",       s:predawn,     "",         "bold")
call s:hi("CocPumMenu",         s:white,       s:grey4,    "")
call s:hi("CocPumShortcut",     s:grey2,       "",         "")
call s:hi("CocPumDeprecated",   s:grey2,       "",         "strikethrough")

" Semantic tokens
call s:hi("CocSemClass",        s:yellow,      "",        "")
call s:hi("CocSemEnum",         s:yellow,      "",        "")
call s:hi("CocSemInterface",    s:yellow,      "",        "italic")
call s:hi("CocSemStruct",       s:yellow,      "",        "")
call s:hi("CocSemType",         s:yellow,      "",        "")
call s:hi("CocSemTypeParameter",s:pale_yellow, "",        "italic")
call s:hi("CocSemParameter",    s:orange,      "",        "italic")
call s:hi("CocSemVariable",     s:white,       "",        "")
call s:hi("CocSemProperty",     s:blue,        "",        "")
call s:hi("CocSemEnumMember",   s:pale_blue,   "",        "")
call s:hi("CocSemEvent",        s:predawn,     "",        "")
call s:hi("CocSemFunction",     s:blue,        "",        "")
call s:hi("CocSemMethod",       s:blue,        "",        "")
call s:hi("CocSemMacro",        s:orange,      "",        "")
call s:hi("CocSemKeyword",      s:orange,      "",        "")
call s:hi("CocSemModifier",     s:yellow,      "",        "italic")
call s:hi("CocSemComment",      s:grey2,       "",        "italic")
call s:hi("CocSemString",       s:pale_blue,   "",        "")
call s:hi("CocSemNumber",       s:yellow,      "",        "")
call s:hi("CocSemRegexp",       s:predawn,     "",        "")
call s:hi("CocSemOperator",     s:white,       "",        "")
call s:hi("CocSemNamespace",    s:orange,      "",        "")

" Symbol highlighting (document highlight)
call s:hi("CocHighlightText",   "",            s:grey4,   "")
call s:hi("CocHighlightRead",   "",            s:grey4,   "")
call s:hi("CocHighlightWrite",  "",            s:grey3,   "underline")

" Code lens
call s:hi("CocCodeLens",        s:slate,       "",        "italic")

" Inlay hints
call s:hi("CocInlayHint",       s:slate,       s:grey7,   "italic")
call s:hi("CocInlayHintType",   s:slate,       s:grey7,   "italic")
call s:hi("CocInlayHintParameter", s:dark_green, s:grey7, "italic")

" Links and references
call s:hi("CocUnderline",       "",            "",        "underline")
call s:hi("CocBold",            "",            "",        "bold")
call s:hi("CocItalic",          "",            "",        "italic")
call s:hi("CocStrikeThrough",   "",            "",        "strikethrough")
call s:hi("CocMarkdownLink",    s:blue,        "",        "underline")

" Notifications
call s:hi("CocNotificationProgress", s:predawn, "",      "")
call s:hi("CocNotificationButton",   s:grey5,  s:blue,   "")
call s:hi("CocNotificationError",    s:red,    s:grey4,  "")
call s:hi("CocNotificationWarning",  s:yellow, s:grey4,  "")
call s:hi("CocNotificationInfo",     s:blue,   s:grey4,  "")

" List
call s:hi("CocListLine",        "",            s:grey4,   "")
call s:hi("CocListSearch",      s:predawn,     "",        "bold")
call s:hi("CocSelectedText",    s:predawn,     "",        "")
call s:hi("CocSelectedLine",    "",            s:grey4,   "")

" Tree view
call s:hi("CocTreeTitle",       s:predawn,     "",        "bold")
call s:hi("CocTreeDescription", s:grey2,       "",        "")
call s:hi("CocTreeOpenClose",   s:predawn,     "",        "")
call s:hi("CocTreeSelected",    "",            s:grey4,   "")

" Symbol icons
call s:hi("CocSymbolFile",      s:white,       "",        "")
call s:hi("CocSymbolModule",    s:orange,      "",        "")
call s:hi("CocSymbolNamespace", s:orange,      "",        "")
call s:hi("CocSymbolPackage",   s:orange,      "",        "")
call s:hi("CocSymbolClass",     s:yellow,      "",        "")
call s:hi("CocSymbolMethod",    s:blue,        "",        "")
call s:hi("CocSymbolProperty",  s:blue,        "",        "")
call s:hi("CocSymbolField",     s:pale_blue,   "",        "")
call s:hi("CocSymbolConstructor", s:yellow,    "",        "")
call s:hi("CocSymbolEnum",      s:yellow,      "",        "")
call s:hi("CocSymbolInterface", s:yellow,      "",        "")
call s:hi("CocSymbolFunction",  s:blue,        "",        "")
call s:hi("CocSymbolVariable",  s:orange,      "",        "")
call s:hi("CocSymbolConstant",  s:yellow,      "",        "")
call s:hi("CocSymbolString",    s:pale_blue,   "",        "")
call s:hi("CocSymbolNumber",    s:yellow,      "",        "")
call s:hi("CocSymbolBoolean",   s:green,       "",        "")
call s:hi("CocSymbolArray",     s:orange,      "",        "")
call s:hi("CocSymbolObject",    s:orange,      "",        "")
call s:hi("CocSymbolKey",       s:orange,      "",        "")
call s:hi("CocSymbolNull",      s:red,         "",        "")
call s:hi("CocSymbolEnumMember",s:pale_blue,   "",        "")
call s:hi("CocSymbolStruct",    s:yellow,      "",        "")
call s:hi("CocSymbolEvent",     s:predawn,     "",        "")
call s:hi("CocSymbolOperator",  s:white,       "",        "")
call s:hi("CocSymbolTypeParameter", s:pale_yellow, "",    "")
call s:hi("CocSymbolDefault",   s:white,       "",        "")

" ============================================================================
" Language-specific
" ============================================================================

" HTML
call s:hi("htmlTag",            s:blue,        "",        "")
call s:hi("htmlEndTag",         s:blue,        "",        "")
call s:hi("htmlTagName",        s:green,       "",        "")
call s:hi("htmlArg",            s:yellow,      "",        "italic")
call s:hi("htmlSpecialChar",    s:orange,      "",        "")

" CSS
call s:hi("cssClassName",       s:green,       "",        "")
call s:hi("cssClassNameDot",    s:green,       "",        "")
call s:hi("cssIdentifier",      s:orange,      "",        "")
call s:hi("cssProp",            s:blue,        "",        "italic")
call s:hi("cssAttr",            s:yellow,      "",        "")
call s:hi("cssColor",           s:yellow,      "",        "")
call s:hi("cssTagName",         s:yellow,      "",        "")

" JavaScript
call s:hi("javaScriptFunction", s:yellow,      "",        "italic")
call s:hi("javaScriptBraces",   s:white,       "",        "")
call s:hi("javaScriptNumber",   s:yellow,      "",        "")

" TypeScript
call s:hi("typescriptBraces",   s:white,       "",        "")
call s:hi("typescriptImport",   s:orange,      "",        "")
call s:hi("typescriptExport",   s:orange,      "",        "")

" JSON
call s:hi("jsonKeyword",        s:blue,        "",        "")
call s:hi("jsonString",         s:pale_blue,   "",        "")
call s:hi("jsonNumber",         s:yellow,      "",        "")
call s:hi("jsonBoolean",        s:green,       "",        "")
call s:hi("jsonNull",           s:red,         "",        "")

" Markdown
call s:hi("markdownH1",         s:predawn,     "",        "bold")
call s:hi("markdownH2",         s:orange,      "",        "bold")
call s:hi("markdownH3",         s:yellow,      "",        "bold")
call s:hi("markdownH4",         s:green,       "",        "bold")
call s:hi("markdownCode",       s:pale_blue,   s:grey7,   "")
call s:hi("markdownCodeBlock",  s:pale_blue,   "",        "")
call s:hi("markdownUrl",        s:blue,        "",        "underline")
call s:hi("markdownLink",       s:blue,        "",        "")
call s:hi("markdownLinkText",   s:green,       "",        "")

" ============================================================================
" Python
" ============================================================================

" Basic syntax
call s:hi("pythonStatement",     s:orange,      "",        "")
call s:hi("pythonKeyword",       s:orange,      "",        "")
call s:hi("pythonRepeat",        s:yellow,      "",        "italic")
call s:hi("pythonConditional",   s:yellow,      "",        "italic")
call s:hi("pythonException",     s:red,         "",        "")
call s:hi("pythonInclude",       s:orange,      "",        "")
call s:hi("pythonImport",        s:orange,      "",        "")
call s:hi("pythonAsync",         s:orange,      "",        "italic")
call s:hi("pythonOperator",      s:orange,      "",        "")

" Functions and classes
call s:hi("pythonFunction",      s:blue,        "",        "")
call s:hi("pythonBuiltinFunc",   s:blue,        "",        "italic")
call s:hi("pythonClass",         s:yellow,      "",        "")
call s:hi("pythonDecorator",     s:predawn,     "",        "")
call s:hi("pythonDecoratorName", s:predawn,     "",        "italic")
call s:hi("pythonDottedName",    s:predawn,     "",        "")

" Variables and parameters
call s:hi("pythonSelf",          s:orange,      "",        "italic")
call s:hi("pythonCls",           s:orange,      "",        "italic")
call s:hi("pythonParam",         s:orange,      "",        "")
call s:hi("pythonClassVar",      s:white,       "",        "")

" Types and constants
call s:hi("pythonBuiltin",       s:blue,        "",        "italic")
call s:hi("pythonBuiltinObj",    s:yellow,      "",        "")
call s:hi("pythonBuiltinType",   s:yellow,      "",        "italic")
call s:hi("pythonNone",          s:red,         "",        "italic")
call s:hi("pythonBoolean",       s:green,       "",        "")
call s:hi("pythonNumber",        s:yellow,      "",        "")
call s:hi("pythonFloat",         s:yellow,      "",        "")

" Strings
call s:hi("pythonString",        s:pale_blue,   "",        "")
call s:hi("pythonRawString",     s:pale_blue,   "",        "")
call s:hi("pythonQuotes",        s:pale_blue,   "",        "")
call s:hi("pythonTripleQuotes",  s:pale_blue,   "",        "")
call s:hi("pythonFString",       s:pale_blue,   "",        "")
call s:hi("pythonStrFormat",     s:predawn,     "",        "")
call s:hi("pythonStrFormatting", s:predawn,     "",        "")
call s:hi("pythonStrInterpRegion", s:predawn,   "",        "")
call s:hi("pythonBytes",         s:pale_green,  "",        "")
call s:hi("pythonBytesContent",  s:pale_green,  "",        "")
call s:hi("pythonBytesEscape",   s:predawn,     "",        "")
call s:hi("pythonUniEscape",     s:predawn,     "",        "")
call s:hi("pythonUniEscapeError",s:red,         "",        "")
call s:hi("pythonDocstring",     s:grey2,       "",        "italic")

" Comments
call s:hi("pythonComment",       s:grey2,       "",        "italic")
call s:hi("pythonTodo",          s:predawn,     s:grey5,   "bold")

" Errors
call s:hi("pythonError",         s:red,         "",        "")
call s:hi("pythonIndentError",   s:red,         s:maroon,  "")
call s:hi("pythonSpaceError",    "",            s:maroon,  "")

" ============================================================================
" Python Semantic Tokens (CoC/LSP - Pyright, Pylsp, etc.)
" ============================================================================

call s:hi("CocSemTypeClass",           s:yellow,      "",  "")
call s:hi("CocSemTypeFunction",        s:blue,        "",  "")
call s:hi("CocSemTypeMethod",          s:blue,        "",  "")
call s:hi("CocSemTypeParameter",       s:orange,      "",  "italic")
call s:hi("CocSemTypeVariable",        s:white,       "",  "")
call s:hi("CocSemTypeProperty",        s:blue,        "",  "")
call s:hi("CocSemTypeBuiltinConstant", s:yellow,      "",  "italic")
call s:hi("CocSemTypeSelfParameter",   s:orange,      "",  "italic")
call s:hi("CocSemTypeClsParameter",    s:orange,      "",  "italic")

" Pyright specific semantic tokens
call s:hi("CocSemClass",               s:yellow,      "",  "")
call s:hi("CocSemFunction",            s:blue,        "",  "")
call s:hi("CocSemMethod",              s:blue,        "",  "")
call s:hi("CocSemParameter",           s:orange,      "",  "italic")
call s:hi("CocSemVariable",            s:white,       "",  "")
call s:hi("CocSemProperty",            s:blue,        "",  "")
call s:hi("CocSemModule",              s:orange,      "",  "")
call s:hi("CocSemBuiltinConstant",     s:yellow,      "",  "italic")
call s:hi("CocSemTypeAlias",           s:yellow,      "",  "italic")
call s:hi("CocSemTypeParameter",       s:pale_yellow, "",  "italic")

" Modifier combinations
call s:hi("CocSemVariableReadonly",        s:yellow,      "",  "")
call s:hi("CocSemVariableDefaultLibrary",  s:blue,        "",  "italic")
call s:hi("CocSemFunctionDefaultLibrary",  s:blue,        "",  "italic")
call s:hi("CocSemClassDefaultLibrary",     s:yellow,      "",  "italic")
call s:hi("CocSemFunctionDefinition",      s:blue,        "",  "bold")
call s:hi("CocSemClassDefinition",         s:yellow,      "",  "bold")
call s:hi("CocSemMethodDefinition",        s:blue,        "",  "bold")
call s:hi("CocSemParameterDefinition",     s:orange,      "",  "italic")
call s:hi("CocSemVariableDefinition",      s:white,       "",  "")

" ============================================================================
" python-syntax plugin (if using vim-python/python-syntax)
" ============================================================================

call s:hi("pythonFunctionCall",  s:blue,        "",        "")
call s:hi("pythonBuiltinFunc",   s:blue,        "",        "italic")
call s:hi("pythonBuiltinObj",    s:yellow,      "",        "")
call s:hi("pythonDottedName",    s:predawn,     "",        "")
call s:hi("pythonLambdaExpr",    s:orange,      "",        "")
call s:hi("pythonExClass",       s:red,         "",        "")
call s:hi("pythonClassDef",      s:yellow,      "",        "bold")
call s:hi("pythonFuncDef",       s:blue,        "",        "bold")

" ============================================================================
" semshi plugin (if using numirias/semshi for Neovim)
" ============================================================================

call s:hi("semshiLocal",           s:white,       "",        "")
call s:hi("semshiGlobal",          s:orange,      "",        "")
call s:hi("semshiImported",        s:blue,        "",        "")
call s:hi("semshiParameter",       s:orange,      "",        "italic")
call s:hi("semshiParameterUnused", s:grey2,       "",        "italic")
call s:hi("semshiFree",            s:predawn,     "",        "")
call s:hi("semshiBuiltin",         s:blue,        "",        "italic")
call s:hi("semshiAttribute",       s:blue,        "",        "")
call s:hi("semshiSelf",            s:orange,      "",        "italic")
call s:hi("semshiUnresolved",      s:red,         "",        "underline")
call s:hi("semshiSelected",        "",            s:grey3,   "")
call s:hi("semshiErrorSign",       s:red,         s:grey5,   "")
call s:hi("semshiErrorChar",       s:red,         s:grey5,   "")

" ============================================================================
" Type hints (PEP 484/526)
" ============================================================================

call s:hi("pythonTypeAnno",      s:yellow,      "",        "italic")
call s:hi("pythonTypeHint",      s:yellow,      "",        "italic")
call s:hi("pythonTypeVar",       s:pale_yellow, "",        "italic")
call s:hi("pythonGeneric",       s:yellow,      "",        "")
call s:hi("pythonTypeDef",       s:yellow,      "",        "italic")

" ============================================================================
" Match statements (Python 3.10+)
" ============================================================================

call s:hi("pythonMatch",         s:orange,      "",        "")
call s:hi("pythonCase",          s:orange,      "",        "")
call s:hi("pythonMatchOr",       s:orange,      "",        "")
call s:hi("pythonMatchAs",       s:orange,      "",        "italic")
call s:hi("pythonMatchStar",     s:predawn,     "",        "")

" ============================================================================
" Walrus operator and other Python 3.8+ features
" ============================================================================

call s:hi("pythonWalrus",        s:orange,      "",        "")
call s:hi("pythonPositional",    s:orange,      "",        "")
call s:hi("pythonKeywordOnly",   s:orange,      "",        "")

" Terminal colors (Neovim)
if has('nvim')
    let g:terminal_color_0  = s:black
    let g:terminal_color_1  = s:red
    let g:terminal_color_2  = s:green
    let g:terminal_color_3  = s:yellow
    let g:terminal_color_4  = s:blue
    let g:terminal_color_5  = s:dark_red
    let g:terminal_color_6  = s:slate
    let g:terminal_color_7  = s:grey1
    let g:terminal_color_8  = s:grey3
    let g:terminal_color_9  = s:predawn
    let g:terminal_color_10 = s:pale_green
    let g:terminal_color_11 = s:pale_yellow
    let g:terminal_color_12 = s:pale_blue
    let g:terminal_color_13 = s:maroon
    let g:terminal_color_14 = s:dark_green
    let g:terminal_color_15 = s:white
endif
