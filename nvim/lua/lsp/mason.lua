local nmap = function(key, cmd, buffer)
    vim.api.nvim_set_keymap([[n]], key, cmd, {
        silent  = true,
        noramap = true,
        buffer  = buffer
    })
end

local rust_tools        = require([[rust-tools]])
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
}
local rust_tools_opts = {
    server = {
        settings = {
            ["rust-analyzer"] = {
                inlayHints  = {
                    localtionLinks = false
                },
            },
        },
        on_attach = function(_, bufnr)
            nmap([[<C-space>]], rust_tools.hover_actions, bufnr)
            nmap([[<Leader>a]], rust_tools.code_action_group.code_action_group, bufnr)
        end,
        tools = {
            hover_action = {
                auto_focus = true,
            },
        },
    },
}

require([[neodev]]).setup(neodev_opts)
require([[rust-tools]]).setup(rust_tools_opts)
require([[mason]]).setup()
require([[mason-lspconfig]]).setup()
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

rust_tools.inlay_hints.set()
rust_tools.inlay_hints.enable()
