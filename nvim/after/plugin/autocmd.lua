local function augroup(group_name)
    return vim.api.nvim_create_augroup(group_name, {clear = true})
end

local bracket_or_quote_auto_wrap = augroup([[BracketOrQuoteAutoWrap]])
local read_current_lua_file = augroup([[ReadCurrentLuaFile]])

-- BracketOrQuoteAutoWrap
vim.api.nvim_create_autocmd({[[FileType]]}, {
    pattern = [[lua,vim,html,xml,markdown]],
    group   = bracket_or_quote_auto_wrap,
    command = [[inoremap <buffer> < <><left>]],
})
vim.api.nvim_create_autocmd({[[FileType]]}, {
    pattern = [[*]],
    group   = bracket_or_quote_auto_wrap,
    command = [[if &ft != 'rust' | inoremap <buffer> ' ''<left>| endif]],
})

-- ReadCurrentLuaFile
vim.api.nvim_create_autocmd({[[FileType]]}, {
    pattern = [[lua]],
    group   = read_current_lua_file,
    command = [[nnoremap <buffer> <C-r> <cmd>luafile %<CR>]]
})

vim.api.nvim_create_autocmd({[[InsertLeave]]}, {
    pattern = [[*]],
    command = [[if pumvisible() == 0|pclose|endif]]
})
vim.api.nvim_create_autocmd({[[BufEnter]], [[WinEnter]]}, {
    pattern = [[term:///usr/bin/make]],
    command = [[:startinsert!]]
})
vim.api.nvim_create_autocmd({[[BufLeave]]}, {
    pattern = [[term:///usr/bin/make]],
    command = [[:stopinsert!]]
})

vim.api.nvim_create_autocmd({[[VimEnter]], [[TabNew]]}, {
    pattern = [[* nested]],
    command = [[:TagbarOpen]],
})
