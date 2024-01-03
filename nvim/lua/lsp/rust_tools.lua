local nmap = function(key, cmd, buffer)
    vim.api.nvim_set_keymap([[n]], key, cmd, {
        silent  = true,
        noramap = true,
        buffer  = buffer
    })
end
local HOME = os.getenv([[HOME]]) .. [[/]]
local MASON_PATH = HOME .. [[.local/share/nvim/mason/packages/]]
local codelldb = MASON_PATH .. [[codelldb/extension/adapter/codelldb]]
local liblldb = MASON_PATH .. [[codelldb/extension/lldb/lib/liblldb.so]]
local rust_tools = require([[rust-tools]])

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            -- nmap([[<S-k>]], rust_tools.hover_actions.hover_actions, bufnr)
            -- nmap([[<C-a>]], rust_tools.code_action_group.code_action_group, bufnr)
        end,
    },
    tools = {
        hover_action = {
            auto_focus = true,
        },
    },
    dap = {
        adapter = require([[rust-tools.dap]]).get_codelldb_adapter(codelldb, liblldb)
    }
})
rust_tools.inlay_hints.set()
rust_tools.inlay_hints.enable()
