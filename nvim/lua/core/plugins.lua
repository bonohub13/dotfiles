local lazypath  = vim.fn.stdpath([[data]]) .. [[lazy/lazy.nvim]]

local plugins   = {
    [[folke/lazy.nvim]],
    -- colorschemes
    {
        [[folke/tokyonight.nvim]],
    },
    -- lualine
    {
        [[nvim-lualine/lualine.nvim]],
        dependencies = {
            [[kyazdani42/nvim-web-devicons]],
        },
        lazy    = false,
    },
    -- bufferline
    {
        [[akinsho/bufferline.nvim]],
        tag = [[v3.0.0]],
        dependencies = {
            [[kyazdani42/nvim-web-devicons]],
        },
    },
    -- lsplines
    {
        url     = [[https://git.sr.ht/~whynothugo/lsp_lines.nvim]],
        lazy    = false,
    },
    -- Treesitter
    {
        [[nvim-treesitter/nvim-treesitter]],
        [[nvim-treesitter/nvim-treesitter-context]],
        [[nvim-treesitter/nvim-treesitter-refactor]],
        lazy    = false,
    },
    -- Telescope
    {
        [[nvim-telescope/telescope.nvim]],
        dependencies = {
            [[nvim-lua/plenary.nvim]],
        }
    },
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
    -- ddc
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
        dependencies = {
            [[nvim-lua/plenary.nvim]],
        },
        lazy    = false,
        config  = function()
            require([[undotree]]).setup()
        end
    },
}

if not vim.loop.fs_stat(lazypath) then
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
