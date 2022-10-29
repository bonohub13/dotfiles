call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_fuzzy'],
    \   'sorters': ['sorter_fuzzy'],
    \   'converters': ['converter_fuzzy'],
    \ },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
    \ })
call ddc#custom#patch_global('sourceParams', {
    \ 'nvim-lsp': { 'kindLabels': {'Class': 'c'} },
    \ 'around': {'maxSize': 500},
    \ })
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp'])
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
\ pum#visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

inoremap <expr><S-TAB> pum#visible() ? '<C-p>' : '<C-h>'
call ddc#enable()
call popup_preview#enable()
call signature_help#enable()

let g:signature_help_config = { 'style': "virtual" }
