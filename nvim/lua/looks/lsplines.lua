require([[lsp_lines]]).setup()

-- Disable virtual text to avoid duplication
vim.diagnostic.config({
    virtual_text = false,
})
