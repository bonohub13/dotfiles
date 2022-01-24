-- vim.o  -> global options
-- vim.wo -> window options
-- vim.bo -> buffer options (Set with global as well)
-- vim.g  -> global variables
-- vim.b  -> buffer/local variables

local global = vim.o
local window = vim.wo
local buffer = vim.bo
local g_var = vim.g
local b_var = vim.b

-- Color settings
global.termguicolors = true

-- Indent settings
global.autoindent = true
buffer.autoindent = true
global.smartindent = true
buffer.smartindent = true
global.tabstop = 4
buffer.tabstop = 4
global.softtabstop = 4
buffer.softtabstop = 4
global.shiftwidth = 4
global.expandtab = true
global.smarttab = true
global.encoding = 'utf-8'
window.colorcolumn = '80'

-- Local settings for closing brackets
global.showmatch = true

-- Autocompletion (vim default feature)
global.compatible = false
global.tags = '~/.config/nvim/stdtags,tags,.tags,../tags'
require('lspconfig').clangd.setup{}
require('lspconfig').cmake.setup{}

-- nobackup/swap files
global.backup = false
global.swapfile = false

-- Show line numbers
global.number = true
global.cursorline = true

-- Netrw variables
g_var.netrw_banner = 0
g_var.netrw_liststyle = 3
g_var.netrw_winsize = 15
g_var.NetrwIsOpen = 0

-- Airline-vim
g_var['airline#extensions#tabnine#enabled'] = 1
g_var['airline#extensions#tabline#formatter'] = 'default'
g_var['airline#extensions#tmuxline#enabled'] = '0'
g_var.airline_theme = 'dracula'
g_var.airline_powerline_fonts = 1

-- Tagbar
g_var.tagbar_ctags_bin = '/usr/bin/ctags'

-- Markdown preview
g_var.mkdp_auto_start = 1
g_var.mkdp_auto_close = 1
g_var.mkdp_refresh_slow = 0
g_var.mkdp_command_for_global = 0
g_var.mkdp_open_to_the_world = 0
g_var.mkdp_open_ip = ''
g_var.mkdp_browser = ''
g_var.mkdp_echo_preview_url = 0
g_var.mkdp_browserfunc = ''
g_var.mkdp_port = '8080'

-- Default settings
global.mouse = 'a'
global.hlsearch = false
