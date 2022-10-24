-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
    ensure_installed = {"lua", "rust", "toml"},
    auto_install = true,
    highlight = {
        enable = true,
        disable = {
            "c",
            "cpp",
            "rust",
            "go",
        },
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    -- Requires nvim-treesitter-refactor
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = {
            enable = true,
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "<a-d>",
                list_definitions = "<s-l>",
                list_definitions_toc = "<a-t>"
            }
        }
    }
}

--  Treesitter context
require('treesitter-context').setup {}

--  Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
