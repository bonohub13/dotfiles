local options = {
    tabstop     = 2,
    softtabstop = 2,
    shiftwidth  = 2,
}

for k, v in pairs(options) do
    vim.bo[k] = v
end
