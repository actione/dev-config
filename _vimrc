let mapleader=" "
             
"plugin manager           
call plug#begin()           
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'tpope/vim-surround'        
Plug 'easymotion/vim-easymotion'   
Plug 'tomasr/molokai'          
Plug 'nathanaelkane/vim-indent-guides' 
Plug 'justinmk/vim-sneak'        
Plug 'mg979/vim-visual-multi', {'branch': 'master'} 
Plug 'pablopunk/statusline.vim'    
Plug 'chiel92/vim-autoformat'     
Plug 'kana/vim-textobj-user'     
Plug 'gcmt/wildfire.vim'      
Plug 'dbakker/vim-projectroot'    
Plug 'dkprice/vim-easygrep'    
Plug 'scrooloose/nerdcommenter'   
Plug 'tpope/vim-fugitive'   
Plug 'joonty/vdebug'   
Plug 'vim-scripts/DoxygenToolkit.vim'  
Plug 'junegunn/fzf'  
Plug 'yegappan/grep'
Plug 'yggdroot/leaderf'
call plug#end()

" ------------ easygrep -------------
let g:EasyGrepRoot = "search:.git,.svn"
let g:EasyGrepRecursive = "1"
let g:EasyGrepIgnoreCase = "1"
 
" ------------ project -----------------  
nnoremap <leader>dp :ProjectRootCD<cr> 
nnoremap <silent> <leader>dt :ProjectRootExe NERDTreeFind<cr>
nnoremap <silent> [p :ProjectBufPrev<cr> 
nnoremap <silent> ]p :ProjectBufNext<cr> 
nnoremap <silent> [P :ProjectBufFirst<cr> 
nnoremap <silent> ]P :ProjectBufLast<cr> 
nnoremap <silent> ]v :ProjectBufNext ~/.vim<cr>
nnoremap <silent> [v :ProjectBufPrev ~/.vim<cr>
nnoremap <silent> ]f :ProjectBufNext 'F<cr> 
nnoremap <silent> [f :ProjectBufPrev 'F<cr> 
 
 
" ------------- coc extensions ------------ 
let g:coc_disable_startup_warning = 1 
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-go', 'coc-python', 'coc-vimlsp', 'coc-marketplace', 'coc-rust-analyzer', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-webview', 'coc-github']
 
 
" -------------- color scheme ---------------------
 
let g:molokai_original = 1 
let g:rehash256 = 1 
color molokai 
" -------------- nerdtree config -------------------
map <leader>nt :NERDTreeToggle<CR> 
map <leader>nf :NERDTreeFind<CR> 
let NERDTreeShowHidden=1 
 
" --------------- coc.vim config -------------------
 
" Some servers have issues with backup files, see #649.
set nobackup 
set nowritebackup 
 
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. 
set updatetime=300 
 
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved. 
set signcolumn=yes 
 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> 
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" : 
			\ coc#refresh() 
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
 
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
 
function! CheckBackspace() abort 
	let col = col('.') - 1 
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction 
 
" Use `[g` and `]g` to navigate diagnostics 
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev) 
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ---------------- my config ---------------
set showcmd
set nu
set autowriteall
set autoread
set ignorecase smartcase
" set relativenumber
set cursorline cursorcolumn
set tabstop=4
set shiftwidth=4
set nocompatible

set enc=utf-8
set fencs=utf-8,ucs-bom,gb18030

" autocmd InsertLeave,InsertEnter * :set relativenumber!
autocmd BufEnter * :ProjectRootCD
autocmd BufWritePre *.cpp :Autoformat
autocmd BufWritePre *.h :Autoformat
autocmd BufWritePre *.go :Autoformat
autocmd BufWritePre *.c :Autoformat
autocmd BufWritePre *.rs :Autoformat
autocmd BufWritePre *.json :Autoformat
autocmd BufWritePre *.js :Autoformat

autocmd BufWritePost *vimrc :source ~/.vimrc
" autocmd BufEnter * :set nomodifiable

inoremap hh <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
inoremap //<cr> <ESC>:Dox<cr>
inoremap ///<cr> <ESC>:DoxLic<cr>
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap " ""<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i

" inoremap yy <ESC>yya
" inoremap dd <ESC>ddi
" inoremap pp <ESC>pi
" inoremap VV <ESC>V
" inoremap vv <ESC>v
" inoremap zz <ESC>zza
" inoremap gg <ESC>ggi
" inoremap GG <ESC>G$a
inoremap oo <ESC>o
inoremap OO <ESC>O
" inoremap AA <ESC>A
" inoremap II <ESC>I
" inoremap WW <ESC>wwi
" inoremap BB <ESC>bi
" inoremap EE <ESC>eei
" inoremap GEE <ESC>gei
" inoremap yiw <ESC>lyiwa
" inoremap diw <ESC>diwa
" inoremap :w<cr> <ESC>:w<cr>a
" inoremap :wq<cr> <ESC>:wq<cr>
" inoremap RR <ESC>lviwp
" inoremap uu <ESC>ui
" inoremap UU <ESC><C-r>
" inoremap sw<cr> <ESC>lyiw:%s/<C-r>0/
" inoremap /w<cr> <ESC>lyiw/<C-r>0
" inoremap ?? <ESC>/
" inoremap ^^ <ESC>0i
" inoremap $$ <ESC>$a


nnoremap <leader>w <C-w>
nnoremap tt :tabnew
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap to :tabonly<CR>
nnoremap tc :tabclose<CR>
nnoremap sh :shell<CR>
nnoremap <f4> :CocCommand clangd.switchSourceHeader<CR>
nnoremap <leader>mr @
nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
nnoremap <leader>G "9yiw:Rg<space><C-r>9<cr>
nnoremap <leader>g :!lazygit<cr>
nnoremap <leader>mv :CocCommand markdown-preview-enhanced.openPreview<cr>
nnoremap <leader>fc :echo @%<cr>
nnoremap //<cr> :Dox<cr>
nnoremap ///<cr> :DoxLic<cr>
nnoremap <leader>F :Autoformat
" nnoremap MM :set modifiable<cr>i
nnoremap <leader>o :FZF<cr>

nnoremap <Up> k
nnoremap <Down> j
nnoremap <Left> h
nnoremap <Right> l
nnoremap gh 0
nnoremap gl $
nnoremap gj 25j
nnoremap gk 25k
nnoremap g<Left> 0
nnoremap g<Right> $
nnoremap g<Down> 25j
nnoremap g<Up> 25k


vnoremap <leader>w <C-w>
vnoremap tt :tabnew
vnoremap tn :tabnext<CR>
vnoremap tp :tabprev<CR>
vnoremap to :tabonly<CR>
vnoremap tc :tabclose<CR>
vnoremap sh :shell<CR>
vnoremap <f4> :CocCommand clangd.switchSourceHeader<CR>
vnoremap m <Plug>(VM-Visual-Cursors)

vnoremap <Up> k
vnoremap <Down> j
vnoremap <Left> h
vnoremap <Right> l
vnoremap gh 0
vnoremap gl $
vnoremap gj 25j
vnoremap gk 25k
vnoremap g<Left> 0
vnoremap g<Right> $
vnoremap g<Down> 25j
vnoremap g<Up> 25k


