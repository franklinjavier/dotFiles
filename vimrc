" this must be first, because it changes other options as a side effect!!
set nocompatible

" when started as "evim", evim.vim will already have done these settings
if v:progname =~? "evim"
  finish
endif

" in many terminal emulators the mouse works just fine thus enable it
if has('mouse')
  set mouse=a
endif

" hides the buffer instead of closing the files
set hidden

" wrap lines
set nowrap

" set tab to be 4 spaces
set tabstop=4

" allow backspace over everything in edit mode
set backspace=indent,eol,start

" set auto indent
set autoindent

" set smart indent
set si

" copy the previous indentation
set copyindent

" set 4 space for autoindenting
set shiftwidth=4

" set multiples of shiftwidth when indenting with '<'
set shiftround

" show the matching symbols
set showmatch

" ignore case when searching
set ignorecase

" use case sensitive when the terms are not all in smallcase
set smartcase

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" remember more commands
set history=1000

" levels of undo command
set undolevels=1000

" Limits syntax column
set synmaxcol=500

" Change the terminal title
set title

" turn off error beeping
set noeb vb t_vb=

" turn off flashing
au GUIEnter * set vb t_vb=

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" set 4 lines on the edge of the screen
set scrolloff=4

" let the cursor go anywhere
set virtualedit=all

" no backup file :D
set nobackup
set noswapfile

" no underline html links
hi link htmlLink NONE

" Set the identation on
filetype indent on

" highlight the syntax
syntax on

" set color scheme
colorscheme candyman
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif

"set background=dark
"set term=xterm-256color
" set the default gui font to Inconsolata
set guifont=Monaco:h12

" disable the toolbar
set guioptions-=T

" disable the menu
set guioptions-=m

" disable the scrollbar
set guioptions+=LlRrb
set guioptions-=LlRrb

" set the tab space to 4
set ts=4

" convert tab to spaces
set expandtab

" set number
set number

" change leader to a comma because the backslash is too far away
"   that means all \x commands turn into ,x
"   the mapleader has to be set before vundle starts loading all
"   the plugins.
let mapleader=","

" remember info about open buffers on close
set viminfo^=%

" encoding for the terminal
set termencoding=utf-8

" set the encoding
set encoding=utf-8

" don't update the display while executing macros
set lazyredraw

" tell VIM to always put a status line in, even
" if there is only one window
set laststatus=2

" make tab completion for files/buffers act like bash
set wildmenu

" show a list when pressing tab and complete
set wildmode=list:full

" enable filetype plugins
filetype plugin on

" turn off highlighting
:nohl

" autocomplete funcs and identifiers for languages
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

au BufNewFile,BufRead,BufReadPost *.jade set filetype=jade
"au! BufRead,BufNewFile *.vm  setfiletype velocity

" force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts, alias, etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't use Ex mode, use Q for formatting
map Q gq

" ,[wx] fast saving and close
nmap <leader>w :w!<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
nmap <leader>x :x<cr>

" navigating over split
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" activate the Zencoding
imap <C-z> <Esc><C-y>,a

" activate Nerd Commenter
map <C-c> <leader>ci

" avoid accidental hits of <F1> while aiming for <Esc>
map <F1> <Esc>

" ctrl + k  moving selection to up
xmap <c-k> :mo'<-- <cr> gv

" ctrl + j  moving selection to down
xmap <c-j> :mo'>+ <cr> gv

" tab   indents selection
vmap <silent> <Tab> >gv
vmap <silent> <S-Tab> <gv

" ,p    past from clipboard system
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" ,cd   switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" ,ev   easy access to the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" ,rv   reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" ,r    when you press <leader>r you can search and 
"       replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" ,m    remove the ^M (from windows) 
"       when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" ,[hv] split horizontal or vertical
noremap <leader>h :split<CR>
noremap <leader>v :vsplit<CR>

" git
noremap <leader>ga :!git add .<CR>
noremap <leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <leader>gsh :!git push<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>

" ,e    edit command with the current path
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" copy, paste, cut
noremap YY "+y<CR>
noremap P "+gP<CR>

" ,q    alias to close
map <leader>q :q<cr>

" double esc    clear the search highlight in Normal mode
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" ,f    really fast search in current directory for matches with current word
map <leader>f :execute "Ag " . expand("<cword>") <Bar> cw<CR>

" ,s    alias to :%s//
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>

" ,ts   fix trailing white space
map <leader>ts :%s/\s\+$//e<CR>

" ,bb   show buffers
nmap <leader>bb :ls<cr>:b

" ,bp   go to prev buffer
nmap <leader>bp :bp<cr>

" ,tab  go to next buffer
nmap <leader><tab> :bn<cr>

" ,a    select all
map <leader>a <esc>ggVG
imap <leader>a <esc>ggVG
map <C-a> <esc>ggVG

