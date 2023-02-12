local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'folke/lazy.nvim',
    },
    -- LSP
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        -- Rust
        'rust-lang/rust.vim',
        'simrat39/rust-tools.nvim',
        -- Lua (for Neovim plugin development only)
        'folke/neodev.nvim',
        -- GLSL
        'tikhomirov/vim-glsl',
    },
    -- Debugger
    {
        'mfussenegger/nvim-dap'
        -- 'puremourning/vimspector'
    },
    -- Ctag stuff
    {
        'preservim/tagbar',
    },
    -- ddc
    {
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
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/nvim-treesitter-refactor',
        lazy = false,
        config = function()
            vim.cmd([[TSUpdate]])
        end,
    },
    -- Markdown preview
    {
        'iamcco/markdown-preview.nvim',
        lazy = false,
        config = function()
            vim.cmd([[call mkdp#util#install()]])
        end,
    },
    -- Looks
    --  Colorschemes
    {
        'dracula/vim',
        'morhetz/gruvbox',
        'folke/tokyonight.nvim',
    },
    --  Tools
    --      lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        lazy = false,
        config = function()
            require('lualine').setup {
                theme = 'tokyonight',
            }
        end,
    },
    --      bufferline
    {
        'akinsho/bufferline.nvim',
        tag = 'v3.0.0',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        }
    },
    --      undo tree
    {
        'jiaoshijie/undotree',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('undotree').setup()
        end,
    },
    {
        url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        lazy = false,
        config = function()
            require('lsp_lines').setup()
        end,
    }
})
