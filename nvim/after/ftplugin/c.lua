local options = {
    path        = [[.,**,/usr/include,../include/**]],
}
local window_options = {
    colorcolumn = 100,
}

for k, v in pairs(options) do
    vim.bo[k] = v
end
for k, v in pairs(window_options) do
    vim.wo[k] = v
end
