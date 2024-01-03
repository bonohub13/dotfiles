require([[dapui]]).setup()

local map = vim.keymap.set
local dap = require([[dap]])
local dapui = require([[dapui]])

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

map([[n]], [[<Leader>db]], [[<cmd>DapToggleBreakpoint<CR>]], {silent = true})
map([[n]], [[<Leader>dt]], [[<cmd>DapTerminate<CR>]], {silent = true})
map([[n]], [[<Leader>do]], [[<cmd>DapStepOver<CR>]], {silent = true})
