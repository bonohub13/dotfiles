local function nmap(key, command, buffer)
    vim.keymap.set([[n]], key, command, {buffer=buffer})
end

require([[mason]]).setup()

local rust_tools        = require([[rust-tools]])
local lspconfig         = require([[lspconfig]])
local mason_registry    = require([[mason-registry]])
-- local codelldb          = mason_registry.get_package("codelldb")
-- local extension_path    = codelldb:get_install_path() .. "/extension/"
-- local codelldb_path     = extension_path .. "adapter/codelldb"
-- local liblldb_path      = extension_path .. "lldb/lib/liblldb.so"

local neodev_opts = {
    setup_jsonls    = true,
    override        = function(root_dir, library)
        if require([[neodev.util]]).has_file(root_dir, [[/.config/nvim]]) then
            library.enabled = true
            library.plugins = true
            library.runtime = true
            library.types   = true
        end
    end,
}

local rust_tools_opts = {
--     dap = {
--         adapter = rust_tools.dap.get_codelldb_adapter(codelldb_path, liblldb_path),
--     },
    server = {
        settings = {
            ["rust-analyzer"] = {
                inlayHints = { locationLinks = false },
            },
        },
        on_attach = function(_, bufnr)
            nmap([[<C-space>]], rust_tools.hover_actions.hover_actions, bufnr)
            nmap([[<Leader>a]], rust_tools.code_action_group.code_action_group, bufnr)
        end,
    },
    tools = {
        hover_actions = { auto_focus = true },
    },
}

require([[neodev]]).setup(neodev_opts)
require([[rust-tools]]).setup(rust_tools_opts)
require([[mason-lspconfig]]).setup()
require([[mason-lspconfig]]).setup_handlers({
    function(server_name)
        require([[lspconfig]])[server_name].setup{}
    end,
    ["rust_analyzer"] = function()
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
        })
    end,
    ["cmake"] = function()
        lspconfig.cmake.setup({
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
        })
    end,
    ["jdtls"] = function()
        lspconfig.jdtls.setup({
            on_attach = on_attach,
            cmd = { [[jdtls]] },
            root_dir = function(fname)
                return lspconfig.util.root_pattern(
                    [[pom.xml]],
                    [[gradle.build]],
                    [[.git]])(fname) or vim.fn.getcwd()
            end
        })
    end,
})

rust_tools.inlay_hints.set()
rust_tools.inlay_hints.enable()
