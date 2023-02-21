
" 自动格式化会将EOF缩进，这样就有问题了，此处将缩进去除
function! RepairVimScript()
    %s/^\s*lua << EOF/lua << EOF/g
    %s/^\s*EOF/EOF/g
endfunction

function! BackgroundBuffer()
    let buffers = range(1, bufnr('$'))
    return filter(buffers, 'buflisted(v:val) && index(tabpagebuflist(tabpagenr()),v:val) == -1') " 所有buffer
endfunction

function! CleanBuffer()
    let bufs = BackgroundBuffer()
    for buf in bufs
        let name = bufname(buf)
        echom match(name, "\\[.*\\]")
        if match(name, "\\[.*\\]") != -1 || match(name, "__.*__") != -1
            execute "bd "..buf
        endif
    endfor
endfunction


function! CloseBackgroundBuffer()
    let bufs = BackgroundBuffer()
    for b in bufs
        execute "bd "..b
    endfor
endfunction

function! LoadProjectConfig()
    let pwd = getcwd()
    while pwd != "/"
        let project_config_file = pwd.."/.config.vim"
        if filereadable(project_config_file)
            execute "runtime "..project_config_file
            break
        endif
        let pwd = fnamemodify(pwd, ":h")
    endwhile
endfunction

function! HandleTermEnter()
    startinsert
    set nonu
    set norelativenumber
endfunction

function! HandleSessionLoadPost()
    call CloseBackgroundBuffer()
    call LoadProjectConfig()
endfunction

augroup autoRunGroup
    autocmd!
    autocmd BufLeave * stopinsert
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
    " autocmd BufEnter * :set nomodifiable
    autocmd TermEnter * :call HandleTermEnter()
    autocmd SessionLoadPost * :call HandleSessionLoadPost()
augroup END

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set showcmd
set nu
set autoread
set autowriteall
set ignorecase smartcase
set incsearch
"set hlsearch
set cmdheight=1
set cursorline cursorcolumn
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set expandtab
set nocompatible
set nowrap
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set smartindent
set autoindent
set clipboard=unnamedplus

set enc=utf-8
let &termencoding=&encoding
set fencs=utf-8,ucs-bom,gb18030
set mouse=a
set timeoutlen=300

set foldlevelstart=99
set foldlevel=99

set undofile

if exists("g:neovide")
    set guifont=FiraCode\ NFM:h10:w10:b:i
    let g:neovide_scale_factor = 1.0
    let g:neovide_transparency = 0.5
    let g:neovide_hide_mouse_when_typing = v:true
    let g:neovide_fullscreen = v:true
    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0
    let g:neovide_scroll_animation_length = 0.1
    let g:neovide_underline_automatic_scaling = v:true
    let g:neovide_remember_window_size = v:true
    let g:neovide_profiler = v:false
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_trail_size = 0.5
    let g:neovide_cursor_antialiasing = v:true
    let g:neovide_cursor_unfocused_outline_width = 0.125
endif


