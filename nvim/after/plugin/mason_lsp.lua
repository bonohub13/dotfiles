-- LSP setttings
require("mason").setup()
local rust_tools        = require("rust-tools")
local mason_lspconfig   = require("mason-lspconfig")
local lspconfig         = require("lspconfig")
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

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
local opts = {
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                inlayHints = { locationLinks = false },
            },
        },
        on_attach = function(_, bufnr)
            -- Hover actions
            nmap("<C-space>", rust_tools.hover_actions.hover_actions, bufnr)
            -- Code action groups
            nmap("<Leader>a", rust_tools.code_action_group.code_action_group, bufnr)
        end,
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
}

require("rust-tools").setup(opts)
rust_tools.inlay_hints.set()
rust_tools.inlay_hints.enable()

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup{}
    end,

    ["rust_analyzer"] = function()
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
})
