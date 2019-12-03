set nocompatible
syntax on
filetype off


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'urbainvaes/fzf-marks', { 'dir': '$HOME/.fzf-marks', 'do': 'echo source $HOME/.fzf-marks/fzf-marks.plugin.bash >> ~/.bashrc' }


Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'JuliaEditorSupport/julia-vim'
"Plug 'python-rope/ropevim'
Plug 'stephpy/vim-yaml'
"Plug 'psf/black'
Plug 'davidhalter/jedi-vim'
Plug 'lifepillar/vim-mucomplete'



"Plug 'zchee/deoplete-jedi'

call plug#end()

filetype plugin indent on

set completeopt-=preview
set completeopt+=longest,menuone,noselect
let g:jedi#popup_on_dot = 0  " It may be 1 as well
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
inoremap <silent> <plug>(MUcompleteFwdKey) <c-n>
imap <c-n> <plug>(MUcompleteCycFwd)
inoremap <silent> <plug>(MUcompleteBwdKey) <c-h>
imap <c-h> <plug>(MUcompleteCycBwd)
let g:jedi#goto_command = "<leader>s"
let g:jedi#goto_assignments_command = "<leader>d"
let g:jedi#documentation_command = "E"
let g:jedi#usages_command = "<leader>k"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"



set confirm
set hlsearch

set timeout timeoutlen=150 ttimeoutlen=50
set laststatus=2

"let ropevim_vim_completion=1
"let ropevim_extended_complete=1


"end airline configuration"

let g:gist_detect_filetype = 1
let g:gist_get_multiplefile=1

set t_Co=256


"map <C-k> :NERDTreeToggle<CR>
"nmap <silent> <leader>m :History<CR>


noremap <C-n> <C-W>j
noremap <C-i> <C-W>l
noremap <C-h> <C-W>h
noremap <C-e> <C-W>k
"noremap <C-[> :cprev<CR>
"noremap <C-]> :cnext<CR>
"nmap <silent> [ <Plug>(ale_previous_wrap)
"nmap <silent> ] <Plug>(ale_next_wrap)


map <C-PageUp> :tabp <CR>
map <C-PageDown> :tabn <CR>
cmap w!! w !sudo tee > /dev/null %
"vmap <C-c> '<,'>w !xclip -selection clipboard
nmap ,p :r ~/.buffer <CR>

colorscheme wombat256mod
"set ssop-=options
"set ssop-=blank
"set ssop-=buffers
"set wildmode=longest:full
"set wildmenu

set number

set ruler
set incsearch
set cuc
set cul
"set noshowmatch
let loaded_matchparen=1
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

set nosmartindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal nowrap
set colorcolumn=+1

map <F6> :setlocal spell spelllang=en_us <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"folders
if isdirectory($HOME . '/dump/vim-backup') == 0
  :silent !mkdir -p ~/dump/vim-backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir=~/dump/vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/dump/vim-swap') == 0
  :silent !mkdir -p ~/dump/vim-swap >/dev/null 2>&1
endif
"set directory=./.vim-swap//
set directory=~/dump/vim-swap/

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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-g> :Rg<Cr>
nnoremap <C-f> :Files<Cr>


packloadall
silent! helptags ALL
