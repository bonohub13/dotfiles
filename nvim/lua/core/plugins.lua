local lazypath  = vim.fn.stdpath([[data]]) .. [[lazy/lazy.nvim]]

local plugins   = {
    [[folke/lazy.nvim]],
    -- colorschemes
    {
        [[folke/tokyonight.nvim]],
        opts = {
            style = [[moon]],
            transparent = true,
        },
    },
    -- lualine
    {
        [[nvim-lualine/lualine.nvim]],
        dependencies = {
            [[nvim-tree/nvim-web-devicons]],
        },
        opts = {
            theme = [[tokyonight]],
        },
    },
    -- bufferline
    {
        [[akinsho/bufferline.nvim]],
        version = [[*]],
        dependencies = {
            [[nvim-tree/nvim-web-devicons]],
        },
        opts = {
            options = {
                diagnostics = [[nvim_lsp]],
                separator_style = [[slant]],
            },
        },
    },
    -- Treesitter
    {
        {
            [[nvim-treesitter/nvim-treesitter]],
            lazy = false,
            opts = {
                ensure_installed = {
                    [[lua]],
                    [[rust]],
                    [[toml]],
                    [[c]],
                    [[cpp]],
                    [[python]]
                },
                auto_install = true,
                highlight = {
                    enable  = true,
                    additional_vim_regex_highlighting = false,
                },
                ident = {
                    enable  = true,
                },
                rainbow = {
                    enable          = true,
                    extended_mode   = true,
                    max_file_lines  = nil,
                },
            },
            dependencies = {
                {
                    [[nvim-treesitter/nvim-treesitter-context]],
                    opts = {},
                },
            }
        },
    },
    -- Telescope
    {
        [[nvim-telescope/telescope.nvim]],
        dependencies = {
            [[nvim-lua/plenary.nvim]],
            {
                [[nvim-telescope/telescope-fzf-native.nvim]],
                build = [[make]],
            },
        },
    },
    -- LSP
    {
        {
            [[mason-org/mason-lspconfig.nvim]],
            dependencies = {
                {
                    [[mason-org/mason.nvim]],
                    opts = {},
                },
                [[neovim/nvim-lspconfig]],
            },
            opts = {
                ensure_installed = {
                    [[rust_analyzer]],
                    [[clangd]]
                },
            }
        },
        -- Lua (for Neovim plugin development only)
        {
            [[folke/lazydev.nvim]],
            ft = [[lua]],
            dependencies = {
                {
                    [[DrKJeff16/wezterm-types]],
                    lazy = true,
                    version = false,
                },
            },
            opts = {
                library = {
                    [[/usr/share/nvim/runtime/lua/*]],
                    [[lazy.nvim]],
                    { path = [[${3rd}/luv/library]], words = { [[vim%.uv]] } },
                    { path = [[wezterm-types]], mods = { [[wezterm]] } },
                },
            },
        },
        -- GLSL
        [[tikhomirov/vim-glsl]],
        --  Rust
        {
            [[rust-lang/rust.vim]],
            init = function()
                vim.g.rustfmt_autosave = 1
            end
        },
        {
            [[mrcjkb/rustaceanvim]],
            version = '^6',
            lazy = false,
            ft = [[rust]],
            init = function()
                vim.g.rustaceanvim = {
                    cmd = function()
                        local mason_registry = require([[mason-registry]])

                        if mason_registry.is_installed([[rust-analyzer]]) then
                            local ra = mason_registry.get_package([[rust-analyzer]])
                            local ra_filename = ra:get_receipt():get().links.bin["rust-analyzer"]

                            return { ([[%s/%s]]):format(ra:get_install_path(), ra_filename or [[rust-analyzer]]) }
                        else
                            return { [[rust-analyzer]] }
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
        },
    },
    -- Debugger
    {
        [[mfussenegger/nvim-dap]],
        [[rcarriga/nvim-dap-ui]],
        [[ldelossa/nvim-dap-projects]]
    },
    -- ddc
    {
        [[Shougo/ddc.vim]],
        [[Shougo/ddc-filter-converter_remove_overlap]],
        [[Shougo/ddc-filter-matcher_head]],
        [[Shougo/ddc-filter-matcher_length]],
        [[Shougo/ddc-filter-sorter_rank]],
        [[Shougo/ddc-source-around]],
        [[Shougo/ddc-source-lsp]],
        [[Shougo/ddc-source-shell_native]],
        [[Shougo/ddc-ui-pum]],
        [[Shougo/pum.vim]],
        [[matsui54/denops-signature_help]],
        [[vim-denops/denops.vim]],
    },
    -- hex editor/viewer
    {
        [[RaafatTurki/hex.nvim]],
        opts = {},
    },
    -- Ctags
    {
        [[preservim/tagbar]],
    },
    -- Markdown preview
    {
        [[iamcco/markdown-preview.nvim]],
        lazy    = false,
        config  = function()
            vim.cmd([[call mkdp#util#install()]])
        end,
    },
    -- undotree
    {
        [[jiaoshijie/undotree]],
        opts = {},
        keys = {
            { [[<leader>ut]], function()
                require([[undotree]]).toggle()
            end },
        }
    },
    -- Neogit
    {
        [[NeogitOrg/neogit]],
        dependencies = {
            [[nvim-lua/plenary.nvim]],
            [[sindrets/diffview.nvim]],
            [[nvim-telescope/telescope.nvim]],
        },
        cmd = [[Neogit]],
        keys = {
            { [[<leader>ng]], [[<cmd>Neogit<cr>]], desc = [[Show Neogit UI]] },
        }
    }
}

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        [[git]],
        [[clone]],
        [[--filter=blob:none]],
        [[https://github.com/folke/lazy.nvim.git]],
        [[--branch=stable]],
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require([[lazy]]).setup(plugins)
