-- background
vim.cmd[[
    set t_Co=256
    highlight Normal    guibg=NONE ctermbg=NONE
    highlight Nontext   guibg=NONE ctermbg=NONE
]]

-- filetype detection
vim.cmd[[
    filetype plugin indent on
]]

local clipboard = function()
    local clipboard = vim.opt.clipboard

    clipboard:append {[[unnamed]], [[unnamedplus]]}

    return clipboard
end

local options = {
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
    list            = true,

    -- line numbers
    number          = true,
    relativenumber  = true,
    cursorline      = true,

    -- visualize matching quotes and backets
    showmatch       = true,

    -- ignore case when using command mode etc.
    ignorecase      = true,
    wildignorecase  = true,
    smartcase       = true,

    -- Disable highlight for search
    hlsearch        = false,

    -- autocompletion
    compatible      = false,
    tags            = {
        [[~/.config/nvim/stdtags]],
        [[tags]],
        [[.tags]],
        [[../tags]],
        [[../.tags]],
    },

    -- show column limit (default 80 characters)
    colorcolumn     = [[80]],

    -- encoding
    encoding        = [[utf-8]],
    -- ambiwidth    = [[double]],
    fileencodings   = [[ucs-bom,utf-8,default,latin1,cp932,sjis]],

    -- disable folding
    foldenable      = false,

    -- etc
    termguicolors   = true,
    syntax          = [[enable]],
    mouse           = [[a]],
    clipboard       = clipboard(),
}

local plugin_options = {
    -- Leader key
    mapleader               = [[ ]],

    blocklist_pattern       = {
        -- This tells Neovim to strip specific file encoding from "fileencodings"
        -- if full path of buffer includes the substring
        --  This example strips 'latin1' if full path of buffer includes the
        --  substring 'hoge'
        -- Ex) ["hoge"] = [[latin1]],
    },

    -- Netrw variables
    netrw_banner            = 0,
    netrw_liststyle         = 3,
    netrw_winsize           = 15,
    NetrwIsOpen             = 1,

    -- rust-tools settings
    rustfmt_autosave        = 1,

    -- ctags
    tagbar_ctags_bin        = [[/usr/bin/ctags]],
    tagbar_width            = 25,

    -- Markdown preview
    mkdp_auto_start         = 1,
    mkdp_auto_close         = 1,
    mkdp_refresh_slow       = 1,
    mkdp_command_for_global = 0,
    mkdp_open_to_the_world  = 1,
    mkdp_open_ip            = [[]],
    mkdp_port               = [[8080]],
    mkdp_filetypes          = {
        [[markdown]],
    },

    -- ddc
    signature_help_config   = {
        [[virtual]],
    },
}


-- enable options
for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(plugin_options) do
    vim.g[k] = v
end
