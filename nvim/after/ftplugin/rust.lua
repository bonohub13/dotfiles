local rt = require([[rust-tools]])
local opts = {
    rustfmt_autosave = 1,
}
local rt_opts = {
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set([[n]], [[<C-space>]], rt.hover_actions.hover_actions, {
                buffer = bufnr,
            })
            vim.keymap.set([[n]], [[<Leader>a]], rt.code_action_group.code_action_group, {
                buffer = bufnr,
            })
        end,
    }
}

for k, v in pairs(opts) do
    vim.bo[k] = v
end

rt.setup(rt_opts)
rt.inlay_hints.set()
rt.inlay_hints.enable()
