local plugins = {
    [[folke/lazy.nvim]],
    -- LSP
    {
        [[williamboman/mason.nvim]],
        [[williamboman/mason-lspconfig.nvim]],
        [[neovim/nvim-lspconfig]],
        -- Rust
        [[rust-lang/rust.vim]],
        [[simrat39/rust-tools.nvim]],
        -- Lua (for Neovim plugin development only)
        [[folke/neodev.nvim]],
        -- GLSL
        [[tikhomirov/vim-glsl]],
    },
    -- Debugger
    {
        [[mfussenegger/nvim-dap]],
        [[rcarriga/nvim-dap-ui]],
    },
    -- Ctags stuff
    {
        [[preservim/tagbar]],
    },
    -- ddc (autocompletion)
    {
        [[Shougo/ddc.vim]],
        [[Shougo/ddc-converter_remove_overlap]],
        [[Shougo/ddc-matcher_head]],
        [[Shougo/ddc-matcher_length]],
        [[Shougo/ddc-source-around]],
        [[Shougo/ddc-source-nvim-lsp]],
        [[Shougo/ddc-source-zsh]],
        [[Shougo/ddc-sorter_rank]],
        [[Shougo/ddc-ui-pum]],
        [[Shougo/pum.vim]],
        [[matsui54/denops-signature_help]],
        [[vim-denops/denops.vim]],
    },
    -- Telescope
    {
        [[nvim-telescope/telescope.nvim]],
        dependencies = {
            [[nvim-lua/plenary.nvim]],
        },
    },
    -- Treesitter
    {
        [[nvim-treesitter/nvim-treesitter]],
        [[nvim-treesitter/nvim-treesitter-context]],
        [[nvim-treesitter/nvim-treesitter-refactor]],
        lazy    = false,
        config  = function()
            vim.cmd([[TSUpdate]])
        end,
    },
    -- Markdown preview
    {
        [[iamcco/markdown-preview.nvim]],
        lazy    = false,
        config  = function()
            vim.cmd([[call mkdp#util#install()]])
        end,
        dependencies = {
            [[zhaozg/vim-diagram]],
            [[aklt/plantuml-syntax]],
        },
    },
    -- lualine
    {
        [[nvim-lualine/lualine.nvim]],
        dependencies = {
            [[kyazdani42/nvim-web-devicons]],
        },
        lazy    = false,
        config  = function()
            require([[lualine]]).setup({
                theme = [[tokyonight]],
            })
        end,
    },
    -- bufferline
    {
        [[akinsho/bufferline.nvim]],
        tag = [[v3.0.0]],
        dependencies = {
            [[kyazdani42/nvim-web-devicons]],
        },
    },
    -- undotree
    {
        [[jiaoshijie/undotree]],
        lazy    = false,
        config  = function()
            require([[undotree]]).setup()
        end,
        dependencies = {
            [[nvim-lua/plenary.nvim]],
        },
    },
    -- lsplines
    {
        url     = [[https://git.sr.ht/~whynothugo/lsp_lines.nvim]],
        lazy    = false,
        config  = function()
            require([[lsp_lines]]).setup()
        end,
    },
    -- Colorschemes
    {
        [[dracula/vim]],
        [[morhetz/gruvbox]],
        [[folke/tokyonight.nvim]],
    },
}

local lazypath = vim.fn.stdpath([[data]]) .. [[lazy/lazy.nvim]]

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        [[git]],
        [[clone]],
        [[--filter=blob:none]],
        [[https://github.com/folke/lazy.nvim.git]],
        [[--branch=stable]],    -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require([[lazy]]).setup(plugins)
