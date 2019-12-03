so ~/.vim/indent/python.vim

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=88
setlocal smarttab
setlocal expandtab
let b:ale_linters = ['flake8']
let b:ale_fixers =['yapf', 'isort', 'reorder-python-imports', 'add_blank_lines_for_python_control_statements']
let b:ale_warn_about_trailing_whitespace = 0


setlocal makeprg=tox\ -e\ flake8
