" -------------------------------------------------------
" ------ FUNCTIONS --------------------------------------
" -------------------------------------------------------

" Function to update keywords in comments
function! UpdateTodoKeywords(...)
	let newKeywords = join(a:000, " ")
	let synTodo = map(filter(split(execute("syntax list"), '\n') , { i,v -> match(v, '^\w*Todo\>') == 0}), {i,v -> substitute(v, ' .*$', '', '')})
	for synGrp in synTodo
		execute "syntax keyword " . synGrp . " contained " . newKeywords
	endfor
endfunction

" Function to set tab width to n spaces
function! SetTab(n)
	let &tabstop=a:n
	let &shiftwidth=a:n
	let &softtabstop=a:n
	set expandtab
	set autoindent
	set smartindent
endfunction

" Function to trim extra whitespace in whole file
function! Trim()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

" show syntax group of symbol under cursor
function! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" -------------------------------------------------------
" ------ CONFIG -----------------------------------------
" -------------------------------------------------------
" Faster updates
set updatetime=100

" How to split panes
set splitbelow
set splitright

" No hidden buffers
set hidden&

" Automatically read on change
set autoread

" Position in code
set number
set relativenumber
set ruler

" Don't make noise
set visualbell

" default file encoding
set encoding=utf-8

" Line wrap
set nowrap

" Mouse support
set mouse=a

" disable backup files
set nobackup
set nowritebackup

" Don't give ins-completion-menu messages
set shortmess+=c

" Always show sign column
set signcolumn=yes

" no folds, ever
set foldlevelstart=99

" set not compatible (important for sharing configs)
set nocompatible
let c_no_curly_error=1

" Python
let g:python3_host_prog="/usr/local/bin/python3"

" Get syntax files from config folder
set runtimepath+=~/.config/nvim/syntax

" fzf in runtimepath
set rtp+=/usr/local/opt/fzf

" Use ripgrep as grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

set laststatus=2

" Highlight search results
set hlsearch
set incsearch

set t_Co=256

set noexpandtab
set autoindent
set smartindent

" Syntax highlighting
syntax on

command! -nargs=1 SetTab call SetTab(<f-args>)

command! -nargs=0 Trim call Trim()

augroup now
	autocmd!
	autocmd Syntax * call UpdateTodoKeywords("NOTE", "NOTES", "IMPORTANT", "DOCUMENTATION", "QUESTION", "POSSIBLE BUG")
augroup END

" -------------------------------------------------------
" ------ CONFIG PLUGINS ---------------------------------
" -------------------------------------------------------

" Configure file browser
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" enable history for fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" auto-pair2
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" " language-specific formatters
" au FileType cpp set formatprg=clang-format | set equalprg=clang-format

let g:lion_squeeze_spaces = 1

" -------------------------------------------------------
" ------ FILE SPECIFIC CONFIG ---------------------------
" -------------------------------------------------------

" Binary files -> xxd
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END

" tab at 2 for C/C++
autocmd BufRead,BufNewFile *.c SetTab 2
autocmd BufRead,BufNewFile *.h SetTab 2
autocmd BufRead,BufNewFile *.cpp SetTab 2
autocmd BufRead,BufNewFile *.hpp SetTab 2

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" tab width 4 for shaders
autocmd BufRead,BufNewFile *.sc SetTab 4

" nim config
autocmd BufRead,BufNewFile *.nim SetTab 2
autocmd BufRead,BufNewFile *.nims SetTab 2

" .vs = glsl
augroup vs_ft
	au!
	autocmd BufNewFile,BufRead *.vs set syntax=glsl
augroup END

" .fs = glsl
augroup fs_ft
	au!
	autocmd BufNewFile,BufRead *.fs set syntax=glsl
augroup END

" .sc = glsl
augroup sc_ft
	au!
	autocmd BufNewFile,BufRead *.sc set filetype=glsl
augroup END

" -------------------------------------------------------
" ------ KEYBOARD ---------------------------------------
" -------------------------------------------------------

" copilot
nnoremap ;me :Copilot enable<CR>
nnoremap ;md :Copilot disable<CR>
nnoremap ;mp :Copilot panel<CR>

" building and saving

nnoremap mm :w<CR>:!build<CR>
nnoremap mr :w<Cr>:!run<CR>

" opening
xnoremap ;e y:e %:p:h/<C-r>" <CR>
xnoremap ;d y:!xdg-open %:p:h & <CR>
xnoremap ;p y:!screenshot "%:p:h/<C-r>"" <CR>
xnoremap ;r y:!cd %:p:h && <C-r>" <CR>
" xnoremap ;f opens file -- see init.lua

" directory
nnoremap ;d :e .<cr>

" term
nnoremap ;t :sp<cr>:term<cr>i

" windows
nnoremap ;b :let &bg=(&bg=='light'?'dark':'light')<CR>

" editing text
xnoremap ;s y:%s/<C-r>"//g<Left><Left>
xnoremap ;ls y:.s/<C-r>"//g<Left><Left>

" alt-a as esc-a for select
nmap <esc>a <a-a>

" Disable C-z from job-controlling neovim
nnoremap <c-z> <nop>

" Ctrl-k closes all floating windows in normal mode
nmap <c-k> call coc#float#close_all()

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Map insert mode CTRL-{hjkl} to arrows
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Mame in normal mode
nmap <C-h> <Left>
nmap <C-j> <Down>
nmap <C-k> <Up>
nmap <C-l> <Right>

" C-p: FZF find files
nnoremap <silent> ;f :Files<CR>

" C-g: FZF ('g'rep)/find in files
nnoremap <silent> ;g :Rg<CR>

" focus NERDTREE
nnoremap <silent> ;n :NERDTreeFocus<CR>
" -------------------------------------------------------
" ------ COLORSCHEME ------------------------------------
" -------------------------------------------------------
set termguicolors

" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_contrast_light='hard'
" colorscheme gruvbox
" hi LspCxxHlGroupMemberVariable guifg=#83a598

" color rose-pine
" color darcula
colorscheme handmade
" colorscheme solarized8
" set background=light
" color black-and-white
" color pablo
" color darkblue
" colorscheme twilight
" colorscheme black-and-white
" colorscheme gruvbox
" color concoctis

autocmd VimEnter * wincmd p












