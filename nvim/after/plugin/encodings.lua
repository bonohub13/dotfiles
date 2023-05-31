local function strip_encoding(path, pattern, enc)
    local enc_  = enc .. [[,]]
    local _enc  = [[,]] .. enc
    local fenc_tmp  = vim.o.fileencodings

    if string.match(path, pattern) then
        -- Remove encoding from vim.o.fileencodings if buffer is under a specific
        -- path
        if string.match(fenc_tmp, _enc) then
            vim.o.fileencodings = string.gsub(fenc_tmp, _enc, [[]])
        elseif string.match(fenc_tmp, enc_) then
            vim.o.fileencodings = string.gsub(fenc_tmp, enc_, [[]])
        elseif string.match(fenc_tmp, enc) then
            vim.o.fileencodings = string.gsub(fenc_tmp, enc, [[]])
        else
            print(enc .. [[ is not included in fileencodings]])
            print([[\tfileencodings: ]] .. fenc_tmp)
        end
    end
end

local filepath = vim.api.nvim_buf_get_name(0)

for pattern, enc in pairs(vim.g.blocklist_pattern) do
    strip_encoding(filepath, pattern, enc)
end
