-- vim.o  -> global options
-- vim.wo -> window options
-- vim.bo -> buffer options (Set with global as well)
-- vim.g  -> global variables
-- vim.b  -> buffer/local variables

local global    = vim.o
local window    = vim.wo
local buffer    = vim.bo
local optional  = vim.opt
local g_var     = vim.g
local b_var     = vim.b
local map       = vim.api.nvim_set_keymap

-- Path
vim.cmd([[
    let $RTP=split(&runtimepath, ',')[0]
    set path=.,/usr/include/,**
]])

-- Color settings
map('c', '3636', '<c-u>undo<CR>', {noremap = true})
global.termguicolors = true
vim.cmd([[
    syntax enable
    set t_Co=256
    highlight Normal  guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
]])

-- filetype
vim.cmd([[
    filetype plugin indent on
    set ignorecase
]])

-- Indent settings
global.autoindent       = true
buffer.autoindent       = true
global.smartindent      = true
buffer.smartindent      = true
global.tabstop          = 4
buffer.tabstop          = 4
global.softtabstop      = 4
buffer.softtabstop      = 4
global.shiftwidth       = 4
global.expandtab        = true
global.smarttab         = true
optional.listchars      = {space = '_', tab = '|-'}
global.list             = true
-- global.ambiwidth     = 'double'
global.encoding         = 'utf-8'
window.colorcolumn      = '80'

-- Local settings for closing brackets
global.showmatch        = true

-- Autocompletion (vim default feature)
global.compatible       = false
global.tags             = '~/.config/nvim/stdtags,tags,.tags,../tags'

-- Rust
g_var.rustfmt_autosave  = 1

-- nobackup/swap files
global.backup   = false
global.swapfile = false

-- Show line numbers
global.number           = true
global.relativenumber   = true
global.cursorline       = true

-- Netrw variables
g_var.netrw_banner      = 0
g_var.netrw_liststyle   = 3
g_var.netrw_winsize     = 15
g_var.NetrwIsOpen       = 0

-- Tagbar
g_var.tagbar_ctags_bin  = '/usr/bin/ctags'
g_var.tagbar_width      = 25

-- Markdown preview
g_var.mkdp_auto_start           = 0
g_var.mkdp_auto_close           = 1
g_var.mkdp_refresh_slow         = 0
g_var.mkdp_command_for_global   = 0
g_var.mkdp_open_to_the_world    = 0
g_var.mkdp_open_ip              = ''
g_var.mkdp_browser              = ''
g_var.mkdp_echo_preview_url     = 1
g_var.mkdp_browserfunc          = ''
g_var.mkdp_port                 = '8080'

-- Default settings
global.mouse            = 'a'
global.hlsearch         = false
global.ignorecase       = true
global.smartcase        = true
global.wildignorecase   = true
