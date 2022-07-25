vim.cmd('packadd packer.nvim')

return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'
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
        use 'neovim/nvim-lspconfig'
        use 'vim-denops/denops.vim'

        -- fuzzy finder
        use {
            -- Reqires ripgrep to use live_grep
            'nvim-telescope/telescope.nvim',
            requires = {{
                'nvim-lua/plenary.nvim'
            }}
        }

        -- Markdown preview
        use 'iamcco/markdown-preview.nvim'

        -- Colorschemes
        use 'dracula/vim'
        use 'morhetz/gruvbox'

        -- LSP
        use 'rust-lang/rust.vim'
        use 'tikhomirov/vim-glsl'
    end
)
