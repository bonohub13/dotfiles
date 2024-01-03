local lspconfig         = require([[lspconfig]])
local neodev_opts   = {
    setup_jsonls = true,
    override = function(root_dir, lib)
        if require([[neodev.util]]).has_file(root_dir, [[/.config/nvim]]) then
            lib.enabled = true
            lib.plugins = true
            lib.runtime = true
            lib.types   = true
        end
    end,
    library = {
        plugins = {[[nvim-dap-ui]]},
        types = true,
    },
}

require([[neodev]]).setup(neodev_opts)
require([[mason]]).setup()
require([[mason-lspconfig]]).setup()
if vim.fn.executable([[glsl_analyzer]]) == 1 then
    require([[lspconfig]]).glsl_analyzer.setup{}
end
require([[mason-lspconfig]]).setup_handlers({
    function(server_name)
        require([[lspconfig]])[server_name].setup({})
    end,
    ["rust_analyzer"] = function()
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
        })
    end,
})
