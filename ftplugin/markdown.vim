function! PostHeader()
  let date = strftime("%F")
  put! = '}'
  put! = '  ]'
  put! = ''
  put! = '  \"categories\": ['
  put! = '  \"date\": \"'.date.'\",'
  put! = '  \"title\": \"\",'
  put! = '{'
endfunc


setlocal textwidth=120

map <F5> :InstantMarkdown<CR>
map <F3> :call PostHeader()<CR>
