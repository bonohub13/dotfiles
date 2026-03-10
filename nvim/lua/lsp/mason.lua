local lspconfig = require('mason-lspconfig')

if vim.fn.executable('glsl_analyzer') == 1 then
    vim.lsp.enable('glsl_analyzer')
end

for _, lsp in ipairs(lspconfig.get_installed_servers()) do
    vim.lsp.enable(lsp)
end
