local treeitter_options = {
    foldmethod  = [[expr]],
    foldexpr = [[nvim_treesitter#foldexpr()]],
}

local options = {
    ensure_installed = {
        [[lua]],
        [[rust]],
        [[toml]],
        [[c]],
        [[cpp]],
        [[python]]
    },
    auto_install = true,
    highlight = {
        enable  = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    ident = {
        enable  = true,
    },
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
                goto_definition         = [[<Leader>gd]],
                list_definitions        = [[<Leader>ld]],
                list_definitions_toc    = [[<Leader>ldt]],
            },
        },
    },
}

require([[nvim-treesitter.configs]]).setup(options)
require([[treesitter-context]]).setup()

for k, v in pairs(treeitter_options) do
    vim.wo[k] = v
end
