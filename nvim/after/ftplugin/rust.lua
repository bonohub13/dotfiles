local function nmap(shortcut, command, buffer)
    vim.keymap.set("n", shortcut, command, {buffer=buffer})
end
local rt = require('rust-tools')

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

vim.g.rustfmt_autosave = 1

require('rust-tools').inlay_hints.set()
require('rust-tools').inlay_hints.enable()
