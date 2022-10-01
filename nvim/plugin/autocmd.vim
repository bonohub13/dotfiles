augroup TriangleBracketAutoWrap
    autocmd FileType lua,vim,html,xml,markdown inoremap <buffer> < <><left>
augroup END
augroup ReadCurrentLuaFile
    autocmd FileType lua nnoremap <buffer> <C-r> :luafile %<CR>
augroup END
