" Vim syntax file
" Language:     Velocity Template Language
" Maintainer:   Sergey Markelov <s.a.markelov@gmail.com>
" Last Change:  28 December 2011 - 07:25:18
" License:      GPL-3.0 (http://www.gnu.org/licenses/gpl-3.0.txt)
" Description:  For user guide refer to http://velocity.apache.org/engine/devel/user-guide.html

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syn cluster vtlErrors           contains=vtlBreakError,vtlEndError,vtlElseError,vtlElseIfError,@vtlRegionErrors
syn cluster vtlRegionEntities   contains=vtlEscapeSequence,@vtlReference,@vtlDirective,@vtlBreak,@vtlComments,vtlNonParsable,@vtlErrors

" meta cluster describing the whole Velocity Template Language
" contains only top-level items, because other items will be implied
syn cluster VTL                 contains=@vtlErrors,@vtlKeywords,@vtlRegionEntities


" --------------------------------------------------------------
" @section Keywords
" --------------------------------------------------------------
" A bunch of useful VTL keywords
syn keyword vtlTodo             contained TODO FIXME XXX
syn keyword vtlBoolean          contained true false

" vtlCommentGroup allows adding matches for special things in comments
syn cluster vtlCommentGroup     contains=vtlTodo

" @description
" @c vtlDoxygenCommentGroup exists here for the possibility of the future add of
" doxygen support. Simply add @Doxygen cluster to this group.
" According to the specification, Doxygen should take in place between
" comments
" #**
"  *
"  * \@description this will be a Doxygen comment
"  *
"  *#
syn cluster vtlDoxygenCommentGroup contains=NONE

" --------------------------------------------------------------
" @section References
" --------------------------------------------------------------
syn cluster vtlReference        contains=vtlRef,vtlVariable

" according to the specification to render NULL '!' needs to be placed before
" the reference
syn match   vtlNullVariable     /!/ display contained

" shorthand notation
syn match   vtlVariable         /\$!\?[a-zA-Z][a-zA-Z0-9\-_]*/ display contains=vtlNullVariable nextgroup=vtlRefDot,vtlRefMethod,vtlRefArray skipwhite skipempty
syn match   vtlRefDot           /\./ display transparent contained nextgroup=vtlRefPartName skipwhite skipempty
syn match   vtlRefPartName      /[a-zA-Z][a-zA-Z0-9\-_]*/ display contained nextgroup=vtlRefDot,vtlRefMethod,vtlRefArray skipwhite skipempty
syn region  vtlRefMethod        matchgroup=vtlMethodStart start=/(/ end=/)/ contained contains=@vtlArgs nextgroup=vtlRefDot skipwhite skipempty
syn region  vtlRefArray         matchgroup=vtlArrayStart start=/\[/ end=/\]/ contained contains=@vtlArgs nextgroup=vtlRefDot skipwhite skipempty

