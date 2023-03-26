-- Path
vim.cmd([[
    let $RTP=split(&runtimepath, ',')[0]
]])

-- Color settings
vim.cmd([[
    set t_Co=256
    highlight Normal  guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
]])

-- filetype
vim.cmd([[
    filetype plugin indent on
]])

local options = {
    -- color stuff
    termguicolors   = true,
    syntax          = 'enable',

    -- indent stuff
    autoindent      = true,
    smartindent     = true,
    tabstop         = 4,
    softtabstop     = 4,
    shiftwidth      = 4,
    expandtab       = true,
    smarttab        = true,
    listchars       = {space = '_', tab = '|-'},

    -- encoding stuff
    encoding        = 'utf-8',
    -- ambiwidth       = 'double',

    -- autocompletion
    compatible      = false,
    tags            = {'~/.config/nvim/stdtags', 'tags', '.tags', '../tags'},

    -- nobackup/swapfiles
    backup          = false,
    swapfile        = false,

    -- Show line numbers
    number          = true,
    relativenumber  = true,
    cursorline      = true,

    -- other stuff
    list            = true,
    showmatch       = true,
    mouse           = 'a',
    hlsearch        = false,
    ignorecase      = true,
    smartcase       = true,
    wildignorecase  = true,
    colorcolumn     = '80',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
vim.opt.path:append("**")
for k, v in pairs(vim.opt.path) do
    print(k, v)
end

local g_var_options = {
    -- leader key
    mapleader       = ' ',

    -- tagbar stuff
    tagbar_ctags_bin            = '/usr/bin/ctags',
    tagbar_width                = 25,

    -- Netrw variables
    netrw_banner                = 0,
    netrw_liststyle             = 3,
    netrw_winsize               = 15,
    NetrwIsOpen                 = 1,

    -- Markdown preview
    mkdp_auto_start             = 1,
    mkdp_auto_close             = 1,
    mkdp_refresh_slow           = 0,
    mkdp_command_for_global     = 0,
    mkdp_open_to_the_world      = 1,
    mkdp_open_ip                = '',
    mkdp_browser                = '',
    mkdp_echo_preview_url       = 1,
    mkdp_browserfunc            = '',
    mkdp_port                   = '8080',
    mkdp_theme                  = 'dark',
    mkdp_filetypes              = {'markdown'},

    -- rust-tools settings
    rustfmt_autosave            = 1
}

for k, v in pairs(g_var_options) do
    vim.g[k] = v
end
