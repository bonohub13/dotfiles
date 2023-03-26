local function exists(path)
    local f = io.open(path, "r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

vim.api.nvim_create_user_command('Make',
    function(opts)
        vim.cmd(string.format(
            'split term:///usr/bin/make %s',
            opts.fargs[1]
        ))
    end,
    { nargs = 1 }
)

if exists("/usr/bin/bat") then
    vim.api.nvim_create_user_command('Bat',
        function(opts)
            vim.cmd(string.format(
                'sp term:///usr/bin/bat -pp %s',
                opts.fargs[1]
            ))
        end,
        { nargs = 1, complete = 'file' }
    )
    vim.api.nvim_create_user_command('VBat',
        function(opts)
            vim.cmd(string.format(
                'vs term:///usr/bin/bat -pp %s',
                opts.fargs[1]
            ))
        end,
        { nargs = 1, complete = 'file' }
    )
    vim.api.nvim_create_user_command('TBat',
        function(opts)
            vim.cmd(string.format(
                'tabnew term:///usr/bin/bat -pp %s',
                opts.fargs[1]
            ))
        end,
        { nargs = 1, complete = 'file' }
    )
end
