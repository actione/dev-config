" let g:formatdef_my_custom_python = '"black -q ".(&textwidth ? "-l".&textwidth : "")." -"'
" let g:formatters_python = ['my_custom_python']

noremap ff :Autoformat<CR>
augroup autoformat
autocmd!
 autocmd BufWritePre *.go,*.rs,*.yaml,dockerfile :Autoformat
" autocmd BufWritePre *.cpp,*.c,*.go,*.h,*.rs,*.json,*.yaml,dockerfile,makefile,CMakeLists.txt,*.py :Autoformat
"=======
"let g:auto_format_flag = 1
"
"function RunAutoFormat()
"    if g:auto_format_flag == 1
"        echom "Autoformat file:"..expand("%:p")
"        Autoformat
"    endif
"endfunction
"
"function ToggleAutoFormat()
"    if g:auto_format_flag == 1
"        let g:auto_format_flag = 0
"        echom "AutoFormat off!"
"    else
"        let g:auto_format_flag = 1
"        echom "AutoFormat on!"
"    endif
"endfunction
"
"command! AutoFormatToggle :call ToggleAutoFormat()
"
"augroup autoformat
"    autocmd!
"    autocmd BufWritePre * :call RunAutoFormat()
">>>>>>> upstream/main
augroup END
