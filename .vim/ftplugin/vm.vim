" Vim filetype plugin file
" Language:     Velocity Template Language
" Maintainer:   Sergey Markelov <s.a.markelov@gmail.com>
" Last Change:  28 December 2011 - 06:16:08
" License:      GPL-3.0 (http://www.gnu.org/licenses/gpl-3.0.txt)
" Description:  For user guide refer to http://velocity.apache.org/engine/devel/user-guide.html

" --------------------------------------------------------------
" @section Settings
" --------------------------------------------------------------

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

" specify what is considered to be a comment
setlocal comments=s1:#*,mb:*,ex:*#,:##
setlocal commentstring=#*%s*#

setlocal formatoptions-=t formatoptions+=croql

" don't reset indentation after '#' character
"inoremap <buffer> # X#

" do the mapping for comments section
"inoremap <buffer> #* #*<CR><CR><BACKSPACE>#<UP><SPACE>

syn sync fromstart

" don't indent after any word
setlocal cinwords=

setlocal autoindent
setlocal smartindent

let &cpo = s:cpo_save
unlet s:cpo_save

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" @subsection MatchIt
" @description is used when @c matchit plugin is installed
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if exists("loaded_matchit")
    let b:match_ignorecase = 0
    " scip comments and strings when doing a match
    let b:match_skip = 's:comment\|string'
    " which keywords will be cycled if '%' is pressed
    let b:match_words = '#{\?\(if\|foreach\|define\|macro\|@[a-zA-Z][a-zA-Z0-9\-_]*\)\s*('.':'
                      \.'#\(else\>\|{else}\)'.':'
                      \.'#\(elseif\>\|{elseif}\)'.':'
                      \.'#\(end\>\|{end}\)'
endif

let b:undo_ftplugin = 'setlocal cinwords< comments< commentstring< formatoptions< |'
                    \.'iunmap <buffer> # |'
                    \.'unlet b:match_skip b:match_words b:match_ignorecase'

let b:did_ftplugin = 1
