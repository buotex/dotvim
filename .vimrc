set nocompatible
syntax on
filetype off


call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'nvie/vim-flake8'
Plug '~/.fzf'
"Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
"Plug 'zchee/deoplete-jedi'

call plug#end()

filetype plugin indent on
set completeopt="menu"
set confirm

set timeout timeoutlen=150 ttimeoutlen=50
set laststatus=2
let g:jedi#completion_enabled = 0
let g:jedi#documentation_command = "N"
let g:jedi#smart_auto_mappings = 0

"end airline configuration"

let g:ack_default_options = " -H --nocolor --nogroup --column"

"set guifont=Terminus
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guioptions=Ace
"let g:jedi#popup_on_dot = 0
let g:gist_detect_filetype = 1
let g:gist_get_multiplefile=1

set t_Co=256


map <C-k> :NERDTreeToggle<CR>
nnoremap  <silent>   <c-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabn<CR>
nnoremap  <silent> <c-s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabp<CR>

noremap <C-Down> <C-W>j
noremap <C-Right> <C-W>l
noremap <C-Left> <C-W>h
noremap <C-Up> <C-W>k
inoremap <C-Down> <C-o><C-W>j
inoremap <C-Right> <C-o><C-W>l
inoremap <C-Left> <C-o><C-W>h
inoremap <C-Up> <C-o><C-W>k

noremap <C-n> <C-W>j
noremap <C-i> <C-W>l
noremap <C-h> <C-W>h
noremap <C-e> <C-W>k


map <C-PageUp> :tabp <CR>
map <C-PageDown> :tabn <CR>
cmap w!! w !sudo tee > /dev/null %
"vmap <C-c> '<,'>w !xclip -selection clipboard
nmap ,p :r ~/.buffer <CR>

command C :nohls

colorscheme wombat256mod
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
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal nowrap
set colorcolumn=+1

"map <F4> :NERDTree <CR>
map <F6> :setlocal spell spelllang=en_us <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"folders
if isdirectory($HOME . '/dump/vim-backup') == 0
  :silent !mkdir -p ~/dump/vim-backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir=~/dump/vim-backup/
"set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/dump/vim-swap') == 0
  :silent !mkdir -p ~/dump/vim-swap >/dev/null 2>&1
endif
"set directory=./.vim-swap//
set directory=~/dump/vim-swap/
"set directory+=~/tmp//
"set directory+=.
" viminfo stores the the state of your previous editing session
" set viminfo+=n~/dump/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/dump/vim-undo') == 0
    :silent !mkdir -p ~/dump/vim-undo > /dev/null 2>&1
  endif
  "set undodir=./.vim-undo//
  set undodir=~/dump/vim-undo/
  set undofile
endif


"
"
"imap <c-n> <NL>
"cmap <c-n> <NL>
inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>

" rotate some keys about to get qwerty "hjkl" back for movement
noremap n <down>
noremap e <up>
noremap i <right>

" move these keys to their qwerty positions because they are
" in the way of hjkl (and E for J)
noremap k n
noremap K N
noremap l i
noremap L I
noremap N J
noremap E K
noremap I L
"
"" this is the only key that isn't in qwerty or colemak position
noremap j e
noremap J E

" window movement
nnoremap <c-w>n <c-w>j
nnoremap <c-w>i <c-w>l
nnoremap <c-w>e <c-w>k

" qwerty <c-w>n and <c-w>i stolen but do nothing so map back
nnoremap <c-w>k <c-w>n
nnoremap <c-w>l <c-w>i


" this nerdtree mapping interferes with movement
let g:NERDTreeMapOpenExpl = "j"


packloadall
silent! helptags ALL
