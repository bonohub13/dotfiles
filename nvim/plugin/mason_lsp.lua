-- LSP setttings
require("mason").setup()
local mason_lspconfig=require("mason-lspconfig")
local lspconfig=require("lspconfig")

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup{}
    end,

    ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            settings = {
                ['rust-analyzer'] = {
                    assist = {
                        importantGranularity = "module",
                        importPrefix = "self",
                    },
                    cargo = {
                        lodOutDirsFromCheck = true
                    },
                    procMacro = {
                        enable = true
                    },
                }
            }
        })
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end,
    ["cmake"] = function()
        lspconfig.cmake.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end,
    ["jdtls"] = function()
        lspconfig.jtdls.setup{
            cmd = { 'jdtls' },
            root_dir = function(fname)
                return require('lspconfig').util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
            end
        }
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup(require('lua-dev').setup {
            settings = {
                format = {
                    enable = true
                },
                hint = {
                    enable = true,
                    arrayIndex = "Auto",
                    await = true,
                    paramName = "Disable",
                    paramType = false,
                    semicolon = "Disable",
                    setType = true,
                },
                lua = {
                    diagnostics = {
                        globals = {'vim', 'use'},
                    }
                }
            }
        })
    end,
})
