so ~/.vim/indent/python.vim

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=119
setlocal smarttab
setlocal expandtab
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers =['yapf']
let b:ale_warn_about_trailing_whitespace = 0



map <F5> :w<CR>:!python "%"<CR>
