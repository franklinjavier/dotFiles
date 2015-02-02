" this must be first, because it changes other options as a side effect!!
set nocompatible

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Re-organize statusline
" http://got-ravings.blogspot.com.br/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t               
 "file encoding
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, 
"fugitive.vim information
set statusline+=%{fugitive#statusline()} 
" file format
set statusline+=%{&ff}]
" help file flag
set statusline+=%h
" modified flag
set statusline+=%m
" read only flag
set statusline+=%r
" filetype
set statusline+=%y
" left/right separator
set statusline+=%=
" cursor column
set statusline+=%c,
" cursor line/total lines
set statusline+=%l/%L
" percent through file
set statusline+=\ %P
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
" set background=dark
" set term=xterm-256color
" set the default gui font to Inconsolata
set guifont=Inconsolata\ 11
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

" fast saving
nmap <leader>w :w!<cr>
" fast saving and close
nmap <leader>x :x<cr>
" changing focus of split panes can 
map <C-h> <C-w>h
" remember info about open buffers on close
set viminfo^=%
" be a bit of a pain (<C-w>[direction]), 
map <C-j> <C-w>j
" let's drop the middle man!
map <C-k> <C-w>k
map <C-l> <C-w>l
" don't use Ex mode, use Q for formatting
map Q gq
" activate the Zencoding
imap <C-z> <Esc><C-y>,a         
" activate Nerd Commenter
map <C-c> <leader>ci            
" avoid accidental hits of <F1> while aiming for <Esc>
map <F1> <Esc>
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
" moving selection to up
xmap <c-k> :mo'<-- <cr> gv
" moving selection to down
xmap <c-j> :mo'>+ <cr> gv
" tab indents selection
vmap <silent> <Tab> >gv
" shift-tab unindents
vmap <silent> <S-Tab> <gv
" ,p --> past from clipboard system 
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr> 


" autocomplete funcs and identifiers for languages
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
"au! BufRead,BufNewFile *.json set filetype json
au BufNewFile,BufRead,BufReadPost *.jade set filetype=jade
"au! BufRead,BufNewFile *.vm  setfiletype velocity 

" Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Delete HTML tags but keeps text
map <leader>h :%s#<[^>]\+>##g<cr>
" Easy access to the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>  
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm  
" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>
" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Copy/Paste/Cut
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>
" Close 
map <leader>q :q<cr>
" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Tab completion when entering filenames
set wildmode=list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.DS_Store,*.jpg,
  \*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd



" in many terminal emulators the mouse works just fine
" thus enable it.
if has('mouse')
  set mouse=a                   
endif

" Plugins

" Manager plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "tpope/vim-haml"
Bundle "moll/vim-node"
Bundle "gorodinskiy/vim-coloresque"
Bundle "terryma/vim-multiple-cursors"
Bundle "christoomey/vim-tmux-navigator"
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle "digitaltoad/vim-jade"
Bundle "othree/html5.vim"
Bundle "leshill/vim-json"
Bundle "briancollins/vim-jst"

" Syntax highlighting for nginx.conf and related config files.
Bundle "mutewinter/nginx.vim"
    au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

" Vim Markdown runtime files
Bundle "tpope/vim-markdown"
    au BufNewFile,BufReadPost *.md set filetype=markdown

Bundle 'abijr/colorpicker'
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
    let g:gist_clip_command = 'xclip -selection clipboard' 
    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1

" NERDTree
Bundle "scrooloose/nerdtree"
    " NERDTree, Use F3 for toggle NERDTree
    nmap <silent> <F2> :NERDTreeToggle<CR>

Bundle "junegunn/vim-easy-align"
    vnoremap <silent> <Enter> :EasyAlign<cr>
    
Bundle "ctrlp.vim"
set runtimepath^=~/.vim/bundle/ctrlp.vim
Bundle "fisadev/vim-ctrlp-cmdpalette"
    let g:ctrlp_working_path_mode = ""
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|build|dist|build$'
        \ }
    let g:ctrlp_user_command =
        \ ['.git/', 'git --git-dir=%s/.git
        \ ls-files -oc --exclude-standard']

" JavaScript Syntax 
Bundle "pangloss/vim-javascript"
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    let b:javascript_fold=0
    set foldclose=all


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Up-to-date PHP syntax file (5.3, 5.4 & 5.5 support; basic 5.6 support)
Bundle "StanAngeloff/php.vim"
    au FileType php set omnifunc=phpcomplete#CompletePHP
    " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
    au FileType php let php_sql_query=1
    " does exactly that. highlights html inside of php strings
    au FileType php let php_htmlInStrings=1
    " no short tags
    au FileType php let php_noShortTags=1
    " automagically folds functions & methods. this is getting IDE-like isn't it?
    au FileType php let php_folding=1
    " Set multiple filetypes to the php files
    au Filetype php set ft=php.html
    " set "make" command when editing php files
    set makeprg=php\ -l\ %
    set errorformat=%m\ in\ %f\ on\ line\ %l

" Fork of the python.vim by Dmitry Vasiliev and Neil Schemenauer for 2.x and 3.x.
Bundle "mitsuhiko/vim-python-combined"
    autocmd FileType python set omnifunc=pythoncomplete#Complete

" Simulate emmet in vim
Bundle "mattn/emmet-vim"
    nnoremap <C-z> :call emmet#expandAbbr(0,"")<CR>a
    inoremap <C-z> <ESC>:call emmet#expandAbbr(0,"")<CR>a

" CSS/SASS/SCSS
Bundle "miripiruni/CSScomb-for-Vim"
Bundle "cakebaker/scss-syntax.vim"
Bundle "1995eaton/vim-better-css-completion"
    au FileType css set omnifunc=csscomplete#CompleteCSS
    au BufRead,BufNewFile *.scss set filetype=scss.css
    au BufEnter *.scss :syntax sync fromstart

" Velocity syntax
Bundle "lepture/vim-velocity"
    "au! BufRead,BufNewFile *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity
    "au! BufRead,BufNewFile *.vm  setfiletype velocity
    au! BufRead,BufNewFile *.html,*.htm,*.shtml,*.stm set syntax=html filetype=html
    au! BufRead,BufNewFile *.vm,*.html,*.htm,*.shtml,*.stm set syntax=vm filetype=vm 

" Go Lang
Plugin 'fatih/vim-go'

" Editor config
Bundle "editorconfig/editorconfig-vim"

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

