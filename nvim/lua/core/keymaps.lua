local map = function(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, {
        noremap = true,
        silent  = true,
    })
end

local cmap = function(shortcut, command)
    vim.keymap.set([[c]], shortcut, command, {
        noremap = true,
    })
end

local imap = function(shortcut, command)
    map([[i]], shortcut, command)
end

local nmap = function(shortcut, command)
    map([[n]], shortcut, command)
end

local tmap = function(shortcut, command)
    map([[t]], shortcut, command)
end

local telescope = require([[telescope.builtin]])
local neogit = require([[neogit]])

-- keys to disable
local disabled_keys = {
    [[F2]],
    [[F3]],
    [[F4]],
    [[F5]],
    [[F6]],
    [[F7]],
    [[F8]],
    [[F9]],
    [[F10]],
    [[F11]],
    [[F12]],
    [[F13]],
    [[F14]],
    [[F15]],
    [[F16]],
}

-- keymaps for normal mode
local normal_mode = {
    -- Generate ctags
    {
        [[<C-l>]],
        [[<cmd>!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>]]
    },

    -- tabs
    {[[<Leader>tt]],    [[<cmd>tabnew<CR>]]},
    {[[<Leader>tn]],    [[<cmd>tabnext<CR>]]},
    {[[<Leader>tp]],    [[<cmd>tabprevious<CR>]]},

    -- buffers
    {[[<A-b>]],         [[<cmd>buffers<CR>]]},
    {[[<Leader>bn]],    [[<cmd>bnext<CR>]]},
    {[[<Leader>bp]],    [[<cmd>bprevious<CR>]]},

    -- terminal
    {[[ht]], [[<cmd>sp | term<CR>]]},
    {[[vt]], [[<cmd>vs | term<CR>]]},
    {[[nt]], [[<cmd>tabnew | term<CR>]]},

    -- window mode
    {[[<Leader>w]], [[<C-w>]]},

    -- quit
    {[[qq]], [[<cmd>quit!<CR>]]},
    {[[qa]], [[<cmd>quitall!<CR>]]},

    -- LSP
    {[[<S-k>]], function()
            vim.lsp.buf.hover()
    end},

    -- debugging
    {[[<Leader>en]], function() vim.diagnostic.goto_next() end},
    {[[<Leader>ep]], function() vim.diagnostic.goto_previous() end},

    -- Telescope
    {[[ff]], function() telescope.find_files() end},
    {[[fg]], function() telescope.live_grep() end},
    {[[fb]], function() telescope.buffers() end},
    {[[fh]], function() telescope.help_tags() end},

    -- Neogit
    {[[<Leader>no]], function() neogit.open() end},
    {[[<Leader>nc]], function() neogit.open({ [[commit]] }) end},

    -- Tagbar
    {[[<F8>]], [[<cmd>TagbarToggle<CR>]]},
}

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
    imap(key, [[<Nop>]])
    cmap(key, [[<Nop>]])
end

for _, set in ipairs(normal_mode) do
    nmap(set[1], set[2])
end

for _, set in ipairs(insert_mode) do
    imap(set[1], set[2])
end

for _, set in ipairs(terminal_mode) do
    tmap(set[1], set[2])
end
