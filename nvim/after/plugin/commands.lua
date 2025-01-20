local exists = function(path)
    local f = io.open(path, "r")

    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end
local create_user_command = vim.api.nvim_create_user_command

create_user_command([[Make]], function(opts)
        local splitbelow = vim.opt.splitbelow

        vim.opt.splitbelow = true
        vim.cmd(string.format(
            [[15 sp term:///usr/bin/make %s]],
            opts.fargs[1]
        ))
        vim.opt.splitbelow = splitbelow
    end,
    { nargs = 1 }
)

if exists([[/usr/bin/bat]]) then
    create_user_command([[Bat]], function(opts)
            vim.cmd(string.format(
                [[sp term:///usr/bin/bat -pp %s]],
                opts.fargs[1]
            ))
        end,
        { nargs = 1, complete = [[file]] }
    )
    create_user_command([[VBat]], function(opts)
            vim.cmd(string.format(
                [[vs term:///usr/bin/bat -pp %s]],
                opts.fargs[1]
            ))
        end,
        { nargs = 1, complete = [[file]] }
    )
    create_user_command([[TBat]], function(opts)
            vim.cmd(string.format(
                [[tabnew term:///usr/bin/bat -pp %s]],
                opts.fargs[1]
            ))
        end,
        { nargs = 1, complete = [[file]] }
    )
end

if exists([[/usr/bin/git]]) then
    create_user_command([[GitLog]], function()
            vim.cmd([[sp term:///usr/bin/git log --format=\"\%h \%s\"]])
        end ,{
        nargs = 0
    })
end

if exists([[/usr/bin/feh]]) then
    create_user_command([[Feh]], function(opts)
            os.execute(string.format(
                [[feh %s]],
                opts.fargs[1]
            ))
        end, {
            nargs = 1, complete = [[file]]
    })
end
