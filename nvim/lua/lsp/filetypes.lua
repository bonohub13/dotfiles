local home = vim.fn.expand('$HOME')

vim.filetype.add({
    pattern = {
        [home .. '/.tmux/.*%.conf'] = 'tmux'
    }
})
