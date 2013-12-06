function! PostHeader()
  let date = strftime("%F")
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


setlocal textwidth=80
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab

map <F5> :InstantMarkdown<CR>
map <F3> :call PostHeader()<CR>
