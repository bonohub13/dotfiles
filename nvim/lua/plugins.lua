vim.cmd('packadd packer.nvim')

return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }

        -- Ctag stuff
        use {
            'preservim/tagbar',
        }

        -- ddc
        use {
            'Shougo/ddc.vim',
            'Shougo/ddc-ui-pum',
            'Shougo/pum.vim',
            'Shougo/ddc-source-around',
            'Shougo/ddc-source-nvim-lsp',
            'Shougo/ddc-source-zsh',
            'Shougo/ddc-matcher_head',
            'Shougo/ddc-matcher_length',
            'Shougo/ddc-sorter_rank',
            'Shougo/ddc-converter_remove_overlap',
            'vim-denops/denops.vim',
            'matsui54/denops-signature_help',
        }

        -- fuzzy finder
        use {
            -- Reqires ripgrep to use live_grep
            'nvim-telescope/telescope.nvim',
            requires = {{
                'nvim-lua/plenary.nvim'
            }}
        }

        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-refactor',
            run = ':TSUpdate',
        }

        -- Debugger
        use {
            'mfussenegger/nvim-dap'
            -- 'puremourning/vimspector'
        }

        -- LSP
        use {
            -- Rust
            'rust-lang/rust.vim',
            'simrat39/rust-tools.nvim',
            -- Lua (for Neovim plugin development only)
            'folke/neodev.nvim',
            -- GLSL
            'tikhomirov/vim-glsl',
        }

        -- Markdown preview
        use 'iamcco/markdown-preview.nvim'

        -- Looks
        --  Colorschemes
        use {
            'dracula/vim',
            'morhetz/gruvbox',
            'folke/tokyonight.nvim',
        }

        --  Tools
        --  lualine
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        --  bufferline
        use {
            'akinsho/bufferline.nvim',
            tag = "v3.*",
            requires = { 'kyazdani42/nvim-web-devicons' }
        }

        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

            config = function()
                require("lsp_lines").setup()
            end,
        })
    end
)
