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
            'Shougo/neoinclude.vim',
            'Shougo/ddc.vim',
            'Shougo/ddc-ui-native',
            'Shougo/ddc-source-around',
            'Shougo/ddc-source-nvim-lsp',
            'Shougo/pum.vim',
            'tani/ddc-fuzzy',
            'vim-denops/denops.vim',
            'matsui54/denops-popup-preview.vim',
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
            'nvim-treesitter/nvim-treesitter-refactor'
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
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

            config = function()
                require("lsp_lines").setup()
            end,
        })
    end
)
