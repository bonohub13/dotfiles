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
        use {
            'vim-airline/vim-airline',
            'vim-airline/vim-airline-themes',
        }

        -- Ctag stuff
        use {
            'preservim/tagbar',
        }

        -- ddc
        use {
            'Shougo/neoinclude.vim',
            'Shougo/ddc.vim',
            'Shougo/ddc-around',
            'Shougo/ddc-matcher_head',
            'Shougo/ddc-sorter_rank',
            'Shougo/ddc-nvim-lsp',
            'vim-denops/denops.vim',
            'matsui54/denops-popup-preview.vim',
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
        }

        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

            config = function()
                require("lsp_lines").setup()
            end,
        })
    end
)