" longhand notation
syn region  vtlRef              start=/\$!\?{[a-zA-Z][a-zA-Z0-9\-_]*/ matchgroup=vtlRefParts end=/}/ contains=vtlRefArray,vtlRefMethod,vtlRefDot,vtlRefParts,vtlRefError
syn match   vtlRefError         /\$/ contained display
syn match   vtlRefParts         /\$!\?{[a-zA-Z][a-zA-Z0-9\-_]*/ display contained contains=vtlNullVariable


" --------------------------------------------------------------
" @section Directives
" --------------------------------------------------------------
syn cluster vtlDirective        contains=vtlDSet,vtlDInclude,vtlDParse,vtlDEvaluate,vtlDStop,vtlKStop,vtlDIf,vtlDForeach,vtlDDefine,@vtlDMacros

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" @subsubsection Velocimacros
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" macro
syn cluster vtlDMacros          contains=vtlDMacro,@vtlDUMacros

" user-defined macros
" @note better to highlight differently

syn cluster vtlDUMacros         contains=vtlDUMacro,vtlDUMacroL

syn region  vtlDUMacroExpr      matchgroup=vtlDUMacroExprStart start=/#@[a-zA-Z][a-zA-Z0-9\-_]*\s*(/ end=/)/ contained contains=@vtlArgs
syn region  vtlDUMacroExpr      matchgroup=vtlDUMacroExprStart start=/#@{[a-zA-Z][a-zA-Z0-9\-_]*\s*(/ end=/)}/ contained contains=@vtlArgs
syn region  vtlDUMacro          start=/#@{\?[a-zA-Z][a-zA-Z0-9\-_]*\s*(/ matchgroup=vtlDUMacroExprStart end=/#end\>/ end=/#{end}/ transparent contains=vtlDUMacroExpr,@vtlRegionEntities fold

" one line user-defined macro
syn region  vtlDUMacroL         matchgroup=vtlDUMacroLStart start=/#[a-zA-Z][a-zA-Z0-9\-_]*\s*(/ end=/)/ contains=@vtlArgs
syn region  vtlDUMacroL         matchgroup=vtlDUMacroLStart start=/#{[a-zA-Z][a-zA-Z0-9\-_]*\s*(/ end=/)}/ contains=@vtlArgs

" system macro directive
syn region  vtlDMacroExpr       matchgroup=vtlDMacroExprStart start=/#macro\s*(/ end=/)/ contained contains=@vtlArgs
syn region  vtlDMacroExpr       matchgroup=vtlDMacroExprStart start=/#{macro\s*(/ end=/)}/ contained contains=@vtlArgs
syn region  vtlDMacro           start=/#{\?macro\s*(/ matchgroup=vtlDMacroExprStart end=/#end\>/ end=/#{end}/ transparent contains=vtlDMacroExpr,@vtlRegionEntities fold


" --------------------------------------------------------------
" @section Common
" --------------------------------------------------------------
" include
syn region  vtlDInclude         matchgroup=vtlDIncludeStart start=/#include\s*(/ end=/)/ contains=@vtlArgs
syn region  vtlDInclude         matchgroup=vtlDIncludeStart start=/#{include\s*(/ end=/)}/ contains=@vtlArgs

" parse
syn region  vtlDParse           matchgroup=vtlDParseStart start=/#parse\s*(/ end=/)/ contains=@vtlArgs
syn region  vtlDParse           matchgroup=vtlDParseStart start=/#{parse\s*(/ end=/)}/ contains=@vtlArgs

" evaluate
syn region  vtlDEvaluate        matchgroup=vtlDEvaluateStart start=/#evaluate\s*(/ end=/)/ contains=@vtlArgs
syn region  vtlDEvaluate        matchgroup=vtlDEvaluateStart start=/#{evaluate\s*(/ end=/)}/ contains=@vtlArgs

" set
syn region  vtlDSet             matchgroup=vtlDSetStart start=/#set\s*(/ end=/)/ contains=@vtlArgs
syn region  vtlDSet             matchgroup=vtlDSetStart start=/#{set\s*(/ end=/)}/ contains=@vtlArgs


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" @subsection  Regions
" @note
"   in case of a complex region like
"   @code
"     syn region  vtlDForeachExpr     matchgroup=vtlDForeachExprStart start=/#foreach\s*(/ end=/)/ contained contains=vtlDForeachKeywords,@vtlArgs
"     syn region  vtlDForeachExpr     matchgroup=vtlDForeachExprStart start=/#{foreach\s*(/ end=/)}/ contained contains=vtlDForeachKeywords,@vtlArgs
"     syn region  vtlDForeach         start=/#{\?foreach\>/ matchgroup=vtlDForeachExprStart end=/#end\>/ end=/#{end}/ transparent contains=vtlDForeachExpr,vtlRefForeachKeywords,@vtlReference,@vtlDirective,@vtlComments,vtlNonParsable fold
"   @endcode
"
"   where @c #foreach might be nested inside another one @c #foreach, plus
"   @c #foreach region ends with @c #end keyword and another one nested region
"   starts at the same point with @c #foreach keyword, that nested smaller
"   region should come first, then a parent @c #foreach region should come.
"   If it has @c matchgroup=something, that should come after @c start=,
"   otherwise starting point won't be matched in a smaller nested region
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syn match   vtlEndError         display "#end\>"
syn match   vtlEndError         display "#{end}"

" if / elseif / else
syn cluster vtlConditionalError contains=vtlElseError,vtlElseIfError
syn match   vtlElseError        display "#else\>"
syn match   vtlElseError        display "#{else}"
syn match   vtlElseIfError      display "#elseif\>"
syn match   vtlElseIfError      display "#{elseif}"

syn region  vtlDIfExpr          matchgroup=vtlDIfExprStart start=/#if\s*(/ end=/)/ contained contains=vtlLogical,@vtlArgs
syn region  vtlDIfExpr          matchgroup=vtlDIfExprStart start=/#{if\s*(/ end=/)}/ contained contains=vtlLogical,@vtlArgs
syn region  vtlDIf              start=/#{\?if\s*(/ matchgroup=vtlDIfExprStart end=/#end\>/ end=/#{end}/ transparent contains=vtlDIfExpr,vtlDElseIfExpr,vtlDElse,@vtlRegionEntities fold
syn region  vtlDElseIfExpr      matchgroup=vtlDElseIfExprStart start=/#elseif\s*(/ end=/)/ contained contains=vtlLogical,@vtlArgs
syn region  vtlDElseIfExpr      matchgroup=vtlDElseIfExprStart start=/#{elseif\s*(/ end=/)}/ contained contains=vtlLogical,@vtlArgs
syn match   vtlDElse            /#else\>/ contained display
syn match   vtlDElse            /#{else}/ contained display

" foreach
" @note
"   @c #foreach directive can contain special reference inside
"   which is accessed by @c $foreach...
"   syntax:
"     $foreach[[.parent.parent...][.topmost]].vtlRefForeachKeywords
syn keyword vtlDForeachKeywords contained in
syn keyword vtlRefForeachKeywords contained hasNext index count first last
syn keyword vtlRefForeachKeywordParent nextgroup=vtlRefForeachDotParent contained parent
syn keyword vtlRefForeachKeywordTopmost nextgroup=vtlRefForeachDotTopmost contained topmost

syn match   vtlRefChar          /\$/ contained
syn match   vtlRefForeach       /\$foreach/ nextgroup=vtlRefForeachDot contained contains=vtlRefChar
syn match   vtlRefForeachDot    /\./ display transparent contained nextgroup=vtlRefForeachKeywordTopmost,vtlRefForeachKeywordParent,vtlRefForeachKeywords skipwhite skipempty
syn match   vtlRefForeachDotParent /\./ display transparent contained nextgroup=vtlRefForeachKeywordTopmost,vtlRefForeachKeywordParent,vtlRefForeachKeywords skipwhite skipempty
syn match   vtlRefForeachDotTopmost /\./ display transparent contained nextgroup=vtlRefForeachKeywords skipwhite skipempty

syn region  vtlDForeachExpr     matchgroup=vtlDForeachExprStart start=/#foreach\s*(/ end=/)/ contained contains=vtlDForeachKeywords,@vtlArgs
syn region  vtlDForeachExpr     matchgroup=vtlDForeachExprStart start=/#{foreach\s*(/ end=/)}/ contained contains=vtlDForeachKeywords,@vtlArgs
syn region  vtlDForeach         start=/#{\?foreach\s*(/ matchgroup=vtlDForeachExprStart end=/#end\>/ end=/#{end}/ transparent contains=vtlDForeachExpr,vtlRefForeach,@vtlRegionEntities fold

" define
syn region  vtlDDefineExpr      matchgroup=vtlDDefineExprStart start=/#define\s*(/ end=/)/ contained contains=@vtlArgs
syn region  vtlDDefineExpr      matchgroup=vtlDDefineExprStart start=/#{define\s*(/ end=/)}/ contained contains=@vtlArgs
syn region  vtlDDefine          start=/#{\?define\s*(/ matchgroup=vtlDDefineExprStart end=/#end\>/ end=/#{end}/ transparent contains=vtlDDefineExpr,@vtlRegionEntities fold


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" @subsection  RegionsCommon
" @description applicable to all (or a number of) regions (i.e. if, foreach, etc.)
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" break
syn cluster vtlBreak            contains=vtlDBreak,vtlKBreak

syn match   vtlBreakError       display "#break\>"
syn match   vtlBreakError       display "#{break}"

syn match   vtlKBreak           /#break\>/ contained display
syn match   vtlKBreak           /#{break}/ contained display
syn region  vtlDBreak           matchgroup=vtlDBreakStart start=/#break\s*(/ end=/)/ contained contains=@vtlArgs
syn region  vtlDBreak           matchgroup=vtlDBreakStart start=/#{break\s*(/ end=/)}/ contained contains=@vtlArgs

" stop
syn cluster vtlStop             contains=vtlDStop,vtlKStop

syn match   vtlKStop            /#stop\>/ display
syn match   vtlKStop            /#{stop}/ display
syn region  vtlDStop            matchgroup=vtlDStopStart start=/#stop\s*(/ end=/)/ contains=@vtlArgs
syn region  vtlDStop            matchgroup=vtlDStopStart start=/#{stop\s*(/ end=/)}/ contains=@vtlArgs


" --------------------------------------------------------------
" @section Numeric
" --------------------------------------------------------------
syn cluster vtlNumeric          contains=vtlNumber,vtlFloat

syn match   vtlNumber           /\-\?\d/ display contained
syn match   vtlFloat            display contained "\-\?\d\+\.\d*\(e[-+]\=\d\+\)\="
" floating point number, starting with a dot, optional exponent
syn match   vtlFloat            display contained "\-\?\.\d\+\(e[-+]\=\d\+\)\="
" floating point number, without dot, with exponent
syn match   vtlFloat            display contained "\-\?\d\+e[-+]\=\d\+"

" --------------------------------------------------------------
" @section Paranthesis
" --------------------------------------------------------------
syn cluster vtlArgs             contains=vtlEscapeSequence,vtlString,@vtlNumeric,vtlBoolean,vtlArray,@vtlReference,vtlDUMacroL,@vtlComments,vtlNonParsable,@vtlErrors

syn region  vtlArray            matchgroup=vtlArrayStart start=/\[/ end=/\]/ contained contains=@vtlArgs

" --------------------------------------------------------------
" @section Misc.
" --------------------------------------------------------------
syn match   vtlLogical          /\(&&\|||\|!\)/ display contained

syn cluster vtlRegionErrors     contains=vtlNonParsableError,vtlCommentError

" Non parsable
syn region  vtlNonParsable      matchgroup=vtlNonParsableStart start=/#\[\[/ end=/\]\]#/ fold extend
syn match   vtlNonParsableError /\]\]#/ display

