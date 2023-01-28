vim.api.nvim_create_user_command('Make',
    function(opts)
        vim.cmd(string.format(
            'split term:///usr/bin/make %s',
            opts.fargs[1]
        ))
    end,
    { nargs = 1 }
)
