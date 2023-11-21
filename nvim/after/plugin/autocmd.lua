local augroup = function(group_name)
    return vim.api.nvim_create_augroup(group_name, {clear = true})
end
local autocmd = vim.api.nvim_create_autocmd

-- groups
local bracket_or_quotes_auto_wrap = augroup([[BracketOrQuotesAutoWrap]])
local gnu_make = augroup([[GnuMake]])

-- BracketOrQuotesAutoWrap
autocmd({[[FileType]]}, {
    pattern = [[lua,vim,html,xml,markdown]],
    group   = bracket_or_quotes_auto_wrap,
    command = [[inoremap <buffer> < <><left>]],
})
autocmd({[[FileType]]}, {
    pattern = [[*]],
    group   = bracket_or_quotes_auto_wrap,
    command = [[if &ft != 'rust' | inoremap <buffer> ' ''<left>]],
})

-- GNU make
autocmd({[[BufEnter]], [[WinEnter]]}, {
    pattern = [[term:///usr/bin/make]],
    group   = gnu_make,
    command = [[:startinsert!]],
})
autocmd({[[BufLeave]]}, {
    pattern = [[term:///usr/bin/make]],
    group   = gnu_make,
    command = [[:stopinsert!]],
})
