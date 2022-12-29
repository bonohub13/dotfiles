-- LSP setttings
require("mason").setup()
local mason_lspconfig   = require("mason-lspconfig")
local lspconfig         = require("lspconfig")
local rt = require('rust-tools')
local function nmap(shortcut, command, buffer)
    vim.keymap.set("n", shortcut, command, {buffer=buffer})
end

require('neodev').setup {
    setup_jsonls = true,
    override = function(root_dir, library)
        if require("neodev.util").has_file(root_dir, "/.config/nvim") then
            library.enabled = true
            library.plugins = true
            library.runtime = true
            library.types   = true
        end
    end,
}

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup{}
    end,

    ["rust_analyzer"] = function()
        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    nmap("<C-space>", rt.hover_actions.hover_actions, bufnr)
                    -- Code action groups
                    nmap("<Leader>a", rt.code_action_group.code_action_group, bufnr)
                end,
            },
        })

        require('rust-tools').inlay_hints.set()
        require('rust-tools').inlay_hints.enable()
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end,
    ["cmake"] = function()
        lspconfig.cmake.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end,
    ["jdtls"] = function()
        lspconfig.jtdls.setup{
            on_attach = on_attach,
            cmd = { 'jdtls' },
            root_dir = function(fname)
                return require('lspconfig').util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
            end
        }
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        })
    end,
})
