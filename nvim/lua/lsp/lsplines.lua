require([[lsp_lines]]).setup()

-- Disable regular virtual text diagnostics to avoid duplication
vim.diagnostic.config({
    virtual_text = false,
})
