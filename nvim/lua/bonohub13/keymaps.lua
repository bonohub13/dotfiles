local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, {
        noremap = true,
        silent  = true,
    })
end

local function cmap(shortcut, command)
    vim.api.nvim_set_keymap([[c]], shortcut, command, {
        noremap = true,
    })
end

-- keys to disable
local disabled_keys = {
    [[<F2>]],
    [[<F3>]],
    [[<F4>]],
    [[<F5>]],
    [[<F6>]],
    [[<F7>]],
    [[<F8>]],
    [[<F9>]],
    [[<F10>]],
    [[<F11>]],
    [[<F12>]],
    [[<F16>]],
}

-- keymaps for normal mode
local normal_mode = {
    -- Generate ctags
    {[[<C-L>]],[[<cmd>!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>]]},

    -- Telescope keybinds
    {[[ff]], [[<cmd>lua require('telescope.builtin').find_files()<CR>]]},
    {[[fg]], [[<cmd>lua require('telescope.builtin').live_grep()<CR>]]},
    {[[fb]], [[<cmd>lua require('telescope.builtin').buffers()<CR>]]},
    {[[fh]], [[<cmd>lua require('telescope.builtin').help_tags()<CR>]]},

    -- Tagbar
    {[[<F8>]], [[<cmd>TagbarToggle<CR>]]},

    -- Markdown preview
    {[[mp]], [[<cmd>MarkdownPreview<CR>]]},

    -- tab
    {[[tt]], [[<cmd>tabnew<CR>]]},
    {[[tn]], [[<cmd>tabnext<CR>]]},
    {[[tp]], [[<cmd>tabprevious<CR>]]},

    -- buffer
    {[[<A-b>]], [[:buffer ]]},
    {[[bn]], [[<cmd>bnext<CR>]]},
    {[[bp]], [[<cmd>bprevious<CR>]]},

    -- Terminal
    {[[ht]], [[<cmd>sp | term<CR>]]},
    {[[vt]], [[<cmd>vs | term<CR>]]},
    {[[nt]], [[<cmd>tabnew | term<CR>]]},

    -- quit
    {[[qq]], [[<cmd>quit!<CR>]]},
    {[[qa]], [[<cmd>quitall!<CR>]]},

    -- LSP
    {[[<S-k>]], [[<cmd>lua vim.lsp.buf.hover()<CR>]]},

    -- undo tree
    {[[<leader>u]], [[<cmd>lua require('undotree').toggle()<CR>]]},

    -- Debugging
    {[[en]], [[<cmd>lua vim.diagnostic.goto_next()<CR>]]},
    {[[ep]], [[<cmd>lua vim.diagnostic.goto_prev()<CR>]]},
}
    -- {[[]], [[<cmd><CR>]]}

-- keymaps for insert mode
local insert_mode = {
    -- closing brackets and quotes
    {[["]], [[""<left>]]},
    {[[(]], [[()<left>]]},
    {[[[]], [[[]<left>]]},
    {[[{]], [[{}<left>]]},
}

local terminal_mode = {
    {[[<ESC>]], [[<C-\><C-n>]]},
}

for _, key in ipairs(disabled_keys) do
    map([[i]], key, [[<Nop>]])
    cmap(key, [[<Nop>]])
end

for _, set in ipairs(normal_mode) do
    map([[n]], set[1], set[2])
end

for _, set in ipairs(insert_mode) do
    map([[i]], set[1], set[2])
end

for _, set in ipairs(terminal_mode) do
    map([[t]], set[1], set[2])
end
