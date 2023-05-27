local function ddc_custom_patch_global(mode, table)
    vim.api.nvim_call_function([[ddc#custom#patch_global]], {
        mode,
        table,
    })
end

local function ddc_custom_patch_filetype(source, mode, table)
    vim.api.nvim_call_function([[ddc#custom#patch_filetype]], {
        source,
        mode,
        table,
    })
end

local function imap(key, cmd)
    vim.keymap.set([[i]], key, cmd, {
        noremap = true,
        silent  = true,
    })
end

vim.api.nvim_call_function([[signature_help#enable]], {})

ddc_custom_patch_global([[autoCompleteEvents]], {
    [[InsertEnter]],
    [[TextChangedI]],
    [[TextChangedP]],
    [[TextChangedT]],
    [[CmdlineEnter]],
    [[CmdlineChanged]],
})
ddc_custom_patch_global([[ui]], [[pum]])
ddc_custom_patch_global([[sources]], {
    [[around]],
})
ddc_custom_patch_global([[sourceOptions]], {
    ["_"] = {
        ignoreCase  = true,
        matchers    = {
            [[matcher_head]],
            [[matcher_length]],
        },
        sorters     = {
            [[sorter_rank]],
        },
        converters  = {
            [[converter_remove_overlap]],
        },
    },
    ["around"] = {
        mark = [[A]],
    },
    ["nvim-lsp"] = {
        mark                    = [[lsp]],
        forceCompletionPattern  = [[\.\w*|:\w*|->\w*]],
        dup                     = [[force]],
    },
    ["zsh"] = {
        mark                    = [[zsh]],
        isVolatile              = true,
        forceCompletionPattern  = [[\S/\S*]]
    },
})
ddc_custom_patch_global([[sourceParams]], {
    ["around"] = {
        maxSize = 500,
    },
    ["nvim-lsp"] = {
        kindLabels = { Class = [[c]] },
    }
})

ddc_custom_patch_filetype({
    [[lua]],
    [[vim]],
    [[rust]],
    [[go]],
    [[python]],
    [[c]],
    [[cpp]],
    [[dockerfile]],
    [[cmake]],
    [[sh]],
    [[bash]],
    [[tex]],
    [[plaintex]],
}, [[sources]], {
    [[nvim-lsp]],
})
ddc_custom_patch_filetype({[[zsh]]}, [[sources]], {[[zsh]]})

-- Keymaps
vim.cmd([[
    inoremap <silent><expr> <TAB>
        \ pum#visible() ? '<cmd>call pum#map#insert_relative(+1)<CR>' :
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.')-2] =~# '\s') ?
        \ '<TAB>' : ddc#map#manual_complete()
]])

imap([[<S-Tab>]],       [[<cmd>call pum#map#insert_relative(-1)<CR>]])
imap([[<C-n>]],         [[<cmd>call pum#map#insert_relative(+1)<CR>]])
imap([[<C-p>]],         [[<cmd>call pum#map#insert_relative(-1)<CR>]])
imap([[<PageDown>]],    [[<cmd>call pum#map#insert_relative(+1)<CR>]])
imap([[<PageUp>]],      [[<cmd>call pum#map#insert_relative(-1)<CR>]])
imap([[<C-y>]],         [[<cmd>call pum#map#confirm()<CR>]])
imap([[<C-e>]],         [[<cmd>call pum#map#cancel()<CR>]])

vim.api.nvim_call_function([[ddc#enable]], {})
