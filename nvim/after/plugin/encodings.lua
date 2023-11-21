local filepath = vim.api.nvim_buf_get_name(0)
local strip_encoding = function()
    local enc_ = enc .. [[,]]
    local _enc = [[,]] .. enc
    local fenc_tmp = vim.opt.fileencodings

    if string.match(path, pattern) then
        -- Remove encoding from vim.opt.fileencodings if buffer is under a
        -- specific directory
        if string.match(fenc_tmp, _enc) then
            vim.opt.fileencodings = string.gsub(fenc_tmp, _enc, [[]])
        elseif string.match(fenc_tmp, enc_) then
            vim.opt.fileencodings = string.gsub(fenc_tmp, enc_, [[]])
        elseif string.match(fenc_tmp, enc) then
            vim.opt.fileencodings = string.gsub(fenc_tmp, enc, [[]])
        else
            print(enc .. [[ is not included in vim.opt.fileencodings]])
            print([[\fileencodings: ]] .. fenc_tmp)
        end
    end
end

for _, set in ipairs(vim.g.blocklist_pattern) do
    strip_encoding(filepath, set[1], set[2])
end
