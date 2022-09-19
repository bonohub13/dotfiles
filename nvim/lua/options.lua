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
    colorscheme dracula
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

-- LSP setttings
require("mason").setup()
local mason_lspconfig=require("mason-lspconfig")
local lspconfig=require("lspconfig")

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup{}
    end,

    ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            settings = {
                ['rust-analyzer'] = {
                    assist = {
                        importantGranularity = "module",
                        importPrefix = "self",
                    },
                    cargo = {
                        lodOutDirsFromCheck = true
                    },
                    procMacro = {
                        enable = true
                    },
                }
            }
        })
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end,
    ["cmake"] = function()
        lspconfig.cmake.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end,
    ["jdtls"] = function()
        lspconfig.jtdls.setup{
            cmd = { 'jdtls' },
            root_dir = function(fname)
                return require('lspconfig').util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
            end
        }
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup(require('lua-dev').setup {
            settings = {
                format = {
                    enable = true
                },
                hint = {
                    enable = true,
                    arrayIndex = "Auto",
                    await = true,
                    paramName = "Disable",
                    paramType = false,
                    semicolon = "Disable",
                    setType = true,
                },
                lua = {
                    diagnostics = {
                        globals = {'vim', 'use'},
                    }
                }
            }
        })
    end,
})

-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
    ensure_installed = {"lua", "rust", "toml"},
    auto_install = true,
    highlight = {
        enable = true,
        disable = {
            "c",
            "cpp",
            "rust",
            "go",
        },
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    -- Requires nvim-treesitter-refactor
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = {
            enable = true,
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "<a-d>",
                list_definitions = "<s-l>",
                list_definitions_toc = "<a-t>"
            }
        }
    }
}
--  Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Rust
g_var.rustfmt_autosave  = 1

-- nobackup/swap files
global.backup   = false
global.swapfile = false

-- Show line numbers
global.number       = true
global.cursorline   = true

-- Netrw variables
g_var.netrw_banner      = 0
g_var.netrw_liststyle   = 3
g_var.netrw_winsize     = 15
g_var.NetrwIsOpen       = 0

-- Airline-vim
g_var['airline#extensions#tabline#enabled']     = 1
g_var['airline#extensions#tabline#formatter']   = 'default'
g_var['airline#extensions#tmuxline#enabled']    = '0'
g_var.airline_theme                             = 'dracula'
g_var.airline_powerline_fonts                   = 1

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
