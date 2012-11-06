set nocompatible
let g:pathogen_disabled=["minibufexpl"]
call pathogen#infect("bundles")
syntax on
filetype plugin indent on

"noremap <C-N> <Left>
"noremap <C-E> <Down>
"noremap <C-U> <Up>
"noremap <C-I> <Right>
"noremap <C-Y> <PageDown>
"noremap <C-L> <PageUp>

if $TERM == "linux" 
	set term=xterm
  set <F1>=[[A
  set <F2>=[[B
  set <F3>=[[C
  set <F4>=[[D
  set <F5>=[[E
endif
if $TERM == "screen"
  set term=xterm
endif

noremap <C-Down> <C-W>j
noremap <C-Right> <C-W>l
noremap <C-Left> <C-W>h
noremap <C-Up> <C-W>k
inoremap <C-Down> <C-o><C-W>j
inoremap <C-Right> <C-o><C-W>l
inoremap <C-Left> <C-o><C-W>h
inoremap <C-Up> <C-o><C-W>k


map <C-PageUp> :tabp <CR>
map <C-PageDown> :tabn <CR>
cmap w!! %!sudo tee > /dev/null %
nmap ,p :r ~/.buffer <CR>
nmap <Space> j
vmap <Space> j

set timeout timeoutlen=150
inoremap AA <C-o>A
inoremap II <C-o>I
inoremap OO <C-o>O

inoremap UU <C-o>u
inoremap CC <C-o>C
inoremap DD <C-o>dd
inoremap SS <C-o>S
command C :nohls

colorscheme wombat
set ssop-=options
"set ssop-=folds
set ssop-=blank
set ssop-=buffers
set wildmode=longest:full
set wildmenu
"""""""""""""""""""MiniBufExpl""""""""""""""""""
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplorerDebugLevel=0
"let g:miniBufExplorerDebugMode=2

set ruler
set incsearch
set cuc
set cul
set number
set noshowmatch
let loaded_matchparen=1
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>
"set shellcmdflag=-ic

set nosmartindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=80
setlocal nowrap

map <F6> :setlocal spell spelllang=en_us <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"folders
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.
" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


"
"
