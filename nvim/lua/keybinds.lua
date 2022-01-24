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
    '<cmd>!tags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>'
)

-- Closing brackets and quotes
map('i', '\"', '\"\"<left>')
map('i', '\'', '\'\'<left>')
map('i', '(', '()<left>')
map('i', '[', '[]<left>')
map('i', '{', '{}<left>')

-- Other keybinds
nmap('<F8>', '<cmd>TagbarToggle<CR>')
nmap('tt', '<cmd>tabnew<CR>')
nmap('tn', '<cmd>tabnext<CR>')
nmap('tp', '<cmd>tabprevious<CR>')
nmap('qq', '<cmd>quit!<CR>')
nmap('qa', '<cmd>quitall!<CR>')
