local options = {
    colorcolumn = 100,
    path        = [[.,**,/usr/include,../include/**]],
}

for k, v in pairs(options) do
    vim.bo[k] = v
end
