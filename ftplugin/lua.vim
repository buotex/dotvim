let g:lua_complete_dynamic=0
let g:lua_compiler_name = 'luajit'
let g:lua_check_syntax =0
let g:lua_check_globals= 0
map <buffer> <F5> <ESC>:!luajit "%"<CR>
"nnoremap <buffer><F5> :update<Bar>execute '!luajit '.shellescape(@%, 1)<CR>
inoremap [[ --[[
inoremap ]] ]]--
