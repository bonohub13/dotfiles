require([[dapui]]).setup()

local dap, dapui = require([[dap]]), require([[dapui]])

dap.listeners.after.event_initialized.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set([[n]], [[<Leader>db]], [[<cmd>DapToggleBreakpoint<CR>]])
vim.keymap.set([[n]], [[<Leader>dt]], [[<cmd>DapTerminate<CR>]])
vim.keymap.set([[n]], [[<Leader>dn]], [[<cmd>DapStepOver<CR>]])
