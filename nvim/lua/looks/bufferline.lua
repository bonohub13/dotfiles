vim.opt.termguicolors = true

require([[bufferline]]).setup({
    options = {
        diagnostics = [[nvim-lsp]],
        separator_style = [[slant]]
    }
})
