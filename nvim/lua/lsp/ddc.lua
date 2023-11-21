local call_function = function(func, opts)
    vim.api.nvim_call_function(func, opts)
end
local ddc_custom_patch_global = function(mode, trigger)
    call_function([[ddc#custom#patch_global]], {
        mode,
        trigger,
    })
end
local ddc_custom_patch_filetype = function(source, mode, trigger)
    call_function([[ddc#custom#patch_filetype]], {
        source,
        mode,
        trigger,
    })
end
local imap = function(key, cmd, opts)
    vim.keymap.set([[i]], key, cmd, opts)
end

local opts = {
    noremap = true,
    silent  = true,
}

call_function([[signature_help#enable]], {})

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
        forceCompletionPattern  = [[\S/\S*]],
        isVolatile              = true,
    }
})
ddc_custom_patch_global([[sourceParams]], {
    ["around"] = {
        maxSize = 500,
    },
    ["nvim-lsp"] = {
        kindLabels = {
            Class = [[c]],
        },
    },
})

ddc_custom_patch_filetype({
    [[lua]],
    [[vim]],
    [[c]],
    [[cpp]],
    [[rust]],
    [[go]],
    [[python]],
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
    inoremap <silent><expr> <TAB> pum#visible()
        \ ? '<cmd>call pum#map#insert_relative(+1)<CR>'
        \ : (col('.') <= 1 <Bar><Bar> getline('.')[col('.')-2] =~# '\s')
        \ ? '<TAB>'
        \ : ddc#map#manual_complete()
]])
imap([[<S-Tab>]],   [[<cmd>call pum#map#insert_relative(-1)<CR>]])
imap([[<C-n>]],     [[<cmd>call pum#map#insert_relative(+1)<CR>]])
imap([[<C-p>]],     [[<cmd>call pum#map#insert_relative(-1)<CR>]])
imap([[<PageDown>]],[[<cmd>call pum#map#insert_relative(+1)<CR>]])
imap([[<PageUp>]],  [[<cmd>call pum#map#insert_relative(-1)<CR>]])

call_function([[ddc#enable]], {})
