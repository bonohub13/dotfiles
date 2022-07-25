function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, {
        noremap = true,
        silent = true
    })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

-- Generate tags
-- To use this feature, run the following command under /usr/include
-- $ ctags -f ~/.config/nvim/stdtags -R --c++-kinds=+p fields=+iaS --extra=+q
nmap('<C-L>',
    ':!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>'
)

-- Closing brackets and quotes
map('i', '\"', '\"\"<left>')
map('i', '\'', '\'\'<left>')
map('i', '(', '()<left>')
map('i', '[', '[]<left>')
map('i', '{', '{}<left>')

-- Telescope keybinds
map('n', 'ff',
    "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', 'fg',
    "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', 'fb',
    "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', 'fh',
    "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- Other keybinds
nmap('<F8>', '<cmd>TagbarToggle<CR>')
nmap('mp', '<cmd>MarkdownPreview<CR>')
nmap('tt', '<cmd>tabnew<CR>')
nmap('tn', '<cmd>tabnext<CR>')
nmap('tp', '<cmd>tabprevious<CR>')
nmap('bb', '<cmd>b <CR>')
nmap('bn', '<cmd>bnext<CR>')
nmap('bp', '<cmd>bprevious<CR>')
nmap('qq', '<cmd>quit!<CR>')
nmap('qa', '<cmd>quitall!<CR>')
nmap('st', '<cmd>split term:///usr/bin/zsh<CR>')
nmap('vt', '<cmd>vsplit term:///usr/bin/zsh<CR>')
nmap('nt', '<cmd>tabnew term:///usr/bin/zsh<CR>')

-- terminal mode
map('t', '<ESC>', '<C-\\><C-n>')