" ,n   edit another file in the same directory with the current one
map <leader>n :vnew <C-R>=expand("%:p:h") . '/'<CR>

" bind :Q to :q
command! Q q

" ,<space>  open ctrl+p plugin
nnoremap <leader><space> :CtrlP<Cr>

" ,d    Duplicate line
map <leader>d <esc>yyp

" ,N    rename the current file
map <leader>N :call RenameFile()<cr>

" tab completion when entering filenames
set wildmode=list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.DS_Store,*.jpg,
  \*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd

" K to split
" basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
" becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" sspecially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
nnoremap K <nop>
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" manager plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-haml'
Bundle 'moll/vim-node'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'leshill/vim-json'
Bundle 'briancollins/vim-jst'
Bundle 'scrooloose/nerdtree'
Bundle 'albfan/nerdtree-git-plugin'
Bundle 'mutewinter/nginx.vim'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'ctrlp.vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'StanAngeloff/php.vim'
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'mattn/emmet-vim'
Bundle 'miripiruni/CSScomb-for-Vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle '1995eaton/vim-better-css-completion'
Bundle 'lepture/vim-velocity'
Bundle 'pangloss/vim-javascript'
Bundle 'fatih/vim-go'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'itchyny/calendar.vim'
Bundle 'itchyny/vim-autoft'
Bundle 'itchyny/vim-cursorword'
Bundle 'itchyny/screensaver.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'amix/vim-zenroom2'
Bundle 'itchyny/lightline.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'wavded/vim-stylus'
Bundle 'OrangeT/vim-csharp'
Bundle 'isRuslan/vim-es6'
Bundle 'mxw/vim-jsx'
Bundle 'jscappini/material.vim'

" JSX syntax highlighting in .js files
let g:jsx_ext_required = 0

" syntax highlighting for nginx.conf and related config files.
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" vim Markdown runtime files
au BufNewFile,BufReadPost *.md set filetype=markdown

" Gist
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" NERDTree, Use F3 for toggle NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>

" EasyAlign
vnoremap <silent> <Enter> :EasyAlign<cr>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ""
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|build|dist|build|target|draft'
    \ }


" JavaScript Syntax
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    let b:javascript_fold=0
    set foldclose=all

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" up-to-date PHP syntax file (5.3, 5.4 & 5.5 support; basic 5.6 support)
au FileType php set omnifunc=phpcomplete#CompletePHP
" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
au FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
au FileType php let php_htmlInStrings=1
" no short tags
au FileType php let php_noShortTags=1
" automagically folds functions & methods. this is getting IDE-like isn't it?
au FileType php let php_folding=0
" set multiple filetypes to the php files
au Filetype php set ft=php.html
" set "make" command when editing php files
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" fork of the python.vim by Dmitry Vasiliev and Neil Schemenauer for 2.x and 3.x.
autocmd FileType python set omnifunc=pythoncomplete#Complete

" simulate emmet in vim
nnoremap <C-z> :call emmet#expandAbbr(0,"")<CR>a
inoremap <C-z> <ESC>:call emmet#expandAbbr(0,"")<CR>a

" CSS/SASS/SCSS/Stylus
au FileType css set omnifunc=csscomplete#CompleteCSS
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufEnter *.scss :syntax sync fromstart
au BufRead,BufNewFile *.styl set filetype=stylus

" velocity syntax
"au! BufRead,BufNewFile *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity
au! BufRead,BufNewFile *.html,*.htm,*.shtml,*.stm,*.tpl,*.cshtml set filetype=html
au! BufRead,BufNewFile *.vm,*.tpl set filetype=vm
au! BufRead,BufNewFile *.html set filetype=jinja

" calendar - For Power Users
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" vim-autoft
let g:autoft_config = [
          \ { 'filetype': 'html' , 'pattern': '<\%(!DOCTYPE\|html\|head\|script\)' },
          \ { 'filetype': 'c'    , 'pattern': '^\s*#\s*\%(include\|define\)\>' },
          \ { 'filetype': 'diff' , 'pattern': '^diff -' },
          \ { 'filetype': 'sh'   , 'pattern': '^#!.*\%(\<sh\>\|\<bash\>\)\s*$' },
          \ ]

" enable vim zen
nnoremap <silent> <leader>z :Goyo<cr>

" vim lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }


" vim scala
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(controllers\|views\|models\|util\|de.\)'
au BufNewFile,BufRead,BufReadPost *.scala.html set filetype=scala

" Vim mustache / handlebars
let g:mustache_abbreviations = 1
au! BufRead,BufNewFile *.hbs,*.hbt,*.html,*.tpl set filetype=html.mustache syntax=mustache

" Ag - like ack, but faster
let g:agprg="/home/franklin/ --column"


" identify dot files
au! BufRead,BufNewFile *.eslintrc,*.babelrc,*.jscsrc,*.csslintrc set filetype=json


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


Bundle 'Glench/Vim-Jinja2-Syntax'

