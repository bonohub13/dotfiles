local dap = require('dap')
local extension_path= vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/'
local codelldb_path = extension_path .. 'codelldb'
local liblldb_path  = extension_path .. 'extension/lldb/lib/liblldb.so'

local opts = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = "/home/kensuke/.local/share/nvim/mason/bin/codelldb",
        args = {"--port",  "${port}"},
    }
}

require('rust-tools').setup(opts)
