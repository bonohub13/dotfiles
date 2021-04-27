"===== color settings ====="
syntax enable
set t_Co=256
set bg=dark
colorscheme gruvbox 

"===== indent settings =====" 
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" ==== for html/xml files, 2 spaces ====="
augroup fileTypeIndent
	autocmd!
    autocmd BufNewFile,BufRead *.py setlocal ts=4 softtabstop=4 sw=4
	autocmd BufNewFile,BufRead *.xml setlocal ts=2 softtabstop=2 sw=2
	autocmd BufNewFile,BufRead *.html setlocal ts=2 softtabstop=2 sw=2
	autocmd BufNewFile,BufRead *.yaml setlocal ts=2 softtabstop=2 sw=2
	autocmd BufNewFile,BufRead *.txt setlocal ts=2 softtabstop=2 sw=2
augroup END

"===== closing brackets ====="
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"local settings for closing brackets"
augroup fileTypeClosingBrackets
    autocmd!
    autocmd BufNewFile,BufRead *.md inoremap < <><left>
    autocmd BufNewFile,BufRead *.html inoremap < <><left>
augroup END

set showmatch

"===== nobackup files ====="
set nobackup
set noswapfile

"===== show line number =====" 
set number
set cursorline

"===== default settings =====" 
filetype plugin on
filetype indent on

set mouse=a

" neocomplete " 
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#skip_auto_completion_time = ""

" normal settings " 
nmap tt :terminal<CR>
nmap tv :vertical terminal<CR>
nmap sp :split<CR>
nmap vp :vsplit<CR>
nnoremap nw <C-w><C-w>p
nnoremap wp <C-w>p
nmap ND :NERDTREE<CR>
"let g:vimade.detecttermcolors=0"
