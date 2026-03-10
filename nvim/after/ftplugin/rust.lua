local autocmd = vim.api.nvim_create_autocmd

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]

    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end

        return default_diagnostic_handler(err, result, context, config)
    end
end

autocmd({ 'BufEnter' }, {
    pattern = { 'build.rs' },
    callback = function()
        local ns = vim.lsp.diagnostic.get_namespace(
            vim.lsp.get_clients({ name = 'rust-analyzer' })[1].id
        )

        vim.diagnostic.enable(false, { ns_id = ns, bufnr = 0 })
    end
})
