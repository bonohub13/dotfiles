local treeitter_options = {
    foldmethod  = [[expr]],
    foldexpr = [[nvim_treesitter#foldexpr()]],
}

for k, v in pairs(treeitter_options) do
    vim.wo[k] = v
end
