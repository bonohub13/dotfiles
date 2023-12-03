local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local neogit_events = create_augroup([[NeogitEvents]], { clear=true })

create_autocmd([[User]], {
    pattern = [[NeogitPushComplete]],
    group = neogit_events,
    callback = require([[neogit]]).close,
})
