function! PostHeader()
  let date = strftime("%F")
  put! = ''
  put! = '}'
  put! = '  ]'
  put! = '    '
  put! = '  \"tags\": ['
  put! = '  ],'
  put! = '    '
  put! = '  \"categories\": ['
  put! = '  \"date\": \"'.date.'\",'
  put! = '  \"title\": \"\",'
  put! = '{'
endfunc

function HasHeader()
  let date = strftime("%F")
  let l3=getline(3)
  if l3[:8] is# '  "date":'
    3s/\d\{4}-\d\{2}-\d\{2}/\=date/
  else
    1call PostHeader()
    exe 'normal 0G'
  endif
endfunction

augroup markdownHeader
  autocmd!
  autocmd VimEnter * call HasHeader()
augroup END

setlocal textwidth=80
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab

map <F5> :InstantMarkdown<CR>
map <F3> :call PostHeader()<CR>
