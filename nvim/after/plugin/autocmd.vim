augroup BracketOrQuoteAutoWrap
    autocmd FileType lua,vim,html,xml,markdown inoremap <buffer> < <><left>
    autocmd FileType * if &ft != 'rust' | inoremap <buffer> ' ''<left>| endif
augroup END
augroup ReadCurrentLuaFile
    autocmd FileType lua nnoremap <buffer> <C-r> :luafile %<CR>
augroup END
