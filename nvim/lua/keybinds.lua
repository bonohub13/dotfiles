local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, {
        noremap = true,
        silent = true
    })
end

local function nmap(shortcut, command)
    map('n', shortcut, command)
end

local function imap(shortcut, command)
    map('i', shortcut, command)
end

local disabled_keys = {
    '<F2>',
    '<F3>',
    '<F4>',
    '<F5>',
    '<F6>',
    '<F7>',
    '<F8>',
    '<F9>',
    '<F10>',
    '<F11>',
    '<F12>',
    '<F16>',
}

for _, k in ipairs(disabled_keys) do
    map('i', k, '<Nop>')
    map('c', k, '<Nop>')
end

-- Generate tags
-- To use this feature, run the following command under /usr/include
-- $ ctags -f ~/.config/nvim/stdtags -R --c++-kinds=+p fields=+iaS --extra=+q
nmap('<C-L>',
    '<cmd>!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>'
)

-- Closing brackets and quotes
imap('\"', '\"\"<left>')
imap('(', '()<left>')
imap('[', '[]<left>')
imap('{', '{}<left>')

-- Telescope keybinds
nmap('ff',
    "<cmd>lua require('telescope.builtin').find_files()<CR>")
nmap('fg',
    "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nmap('fb',
    "<cmd>lua require('telescope.builtin').buffers()<CR>")
nmap('fh',
    "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- Other keybinds
nmap('<F8>', '<cmd>TagbarToggle<CR>')
nmap('mp', '<cmd>MarkdownPreview<CR>')
nmap('tt', '<cmd>tabnew<CR>')
nmap('tn', '<cmd>tabnext<CR>')
nmap('tp', '<cmd>tabprevious<CR>')
nmap('<A-b>', ':buffer ')
nmap('bn', '<cmd>bnext<CR>')
nmap('bp', '<cmd>bprevious<CR>')
nmap('qq', '<cmd>quit!<CR>')
nmap('qa', '<cmd>quitall!<CR>')
nmap('<S-k>', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap('<leader>u', '<cmd>lua require("undotree").toggle()<CR>')

-- Debugging
nmap('en', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nmap('ep', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

--  Terminal stuff
nmap('ht', '<cmd>split term:///usr/bin/zsh<CR>')
nmap('vt', '<cmd>vsplit term:///usr/bin/zsh<CR>')
nmap('nt', '<cmd>tabnew term:///usr/bin/zsh<CR>')

-- terminal mode
map('t', '<ESC>', '<C-\\><C-n>')
