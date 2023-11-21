local options = {
    path = [[.,**,/usr/include,../include/**]],
}

for k, v in pairs(options) do
    vim.opt_local[k] = v
end
