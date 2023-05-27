local treesitter_options = {
    foldmethod  = [[expr]],
    foldexpr    = [[nvim_treesitter#foldexpr()]],
}

local opts = {
    ensure_installed = {
        [[lua]],
        [[toml]],
        [[rust]],
        [[c]],
        [[cpp]],
        [[python]],
    },
    auto_install    = true,
    highlight = {
        enable  = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable          = true,
        extended_mode   = true,
        max_file_lines  = nil,
    },
    -- requires nvim-treesitter-refactor
    refactor = {
        highlight_definitions = {
            enable                  = true,
            clear_on_cursor_move    = true,
        },
        highlight_current_scope = {
            enable = true,
        },
        navigation = {
            enable  = true,
            keymaps = {
                goto_definition         = [[<a-d>]],
                list_definitions        = [[s-l]],
                list_definitions_toc    = [[<a-t>]],
            },
        },
    },
}

require([[nvim-treesitter.configs]]).setup(opts)
require([[treesitter-context]]).setup()

for k, v in pairs(treesitter_options) do
    vim.wo[k] = v
end
