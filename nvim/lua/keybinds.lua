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

-- Generate tags
-- To use this feature, run the following command under /usr/include
-- $ ctags -f ~/.config/nvim/stdtags -R --c++-kinds=+p fields=+iaS --extra=+q
nmap('<C-L>',
    '<cmd>!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>'
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
--  Terminal stuff
nmap('ht', '<cmd>split term:///usr/bin/zsh<CR>')
nmap('vt', '<cmd>vsplit term:///usr/bin/zsh<CR>')
nmap('nt', '<cmd>tabnew term:///usr/bin/zsh<CR>')
--  nvim-dap Keybinds
-- nmap('<F5>', '<cmd>call vimspector#Launch()<CR>')
-- nmap('<F6>', '<cmd>call vimspector#Reset()<CR>')
-- nmap('<F10>', '<cmd>call vimspector#StepOver()<CR>')
-- nmap('<F11>', '<cmd>call vimspector#StepInto()<CR>')
-- nmap('<F12>', '<cmd>call vimspector#StepOut()<CR>')
-- nmap('<A-b>', ':call vimspector#ToggleBreakpoint()<CR>')
-- nmap('<A-w>', ':call vimspector#AddWatch()<CR>')
-- nmap('<A-e>', ':call vimspector#Evaluate()<CR>')

-- terminal mode
map('t', '<ESC>', '<C-\\><C-n>')
