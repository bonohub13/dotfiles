"===== color settings ====="
cnoremap 3636 <c-u>undo<CR>
syntax enable
set t_Co=256
set termguicolors
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=none ctermbg=none

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
    autocmd BufNewFile,BufRead *.vim inoremap < <><left>
    autocmd BufNewFile,BufRead .vimrc inoremap < <><left>
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
set nohlsearch

" neocomplete " 
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#skip_auto_completion_time = ""

" netrw stuff "
" Special thanks to...
" Brodie Robertson
" for this script to use netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3 
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright vnew' g:path
    :normal <C-l>
endfunction

function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright new' g:path
    :normal <C-l>
endfunction

function! NetrwMappings()
    noremap <buffer> <C-l> <C-w>l
    noremap <silent> <C-f> :call ToggleNetrw()<CR>
    noremap <buffer> V :call OpenToRight()<cr>
    noremap <buffer> H :call OpenBelow()<cr>
endfunction

augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :call ToggleNetrw()
augroup END

let g:NetrwIsOpen=0

" normal settings " 
nmap tt :terminal<CR>
nmap tv :vertical terminal<CR>
nmap sp :split<CR>
nmap vp :vsplit<CR>
nnoremap nw <C-w><C-w>p
nnoremap wp <C-w>p
