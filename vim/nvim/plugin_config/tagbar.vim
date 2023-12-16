
"  tagbar
nnoremap <silent> gt :TagbarToggle<cr>

let g:tagbar_autofocus=1
let g:tagbar_autoshowtag=1

function! tagbar#RecoverTagBar()
    let need_recover = 0
    let tab = tabpagenr()
    let bufs = tabpagebuflist(tab)
    for buf in bufs
        let name = bufname(buf)
        if stridx(name, '__Tagbar__') == 0
            execute 'bd! '.buf
            let need_recover = 1
        endif
    endfor
    if need_recover == 1
        Tagbar
        wincmd p
    endif
endfunction



augroup autoRecoverTagbar
    autocmd!
    autocmd SessionLoadPost * call tagbar#RecoverTagBar()
augroup END
