vim.opt.termguicolors = true

require([[bufferline]]).setup({
    options = {
        diagnostics = [[nvim_lsp]],
        separator_style = [[slant]]
    }
})
