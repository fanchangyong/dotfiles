" Personal vimrc — trimmed down for light text editing (mainly Claude Code prompts).
" Original heavy-coding setup backed up at ~/.vimrc.backup.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

filetype plugin on
filetype indent on

set autoread

let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1
set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw
set magic

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
if !has('nvim')
  set termencoding=utf-8
endif

set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=0

set ai
set si
set wrap

""""""""""""""""""""""""""""""
" => Folding
""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vno <silent> * :call VisualSelection('f')<CR>
vno <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

try
  set switchbuf=useopen,usetab
  set stal=1
catch
endtry

" Return to last edit position when opening files
augroup read_post_cmd
    autocmd!
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
augroup END

set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2

set stl=Path:[%F]\
set stl+=FT:%y\
set stl+=%(\ [%M%R%H%W]%)\
set stl+=Line:[%l/%L]\
set stl+=Col:[%c]\
set stl+=%{HasPaste()}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
noremap <leader>g :grep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
noremap <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
noremap <leader>p :setlocal paste!<cr>


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

function! HasPaste()
    if &paste
        return '[PASTE MODE]  '
    en
    return ''
endfunction

" Don't close window when deleting a buffer
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'sjl/vitality.vim'
call plug#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

" Use \ to access original , (since , is leader)
noremap \ ,

" Relative + absolute line numbers
set rnu
set nu

" Splits / edit-vimrc / quit
nnoremap <leader>v  :vsplit<cr>
nnoremap <leader>h  :split<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>q  :q<cr>

" Operator-pending text objects for parens
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

augroup ft_cmd
    autocmd!
    autocmd FileType help set rnu
augroup END

" Buffer-switch via alt-buffer history
nnoremap <leader>1 1<c-^>
nnoremap <leader>2 2<c-^>
nnoremap <leader>3 3<c-^>
nnoremap <leader>4 4<c-^>
nnoremap <leader>5 5<c-^>
nnoremap <leader>6 6<c-^>
nnoremap <leader>7 7<c-^>
nnoremap <leader>8 8<c-^>
nnoremap <leader>9 9<c-^>

nnoremap <leader>c :cclose<cr>

set modeline
set modelines=5

" Swap ; and : — fewer shift presses for command mode
nnoremap ; :
nnoremap : ;

if !has('nvim')
  set pastetoggle=<F6>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
set background=dark

set cursorline

" Buffer list + jump
nnoremap <leader>l :ls<CR>:b<Space>

set showbreak=↪\

" Auto-resize splits when parent window resizes
autocmd! VimResized * wincmd =

" Auto-refresh files changed outside vim
set updatetime=500
au CursorHold,FocusGained * checktime


" Local overrides
if filereadable("~/.vimrc_local")
    source "~/.vimrc_local"
endif

" Disable mouse
set mouse=
