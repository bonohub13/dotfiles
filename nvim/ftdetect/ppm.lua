local autocmd = vim.api.nvim_create_autocmd


autocmd({[[BufReadCmd]]}, {
    pattern = [[*.ppm]],
    callback = function()
        local file = vim.fn.expand([[%]])

        os.execute([[feh ]] .. file)
        vim.cmd([[bdelete]], {silent = true})
    end
})
