lua require 'init'

"===== color settings ====="
cnoremap 3636 <c-u>undo<CR>
syntax enable
set t_Co=256
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=none ctermbg=none

"===== simple stuff ====="
let $RTP=split(&runtimepath, ',')[0]
set path=.,/usr/include/,**

"===== LSP code completion ====="

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ==== for html/xml files, 2 spaces ====="
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.xml setlocal ts=2 softtabstop=2 sw=2
    autocmd BufNewFile,BufRead *.html setlocal ts=2 softtabstop=2 sw=2
    autocmd BufNewFile,BufRead *.yaml setlocal ts=2 softtabstop=2 sw=2
    autocmd BufNewFile,BufRead *.txt setlocal ts=2 softtabstop=2 sw=2
augroup END

"local settings for closing brackets"
augroup fileTypeClosingBrackets
    autocmd!
    autocmd BufNewFile,BufRead *        inoremap < <
    autocmd BufNewFile,BufRead *.md     inoremap < <><left>
    autocmd BufNewFile,BufRead *.vim    inoremap < <><left>
    autocmd BufNewFile,BufRead .vimrc   inoremap < <><left>
augroup END

" netrw stuff "
" Special thanks to...
" Brodie Robertson
" for this script to use netrw
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

colorscheme dracula

filetype plugin indent on
syntax on
set ignorecase

call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': { 'matchers': ['matcher_head'] },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
    \ })
call ddc#custom#patch_global('sourceParams', {
    \ 'nvim-lsp': { 'kindLabels': {'Class': 'c'} },
    \ })
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
    \   'clangd': {'mark': 'c'},
    \ })
call ddc#custom#patch_filetype('go', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('java', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype(['rust', 'rs', 'Cargo.toml'], 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
    \   'around': {'maxSize': 100},
    \ })

inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

inoremap <expr><S-TAB> ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
call ddc#enable()

autocmd VimEnter,TabNew * nested :TagbarOpen
