" this must be first, because it changes other options as a side effect!!
set nocompatible

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Re-organize statusline
" http://got-ravings.blogspot.com.br/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t               "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{fugitive#statusline()} "fugitive.vim information
set statusline+=%{&ff}]         " file format
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " read only flag
set statusline+=%y              " filetype
set statusline+=%=              " left/right separator
set statusline+=%c,             " cursor column
set statusline+=%l/%L           " cursor line/total lines
set statusline+=\ %P            " percent through file
set hidden                      " hides the buffer instead of closing the files
set nowrap                      " wrap lines
set tabstop=4                   " set tab to be 4 spaces
set backspace=indent,eol,start  " allow backspace over everything in edit mode
set autoindent                  " set auto indent
set si                          " set smart indent
set copyindent                  " copy the previous indentation
set shiftwidth=4                " set 4 space for autoindenting
set shiftround                  " set multiples of shiftwidth when indenting with '<' 
set showmatch                   " show the matching symbols
set ignorecase                  " ignore case when searching
set smartcase                   " use case sensitive when the terms are not all in smallcase
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set history=1000                " remember more commands
set undolevels=1000             " levels of undo command
set title                       " Change the terminal title
set noeb vb t_vb=               " turn off error beeping 
au GUIEnter * set vb t_vb=      " turn off flashing
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set scrolloff=4                 " set 4 lines on the edge of the screen
set virtualedit=all             " let the cursor go anywhere
set nobackup                    " no backup file :D
set noswapfile
hi link htmlLink NONE           " no underline html links
filetype indent on              " Set the identation on
syntax on                       " highlight the syntax
colorscheme candyman            " set color scheme
if !has("gui_running")          
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif
" set background=dark
" set term=xterm-256color
set guifont=Inconsolata\ 11     " set the default gui font to Inconsolata
set guioptions-=T               " disable the toolbar
set guioptions-=m               " disable the menu
set guioptions+=LlRrb           " disable the scrollbar
set guioptions-=LlRrb
set ts=4                        " set the tab space to 4
set expandtab                   " convert tab to spaces
set number                      " set number
let mapleader=","               " change leader to a comma because the backslash is too far away 
                                "   that means all \x commands turn into ,x                        
                                "   the mapleader has to be set before vundle starts loading all   
                                "   the plugins.                                                   

nmap <leader>w :w!<cr>          " fast saving
nmap <leader>x :x<cr>           " fast saving and close
map <C-h> <C-w>h                " changing focus of split panes can 
set viminfo^=%                  " remember info about open buffers on close
map <C-j> <C-w>j                " be a bit of a pain (<C-w>[direction]), 
map <C-k> <C-w>k                " let's drop the middle man!
map <C-l> <C-w>l
map Q gq                        " don't use Ex mode, use Q for formatting
imap <C-z> <Esc><C-y>,a         " activate the Zencoding
map <C-c> <leader>ci            " activate Nerd Commenter
map <F1> <Esc>                  " avoid accidental hits of <F1> while aiming for <Esc>
set termencoding=utf-8          " encoding for the terminal
set encoding=utf-8              " set the encoding
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
filetype plugin on              " enable filetype plugins
:nohl                           " turn off highlighting
xmap <c-k> :mo'<-- <cr> gv      " moving selection to up
xmap <c-j> :mo'>+ <cr> gv       " moving selection to down


autocmd FileType php let php_sql_query=1        " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_htmlInStrings=1    " does exactly that. highlights html inside of php strings
autocmd FileType php let php_noShortTags=1      " no short tags
autocmd FileType php let php_folding=1          " automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd Filetype php set ft=php.html            " Set multiple filetypes to the php files
set makeprg=php\ -l\ %                          " set "make" command when editing php files
set errorformat=%m\ in\ %f\ on\ line\ %l
" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
au! BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufEnter *.scss :syntax sync fromstart
" Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
cmap w!! %!sudo tee > /dev/null %   " Force Saving Files that Require Root Permission
map <leader>cd :cd %:p:h<cr>:pwd<cr>     " Switch CWD to the directory of the open buffer
map <leader>h :%s#<[^>]\+>##g<cr>        " Delete HTML tags but keeps text
nnoremap <leader>ev :vsplit $MYVIMRC<cr> " Easy access to the vimrc
nnoremap <leader>rv :source $MYVIMRC<cr> " Reload vimrc
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>  " When you press <leader>r you can search and replace the selected text
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm  " Remove the Windows ^M - when the encodings gets messed up

if has('mouse')                 " in many terminal emulators the mouse works just fine
  set mouse=a                   " thus enable it.
endif

" Plugins

" Manager plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
Bundle "moll/vim-node"
Bundle "ap/vim-css-color"
Bundle "ctrlp.vim"
Bundle "miripiruni/CSScomb-for-Vim"
Bundle "terryma/vim-multiple-cursors"
Bundle "christoomey/vim-tmux-navigator"
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
    let g:gist_clip_command = 'xclip -selection clipboard' 
    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1

Bundle "junegunn/vim-easy-align"
    vnoremap <silent> <Enter> :EasyAlign<cr>
    
set runtimepath^=~/.vim/bundle/ctrlp.vim
Bundle "fisadev/vim-ctrlp-cmdpalette"
    let g:ctrlp_working_path_mode = ""
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|build$'
    \ }

Bundle "pangloss/vim-javascript"
    let b:javascript_fold=1
    let g:javascript_conceal=1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
