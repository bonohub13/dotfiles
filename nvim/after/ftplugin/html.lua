local map        = vim.api.nvim_set_keymap
local buffer_var = vim.bo

buffer_var.tabstop      = 2
buffer_var.softtabstop  = 2
buffer_var.shiftwidth   = 2

map('i', '<', '<><left>', { noremap = true, silent = true })
