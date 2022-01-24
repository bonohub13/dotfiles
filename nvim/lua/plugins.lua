vim.cmd('packadd packer.nvim')

return require('packer').startup(
    function()
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

        -- Markdown preview
        use 'iamcco/markdown-preview.nvim'

        -- Colorschemes
        use 'dracula/vim'
        use 'morhetz/gruvbox'
    end
)
