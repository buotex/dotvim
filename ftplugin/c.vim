let g:clang_complete_copen=1
"autocmd FileType cpp map <F5> :call g:ClangUpdateQuickFix()<CR>
map <buffer><F5> <Esc>:w<CR> :!make <CR>
