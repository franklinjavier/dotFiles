" this must be first, because it changes other options as a side effect.
set nocompatible

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Re-organize statusline, using example from here http://got-ravings.blogspot.com.br/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{fugitive#statusline()} "fugitive.vim information
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

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
colorscheme candyman
" set the default gui font to Monaco
set guifont=Inconsolata\ 11
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
" Activate the Zencoding
imap <C-z> <Esc><C-y>,a
" Activate Nerd Commenter
map <C-c> <leader>ci
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>
" Map taglist plugin shortcut
map <C-f> <Esc>:TlistToggle<cr>
" Check php syntax
map <F5> :!php -l %<cr>

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
"Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


" Plugins "

    " Ctrl + P "
    set runtimepath^=~/.vim/bundle/ctrlp.vim

    " Manager plugins "
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    Bundle 'mattn/webapi-vim'

    " Gist "
    Bundle 'mattn/gist-vim'
    let g:gist_clip_command = 'xclip -selection clipboard' 
    let g:gist_detect_filetype = 1              "  to detect filetype from the filename
    let g:gist_open_browser_after_post = 1      " to open browser after the post:

    " Themes "
    Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
