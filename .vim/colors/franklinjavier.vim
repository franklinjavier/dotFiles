hi clear
syntax reset
let g:colors_name = "franklinjavier"
if &background == "light"
    hi Boolean gui=NONE guifg=#787878 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#f7f7f7
    hi Comment gui=NONE guifg=#a1a1a1 guibg=NONE
    hi Conceal gui=NONE guifg=#787878 guibg=NONE
    hi Conditional gui=NONE guifg=#4f4f4f guibg=NONE
    hi Constant gui=NONE guifg=#787878 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#f7f7f7
    hi CursorLine gui=NONE guifg=NONE guibg=#f7f7f7
    hi CursorLineNr gui=NONE guifg=#a1a1a1 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f7f7f7
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e8e8e8
    hi Directory gui=NONE guifg=#4f4f4f guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#fff0f0
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi FoldColumn gui=NONE guifg=#c7c7c7 guibg=NONE
    hi Folded gui=NONE guifg=#a1a1a1 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e8e8e8
    hi LineNr gui=NONE guifg=#c7c7c7 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#e8e8e8
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#c7c7c7 guibg=NONE
    hi Normal gui=NONE guifg=#000000 guibg=#ffffff
    hi Number gui=NONE guifg=#787878 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f7f7f7
    hi PmenuSbar gui=NONE guifg=NONE guibg=#f0f0f0
    hi PmenuSel gui=NONE guifg=NONE guibg=#e8e8e8
    hi PmenuThumb gui=NONE guifg=NONE guibg=#e0e0e0
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#f0f0f0
    hi SignColumn gui=NONE guifg=#c7c7c7 guibg=NONE
    hi Special gui=NONE guifg=#787878 guibg=NONE
    hi SpecialKey gui=NONE guifg=#c7c7c7 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#fff0f0
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#f0f0f0
    hi Statement gui=NONE guifg=#4f4f4f guibg=NONE
    hi StatusLine gui=NONE guifg=#292929 guibg=#f0f0f0
    hi StatusLineNC gui=NONE guifg=#a1a1a1 guibg=#f0f0f0
    hi StorageClass gui=NONE guifg=#4f4f4f guibg=NONE
    hi String gui=NONE guifg=#787878 guibg=NONE
    hi TabLine gui=NONE guifg=#a1a1a1 guibg=#f0f0f0
    hi TabLineFill gui=NONE guifg=NONE guibg=#f0f0f0
    hi TabLineSel gui=NONE guifg=#292929 guibg=#f0f0f0
    hi Title gui=NONE guifg=#787878 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#4f4f4f guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#e8e8e8 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e8e8e8
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d9d9d9
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
elseif &background == "dark"
    hi Boolean gui=NONE guifg=#559ef1 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#171717
    hi Comment gui=NONE guifg=#787878 guibg=NONE
    hi Conceal gui=NONE guifg=#878787 guibg=NONE
    hi Conditional gui=NONE guifg=#999999 guibg=NONE
    hi Constant gui=NONE guifg=#878787 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#171717
    hi CursorLine gui=NONE guifg=NONE guibg=#171717
    hi CursorLineNr gui=NONE guifg=#787878 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#082608
    hi DiffChange gui=NONE guifg=NONE guibg=#171717
    hi DiffDelete gui=NONE guifg=NONE guibg=#260808
    hi DiffText gui=NONE guifg=NONE guibg=#383838
    hi Directory gui=NONE guifg=#999999 guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#260808
    hi ErrorMsg gui=NONE guifg=NONE guibg=#260808
    hi FoldColumn gui=NONE guifg=#696969 guibg=NONE
    hi Folded gui=NONE guifg=#787878 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#383838
    hi LineNr gui=NONE guifg=#696969 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#383838
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#696969 guibg=NONE
    hi Normal gui=NONE guifg=#b5bab9 guibg=#1d2325
    hi Number gui=NONE guifg=#878787 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#171717
    hi PmenuSbar gui=NONE guifg=NONE guibg=#292929
    hi PmenuSel gui=NONE guifg=NONE guibg=#383838
    hi PmenuThumb gui=NONE guifg=NONE guibg=#474747
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#292929
    hi SignColumn gui=NONE guifg=#696969 guibg=NONE
    hi Special gui=NONE guifg=#6a71be guibg=NONE
    hi SpecialKey gui=NONE guifg=#696969 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#260808
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#082608
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#292929
    hi Statement gui=NONE guifg=#999999 guibg=NONE
    hi StatusLine gui=NONE guifg=#a8a8a8 guibg=#121212
    hi StatusLineNC gui=NONE guifg=#787878 guibg=#292929
    hi StorageClass gui=NONE guifg=#999999 guibg=NONE
    hi String gui=NONE guifg=#85b4c7 guibg=NONE
    hi TabLine gui=NONE guifg=#787878 guibg=#292929
    hi TabLineFill gui=NONE guifg=NONE guibg=#292929
    hi TabLineSel gui=NONE guifg=#a8a8a8 guibg=#292929
    hi Title gui=NONE guifg=#878787 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#999999 guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#383838 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#383838
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#260808
    hi WildMenu gui=NONE guifg=NONE guibg=#595959
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
endif
