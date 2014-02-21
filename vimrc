" this must be first, because it changes other options as a side effect!!
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
" no underline html links
hi link htmlLink NONE


" Set the identation on
filetype indent on

" highlight the syntax
syntax on
"set term=xterm-256color
"set color scheme
colorscheme candyman
" set the default gui font to Inconsolata
set guifont=Inconsolata\ 12
" disable the toolbar
set guioptions-=T
" disable the menu
set guioptions-=m
" set the tab space to 4
set ts=4
" convert tab to spaces
set expandtab
" set number
set number
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
map <F1> <Esc>
" Check php syntax
map <F5> :!php -l %<cr>

au! BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufEnter *.scss :syntax sync fromstart

" Highlight long lines (soft limit: 80, hard limit: 100)
"au BufWinEnter *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
"au BufWinEnter *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

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

" Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

" Plugins

    " Ctrl + P
    set runtimepath^=~/.vim/bundle/ctrlp.vim

    " Manager plugins
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    Bundle 'mattn/webapi-vim'

    " Gist
    Bundle 'mattn/gist-vim'

        let g:gist_clip_command = 'xclip -selection clipboard' 
        let g:gist_detect_filetype = 1              "  to detect filetype from the filename
        let g:gist_open_browser_after_post = 1      " to open browser after the post:

    " Multiple cursors
    Bundle 'terryma/vim-multiple-cursors'


    " Themes
    Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }


    " CSS Comb - sort properties of css
    Bundle 'miripiruni/CSScomb-for-Vim'


    " Powerline
    Bundle 'Lokaltog/powerline'
    
        if ! has('gui_running')
            set ttimeoutlen=10
            augroup FastEscape
                autocmd!
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
            augroup END
        endif

        let g:Powerline_symbols = 'fancy'
        set laststatus=2 " Always display the statusline in all windows
        set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
        set t_Co=256


    " Easy align
    Bundle 'junegunn/vim-easy-align'

        vnoremap <silent> <Enter> :EasyAlign<cr>


    " CTRL P list directory
    Bundle 'ctrlp.vim'
    Bundle 'fisadev/vim-ctrlp-cmdpalette'

    " CSS Color
    Bundle 'ap/vim-css-color'

    " TernJS
    Bundle 'marijnh/tern_for_vim'

    " Vim and tmux navigator
    Bundle 'christoomey/vim-tmux-navigator'

    " Vastly improved Javascript indentation and syntax support in Vim. 
    Bundle 'pangloss/vim-javascript'
        
        let b:javascript_fold=1
        let g:javascript_conceal=1


    " Vim runtime files for Haml, Sass, and SCSS 
    Bundle 'tpope/vim-haml'

    " Syntax highlighting for JSON in Vim
    "Bundle 'leshill/vim-json'
    "
    "Vim MarkDown runtime files
    Bundle 'tpope/vim-markdown'



" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","


" Settings for CTRLP 
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules$'
  \ }

" Fast saving
nmap <leader>w :w!<cr>

" Changing focus of split panes can be a bit of a pain (<C-w>[direction]), 
" let's drop the middle man!
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Easy way to yank to register / paste from register (system clipboard)
"nnoremap y "+y
"vnoremap y "+y
"nnoremap p "+p
"vnoremap p "+p


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

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


" Restore screen size and position
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
