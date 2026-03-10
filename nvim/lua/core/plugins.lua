local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'

local plugins  = {
    'folke/lazy.nvim',
    -- colorschemes
    {
        'folke/tokyonight.nvim',
        opts = {
            style = 'moon',
            transparent = true,
        },
        opts_extend = { 'sources.default' },
    },
    -- noice
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {},
        opts_extend = { 'sources.default' },
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
    },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            theme = 'tokyonight',
        },
        opts_extend = { 'sources.default' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    -- bufferline
    {
        'akinsho/bufferline.nvim',
        version = '*',
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                separator_style = 'slant',
            },
        },
        opts_extend = { 'sources.default' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    -- Treesitter
    {
        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            opts = {
                ensure_installed = {
                    'lua',
                    'rust',
                    'toml',
                    'c',
                    'cpp',
                    'python'
                },
                auto_install = true,
                highlight = {
                    enable                            = true,
                    additional_vim_regex_highlighting = false,
                },
                ident = {
                    enable = true,
                },
                rainbow = {
                    enable         = true,
                    extended_mode  = true,
                    max_file_lines = nil,
                },
            },
            opts_extend = { 'sources.default' },
            dependencies = {
                {
                    'nvim-treesitter/nvim-treesitter-context',
                    opts = {},
                },
            }
        },
    },
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        opts = {
            pickers = {
                lsp_document_symbols = {
                    symbol_width = 50,
                    show_line = true,
                    trim_next = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.35,
                        height = 0.9,
                        prompt_position = 'top',
                    }
                }
            }
        },
        opts_extend = { 'sources.default' },
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
    },
    -- Outline
    {
        'hedyhli/outline.nvim',
        opts = {
            outline_window = {
                width = 10,
                auto_width = {
                    max_width = 10,
                },
                auto_close = true,
            },
        },
        opts_extend = { 'sources.default' },
    },
    -- LSP
    {
        {
            'mason-org/mason-lspconfig.nvim',
            opts = {
                ensure_installed = {
                    'rust_analyzer',
                    'clangd'
                },
            },
            opts_extend = { 'sources.default' },
            dependencies = {
                {
                    'mason-org/mason.nvim',
                    opts = {},
                },
                'neovim/nvim-lspconfig',
            },
        },
        -- Lua (for Neovim plugin development only)
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    vim.env.VIMRUNTIME .. '/lua',
                    'lazy.nvim',
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    { path = 'wezterm-types',      mods = { 'wezterm' } },
                },
            },
            opts_extend = { 'sources.default' },
            dependencies = {
                {
                    'DrKJeff16/wezterm-types',
                    lazy = true,
                    version = false,
                },
            },
        },
        -- GLSL
        'tikhomirov/vim-glsl',
        --  Rust
        {
            'rust-lang/rust.vim',
            init = function()
                vim.g.rustfmt_autosave = 1
            end
        },
        {
            'mrcjkb/rustaceanvim',
            version = '^6',
            lazy = false,
            ft = 'rust',
            init = function()
                vim.g.rustaceanvim = {
                    cmd = function()
                        local mason_registry = require('mason-registry')

                        if mason_registry.is_installed('rust-analyzer') then
                            local ra = mason_registry.get_package('rust-analyzer')
                            local ra_filename = ra:get_receipt():get().links.bin["rust-analyzer"]

                            return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
                        else
                            return { 'rust-analyzer' }
                        end
                    end,
                    tools = {},
                    server = {
                        on_attach = function(_, _)
                        end,
                        default_settings = {
                            ["rust-analyzer"] = {},
                        },
                    },
                    ra_multiplex = {
                        enable = true,
                    }
                }
            end,
            opts_extend = { 'sources.default' },
        },
    },
    -- Debugger
    {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'ldelossa/nvim-dap-projects'
    },
    -- autocompletion
    {
        'saghen/blink.cmp',
        version = '1.*',
        opts = {
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            per_filetype = {
                lua = { inherit_defaults = true, 'lazydev' },
            },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                },
                snippets = {
                    opts = {
                        friendly_snippets = true,
                    }
                }
            }
        },
        opts_extend = { 'sources.default' },
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
    },
    -- hex editor/viewer
    {
        'RaafatTurki/hex.nvim',
        opts = {},
        opts_extend = { 'sources.default' },
    },
    -- Markdown preview
    {
        'OXY2DEV/markview.nvim',
        opts = {
            preview = {
                icon_provider = 'devicons',
            },
        },
        opts_extend = { 'sources.default' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'selimacerbas/markdown-preview.nvim',
        opts = {},
        opts_extend = { 'sources.default' },
        dependencies = {
            'selimacerbas/live-server.nvim',
        }
    },
    -- undotree
    {
        'jiaoshijie/undotree',
        keys = {
            { '<leader>ut', function()
                require('undotree').toggle()
            end },
        },
        opts = {},
        opts_extend = { 'sources.default' },
    },
    -- Neogit
    {
        'NeogitOrg/neogit',
        cmd = 'Neogit',
        keys = {
            { '<leader>ng', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
    }
}

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins)
