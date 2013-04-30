" this must be first, because it changes other options as a side effect.
set nocompatible

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" hides the buffer instead of closing the files
set hidden
" dont wrap lines
set nowrap
" set tab to be 4 spaces
set tabstop=4
" allow backspace over everything in edit mode
set backspace=indent,eol,start
" set auto indent
set autoindent
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
" Change the terminal title
set title
" no sonds
set visualbell
set noerrorbells
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

" Set the identation on
filetype indent on

" highlight the syntax
syntax on
"set color scheme
colorscheme rdark
" set the default gui font to Monaco
"set guifont=Monaco\ 11
set guifont=Lucida\ Sans\ Typewriter\ 9
" disable the toolbar
set guioptions-=T
" disable the menu
set guioptions-=m
" set the tab space to 4
set ts=4
" convert tab to spaces
set expandtab
" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" no short tags
autocmd FileType php let php_noShortTags=1
" automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd FileType php let php_folding=1
" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Set multiple filetypes to the php files
autocmd Filetype php set ft=php.html

" In many terminal emulators the mouse works just fine, thus enable it.
" set "make" command when editing php files
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

if has('mouse')
  set mouse=a
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
" Show the NERDTree window on the /var/www dir
map <C-p> <Esc>:NERDTree /var/www/<cr>
" Activate the Zencoding
imap <C-z> <Esc><C-y>,a
" Activate Nerd Commenter
map <C-c> <Esc><leader>ci
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

au! BufRead,BufNewFile *.json setfiletype json
" Highlight long lines (soft limit: 80, hard limit: 100)
au BufWinEnter *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
au BufWinEnter *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete

" Enable filetype plugins
filetype plugin on

:nohl

cd! ~\Desktop\Franklin\carro-dos-jogadores\html\
