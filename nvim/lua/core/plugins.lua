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
        branch = [[main]],
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
        -- Lua (for Neovim plugin development only)
        [[folke/neodev.nvim]],
        -- GLSL
        [[tikhomirov/vim-glsl]],
    },
    --  Rust
    {
        [[rust-lang/rust.vim]],
        [[simrat39/rust-tools.nvim]],
        ft = [[rust]],
        config = function()
            require([[lsp.rust_tools]])
        end
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
        [[Shougo/ddc-source-shell-native]],
        [[Shougo/ddc-ui-pum]],
        [[Shougo/pum.vim]],
        [[matsui54/denops-signature_help]],
        [[vim-denops/denops.vim]],
    },
    -- hex editor/viewer
    {
        [[RaafatTurki/hex.nvim]],
        lazy    = false,
        config  = function()
            require([[hex]]).setup()
        end,
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
    -- Neogit
    {
        [[NeogitOrg/neogit]],
        dependencies = {
            [[nvim-lua/plenary.nvim]],
            [[nvim-telescope/telescope.nvim]],
            [[sindrets/diffview.nvim]],
            [[ibhagwan/fzf-lua]],
        },
        config = true,
    }
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
