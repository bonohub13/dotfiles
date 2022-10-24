call popup_preview#enable()

call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': { 'matchers': ['matcher_head'] },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
    \ })
call ddc#custom#patch_global('sourceParams', {
    \ 'nvim-lsp': { 'kindLabels': {'Class': 'c'} },
    \ })
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
    \   'clangd': {'mark': 'c'},
    \ })
call ddc#custom#patch_filetype('go', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('java', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('vim', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('lua', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('vim', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('javascript', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('[docker, dockerfile]', 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype(['rust', 'rs', 'Cargo.toml'], 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype(['bash', 'sh'], 'sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
    \   'around': {'maxSize': 100},
    \ })

inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

inoremap <expr><S-TAB> ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
call ddc#enable()
