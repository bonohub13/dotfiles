local options = {
    path        = [[.,**,/usr/include]],
}
local global_options = {
    wildignore  = [[*.pyc]],
}

for k, v in pairs(options) do
    vim.bo[k] = v
end
for k, v in pairs(global_options) do
    vim.go[k] = v
end
