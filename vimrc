"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Folding related
""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vno <silent> * :call VisualSelection('f')<CR>
vno <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
noremap  <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab
  set stal=1
catch
endtry

" Return to last edit position when opening files (You want this!)
augroup read_post_cmd
	autocmd!
	autocmd BufReadPost *
		 \ if line("'\"") > 0 && line("'\"") <= line("$") |
		 \   exe "normal! g`\"" |
		 \ endif
augroup END
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=FileName:[%{HasPaste()}%F%m%r%h]\ %w\ CWD:[%r%{getcwd()}%h]\ Line:[%l/%L]
set stl=Path:[%F]\ 
set stl+=FT:%y\ 
set stl+=%(\ [%M%R%H%W]%)\ 
"set stl+=Byte:[%b/0x%B]\ 
set stl+=Line:[%l/%L]\ 
set stl+=Col:[%c]\ 
set stl+=%{HasPaste()}



"set stl=FileName:%F\ FileType:%y\ %m%r%h%w\ Byte:[%b/0x%B\ Line:[%l/%L\ %%%p]\ Col:[%c]\ %#{HasPaste()}#


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
noremap 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
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

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Call Erlang compiler on current file
func! ExecuteErlc()
	execute "!make" 
endfunc

augroup buf_write_cmd
	autocmd!
	autocmd BufWrite *.py :call DeleteTrailingWS()
	autocmd BufWrite *.coffee :call DeleteTrailingWS()
	"autocmd BufWrite *.erl :call ExecuteErlc()
augroup END


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

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"noremap <leader>cc :botright cope<cr>
"noremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"noremap <leader>n :cn<cr>
"noremap <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
" noremap <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>



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
        return '[PASTE MODE]  '
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

" For Vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()
"Bundle "fanchangyong/YouCompleteMe"
Bundle "scrooloose/nerdtree"
"Bundle "minibufexplorerpp"
Bundle "cocoa.vim"
Bundle "jimenezrick/vimerl.git"
Bundle "scrooloose/syntastic"
"Bundle "Rip-Rip/clang_complete"
Bundle "tpope/vim-commentary"
Bundle "kana/vim-textobj-entire"
Bundle "kana/vim-textobj-user"
Bundle "ack.vim"
Bundle "Solarized"
Bundle "a.vim"
Bundle "jeffkreeftmeijer/vim-numbertoggle"
Bundle "scrooloose/nerdcommenter"
Bundle "bufmru.vim"
Bundle "justinmk/vim-sneak"
Bundle 'junegunn/seoul256.vim'
Bundle 'uarun/vim-protobuf'
"Bundle 'roman/golden-ratio'
Bundle 'tpope/vim-fugitive'
Bundle 'christoomey/vim-tmux-navigator'

:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

noremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:miniBufExplMaxSize = 1
let NERDTreeShowLineNumbers=1

"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap k gk
noremap gk k
noremap j gj
noremap gj j

noremap \ ,

" Enable Relative Line Number to conveniently use [count] with commands
set rnu
"set nu

" Automatically Generate ctags file When We Save Our File
" But because its cost of performance (It may generate tag file EVERY TIME when we save our file),We disable it now
" autocmd BufWritePost * call system("ctags -R")

nnoremap <leader>v  :vsplit<cr>
nnoremap <leader>h  :split<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap H 0
nnoremap L $

"set list
"set listchars=tab:⊙→,nbsp:.
" Highlightening cursor line
"set cul

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

cabbrev h tab help
cabbrev help tab help
augroup ft_cmd
	autocmd!
	autocmd FileType help set rnu
augroup END

" Use <leader>q to quit,and disables :q
nnoremap <leader>q :q<cr>
"nnoremap <leader>qa :qa<cr>
"cabbrev q <nop>
cabbrev w <nop>
nnoremap <leader>l :ls<cr>

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


"nnoremap <c-]> :YcmCompleter GoToDefinitionElseDeclaration<cr>
"nnoremap <c-t> <c-o>

let g:InsertModeAlternateHeader=0

" for golang
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set path+=$GOPATH/src/zerogame.info/thserver

nnoremap <leader>a :Ack <cword><cr>