" String and Character constants
" Highlight special characters (those which have a backslash) differently
" double quoted string can contain variables
syn region  vtlString           start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=vtlEscapeSequence,@vtlDirective,@vtlReference,@Spell contained

" Single quoted string processes as is, thus can not contain variables
syn region  vtlString           start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@Spell contained

" --------------------------------------------------------------
" @section Comments
" --------------------------------------------------------------

syn cluster vtlComments         contains=vtlComment,vtlCommentL,vtlDoxygenComment

syn region  vtlComment          start="#\*" end="\*#" contains=vtlEscapeSequence,vtlDInclude,@vtlCommentGroup,@Spell fold extend
syn region  vtlDoxygenComment   start="#\*\*" end="\*#" contains=vtlEscapeSequence,vtlDInclude,@vtlCommentGroup,@vtlDoxygenCommentGroup,@Spell fold extend
syn region  vtlCommentL         start="##" end="$" keepend contains=vtlEscapeSequence,vtlDInclude,@vtlCommentGroup,@Spell display oneline
syn match   vtlCommentError     display "\*#"


" prevent from further matching of a @vltReference or a @vtlDirective if we encounter an escape sequence
syn match   vtlEscapeSequence   /\\[\$#]/ display

" --------------------------------------------------------------
" @section Highlighting
" --------------------------------------------------------------
hi def link vtlNumber           Number
hi def link vtlFloat            Float
hi def link vtlCommentError     vtlHLError
hi def link vtlNonParsableError vtlHLError
hi def link vtlEndError         vtlHLError
hi def link vtlBreakError       vtlHLError
hi def link vtlElseError        vtlHLError
hi def link vtlElseIfError      vtlHLError
hi def link vtlRefError         vtlHLError
hi def link vtlHLError          Error
hi def link vtlComment          vtlHLComment
hi def link vtlDoxygenComment   vtlHLComment
hi def link vtlCommentStart     vtlHLComment
hi def link vtlCommentL         vtlHLComment
hi def link vtlHLComment        Comment
hi def link vtlNonParsable      Repeat
hi def link vtlNonParsableStart NonText
hi def link vtlString           String
hi def link vtlLogical          Operator
hi def link vtlArrayStart       vtlParanthesisStart
hi def link vtlMethodStart      vtlParanthesisStart
hi def link vtlParanthesisStart SpecialChar
hi def link vtlArray            vtlParanthesisInner
hi def link vtlRefArray         vtlParanthesisInner
hi def link vtlRefMethod        vtlParanthesisInner
hi def link vtlParanthesisInner Special
hi def link vtlDSet             vtlHLDirectiveInner
hi def link vtlDElseIfExpr      vtlHLDirectiveInner
hi def link vtlDIfExpr          vtlHLDirectiveInner
hi def link vtlDUMacroExpr      vtlHLDirectiveInner
hi def link vtlDUMacroL         vtlHLDirectiveInner
hi def link vtlDMacroExpr       vtlHLDirectiveInner
hi def link vtlDInclude         vtlHLDirectiveInner
hi def link vtlDParse           vtlHLDirectiveInner
hi def link vtlDEvaluate        vtlHLDirectiveInner
hi def link vtlDForeachExpr     vtlHLDirectiveInner
hi def link vtlDDefineExpr      vtlHLDirectiveInner
hi def link vtlDBreak           vtlHLDirectiveInner
hi def link vtlDStop            vtlHLDirectiveInner
hi def link vtlHLDirectiveInner Statement
hi def link vtlDSetStart        vtlHLDirectiveStart
hi def link vtlDIfExprStart     vtlHLDirectiveStart
hi def link vtlDElseIfExprStart vtlHLDirectiveStart
hi def link vtlDMacroExprStart  vtlHLDirectiveStart
hi def link vtlDIncludeStart    vtlHLDirectiveStart
hi def link vtlDParseStart      vtlHLDirectiveStart
hi def link vtlDEvaluateStart   vtlHLDirectiveStart
hi def link vtlDSetStart        vtlHLDirectiveStart
hi def link vtlDIfExprStart     vtlHLDirectiveStart
hi def link vtlDElseIfExprStart vtlHLDirectiveStart
hi def link vtlDElse            vtlHLDirectiveStart
hi def link vtlDForeachExprStart vtlHLDirectiveStart
hi def link vtlDDefineExprStart vtlHLDirectiveStart
hi def link vtlDBreakStart      vtlHLDirectiveStart
hi def link vtlKBreak           vtlHLDirectiveStart
hi def link vtlKStop            vtlHLDirectiveStart
hi def link vtlDStopStart       vtlHLDirectiveStart
hi def link vtlHLDirectiveStart Function
hi def link vtlDUMacroExprStart vtlHLUserMacro
hi def link vtlDUMacroLStart    vtlHLUserMacro
hi def link vtlHLUserMacro      Type
hi def link vtlRefForeach       vtlHLKeywords
hi def link vtlDForeachKeywords vtlHLKeywords
hi def link vtlRefForeachKeywords vtlHLKeywords
hi def link vtlRefForeachKeywordTopmost vtlHLKeywords
hi def link vtlRefForeachKeywordParent vtlHLKeywords
hi def link vtlHLKeywords       Keyword
hi def link vtlVariable         vtlHLVariable
hi def link vtlRefChar          vtlHLVariable
hi def link vtlRefParts         vtlHLVariable
hi def link vtlRefPartName      vtlHLVariable
hi def link vtlHLVariable       Identifier
hi def link vtlNullVariable     Conditional
hi def link vtlRef              Special
hi def link vtlTodo             Todo
hi def link vtlBoolean          Boolean

let b:current_syntax = "vtl"
