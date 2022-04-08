-- alias
--  > global    = vim.o    global options
--  > g_var     = vim.g     global variables
--  > api       = vim.api

local global    = vim.o
local g_var     = vim.g
local api       = vim.api

-- Variables
--  > Full path of file in buffer
local filepath          = api.nvim_buf_get_name(0)
--  > Sets of encodings to detect by default
global.fileencodings    = 'ucs-bom,utf-8,default,latin1,cp932,sjis'
--  > blocklist_pattern
--  > List of substrings of path to use for 'swith'
g_var.blocklist_pattern = {
-- This tells it to strip 'latin1' from fileencodings
-- if full path of buffer includes the substring 'hogehoge'
--  ['latin1'] = 'hogehoge'
}

-- Functions
--  > Strip any encoding from fileencodings (fencs) if buffer is under a certain
--  > path (full path)
--  > This was originally implemented to prevent SJIS and CP932 encoding falsely
--  > recognized as 'latin1'
local strip_encoding = function(path, pattern, enc)
    local cmd       = api.nvim_command
    local enc_      = enc .. ','
    local _enc      = ',' .. enc
    local fenc_tmp  = global.fileencodings

    if string.match(path, pattern) then
        -- Remove encoding from global.fileencodings if buffer is under specific
        -- path
        if string.match(fenc_tmp, _enc) then
            global.fileencodings = string.gsub(fenc_tmp, _enc, '')
        elseif string.match(fenc_tmp, enc_) then
            global.fileencodings = string.gsub(fenc_tmp, enc_, '')
        elseif string.match(fenc_tmp, enc) then
            global.fileencodings = string.gsub(fenc_tmp, enc, '')
        else
            print(enc .. ' is not included in fileencodings')
            print('\tfileencodings: ' .. fenc_tmp)
        end
    end
end

-- Settings
--  > Strip encoding from fileencodings
for enc, pattern in pairs(g_var.blocklist_pattern) do
    strip_encoding(filepath, pattern, enc)
end
