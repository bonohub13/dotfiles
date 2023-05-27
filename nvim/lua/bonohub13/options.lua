vim.cmd([[
    let $RTP=split(&runtimepath, ',')[0]
]])

vim.cmd([[
    set t_Co=256
    highlight Normal  guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
]])

vim.cmd([[
    filetype plugin indent on
]])

local options = {
    termguicolors   = true,
    syntax          = [[enable]],

    -- indent
    autoindent      = true,
    smartindent     = true,
    tabstop         = 4,
    softtabstop     = 4,
    shiftwidth      = 4,
    expandtab       = true,
    smarttab        = true,
    listchars       = {
        space   = [[_]],
        tab     = [[|-]],
    },

    -- encoding
    encoding        = [[utf-8]],
    -- ambiwidth    = [[double]],

    -- autocompletion
    compatible      = false,
    tags            = {
        [[~/.config/nvim/stdtags]],
        [[tags]],
        [[.tags]],
        [[../tags]],
    },

    -- backup/swapfiles
    backup          = false,
    swapfile        = false,

    -- show line numbers
    number          = true,
    relativenumber  = true,
    cursorline      = true,

    -- other
    list            = true,
    showmatch       = true,
    mouse           = [[a]],
    hlsearch        = false,
    ignorecase      = true,
    smartcase       = true,
    wildignorecase  = true,
    colorcolumn     = [[80]],
}

local global_options = {
    fileencodings = [[ucs-bom,utf-8,default,latin1,cp932,sjis]]
}

local g_var_options = {
    -- leader key
    mapleader                   = [[ ]],

    blocklist_pattern = {
    -- This tells Neovim to strip specific file encoding from "fileencodings"
    -- if full path of buffer inclludes the substring
    --  This example strips 'latin1' if full path of buffer includes the
    --  substring 'hoge'
    -- Ex) ["hoge"] = [[latin1]]
    },

    -- tagbar stuff
    tagbar_ctags_bin            = [[/usr/bin/ctags]],
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
    mkdp_open_ip                = [[]],
    mkdp_port                   = [[8080]],
    mkdp_filetypes              = {
        [[markdown]],
    },

    -- rust-tools settings
    rustfmt_autosave            = 1,

    -- ddc
    signature_help_config       = {
        style = [[virtual]],
    },
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(g_var_options) do
    vim.g[k] = v
end

for k, v in pairs(global_options) do
    vim.o[k] = v
end
