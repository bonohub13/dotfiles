local autocmd = vim.api.nvim_create_autocmd
local map = function(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, {
        noremap = true,
        silent  = true,
        buffer  = true,
    })
end

-- Virtual Text
autocmd({ 'WinEnter' }, {
    callback = function()
        local floating = vim.api.nvim_win_get_config(0).relative ~= ''

        vim.diagnostic.config({
            virtual_text = floating,
            virtual_lines = not floating,
        })
    end,
})

-- BracketOrQuotesAutoWrap
autocmd({ 'FileType' }, {
    pattern = { 'lua', 'vim', 'html', 'xml', 'markdown' },
    callback = function()
        map('i', '<', '<><left>')
    end,
})
autocmd({ 'FileType' }, {
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'rust' then
            map('i', '\'', '\'\'<left>')
        end
    end,
})

-- GNU make
autocmd({ 'BufEnter', 'WinEnter' }, {
    pattern = 'term:///usr/bin/make',
    callback = function()
        vim.cmd('startinsert!')
    end,
})
autocmd({ 'BufLeave' }, {
    pattern = 'term:///usr/bin/make',
    callback = function()
        vim.cmd('stopinsert!')
    end,
})

autocmd({ 'VimEnter', 'TabNewEntered' }, {
    pattern = { '*' },
    callback = function()
        if vim.bo.filetype ~= 'gitcommit' then
            require('outline').open({ focus_outline = false })
        end
    end
})
autocmd({ 'FileType' }, {
    pattern = { 'rust', 'wgsl' },
    callback = function()
        vim.treesitter.start()
        vim.bo.syntax = 'on'
    end
})

-- RunOnWrite
autocmd({ 'BufWritePre' }, {
    pattern = { '*.wgsl', '*.go', '*.rs', '*.lua', '*.vim', '*.c', '*.py', '*.sh', '*.slang' },
    callback = function()
        vim.lsp.buf.format()
    end
})
