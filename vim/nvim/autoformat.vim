" let g:formatdef_my_custom_python = '"black -q ".(&textwidth ? "-l".&textwidth : "")." -"'
" let g:formatters_python = ['my_custom_python']

noremap ff :Autoformat<CR>
augroup autoformat
autocmd!
 autocmd BufWritePre *.go,*.rs,*.json,*.yaml,dockerfile,*.py :Autoformat
" autocmd BufWritePre *.cpp,*.c,*.go,*.h,*.rs,*.json,*.yaml,dockerfile,makefile,CMakeLists.txt,*.py :Autoformat
augroup END
