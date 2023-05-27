vim.cmd[[set include=^\s*\(from\|import\)\s*\zs(\s\+\s\{-}\)*\ze\($\| as \)]]

local function pyinclude(fname)
    local parts = vim.fn.split(fname, [[import]])
    local l = parts[1]
    local joined = [[]]

    if vim.fn.len(parts) > 1 then
        local r = parts[2]

        joined = l .. [[.]] .. r

        local fp = vim.fn.substitute(joined, [[\.]], [[/]], [[g]]) .. [[.py]]
        local found = vim.fn.glob(fp, true)

        if string.len(found) > 0 then
            return found
        end
    end

    return vim.fn.substitute(joined, [[\.]], [[/]], [[g]]) .. [[.py]]
end

local options = {
    path        = [[.,**,/usr/include]],
    wildignore  = [[*.pyc]],
    includeexpr = pyinclude(vim.cmd[[v:fname]])
}

for k, v in pairs(options) do
    vim.bo[k] = v
end
