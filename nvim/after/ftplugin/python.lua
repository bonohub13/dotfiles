local options = {
    path        = [[.,**,/usr/include]],
    wildignore  = [[*.pyc]],
}

for k, v in pairs(options) do
    vim.opt_local[k] = v
end
