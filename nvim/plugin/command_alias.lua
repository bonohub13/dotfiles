local aliases = {
    make = 'split term:///usr/bin/make',
}

for alias, cmd in pairs(aliases) do
    vim.cmd(string.format('cnoreabbrev %s %s', alias, cmd))
end
