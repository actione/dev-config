noremap ff :Autoformat<CR>
augroup autoformat
autocmd!
 autocmd BufWritePre *.go,*.rs,*.json,*.yaml,dockerfile,*.py :Autoformat
" autocmd BufWritePre *.cpp,*.c,*.go,*.h,*.rs,*.json,*.yaml,dockerfile,makefile,CMakeLists.txt,*.py :Autoformat
augroup END
