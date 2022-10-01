vim.cmd('packadd packer.nvim')

return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }

        -- vim-airline
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'

        -- Tagbar
        use 'preservim/tagbar'

        -- ddc
        use 'Shougo/neoinclude.vim'
        use 'Shougo/ddc.vim'
        use 'Shougo/ddc-around'
        use 'Shougo/ddc-matcher_head'
        use 'Shougo/ddc-sorter_rank'
        use 'Shougo/ddc-nvim-lsp'
        use 'vim-denops/denops.vim'

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

        -- Markdown preview
        use 'iamcco/markdown-preview.nvim'

        -- Colorschemes
        use 'dracula/vim'
        use 'morhetz/gruvbox'

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
            'folke/lua-dev.nvim',
            -- GLSL
            'tikhomirov/vim-glsl',
        }

        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

            config = function()
                require("lsp_lines").setup()
            end,
        })
    end
)
