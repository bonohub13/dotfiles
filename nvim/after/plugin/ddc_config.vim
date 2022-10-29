call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
    \   '_': {
    \     'ignoreCase': v:true,
    \     'matchers': ['matcher_fuzzy'],
    \     'sorters': ['sorter_fuzzy'],
    \   },
    \   'around': {'mark': 'A'},
    \   'nvim-lsp': {
    \     'mark': 'lsp',
    \     'forceCompletionPattern': '\.\w*|:\w*|->\w*',
    \     'dup': 'force',
    \   },
    \ })
call ddc#custom#patch_global('sourceParams', {
    \   'nvim-lsp': { 'kindLabels': {'Class': 'c'} },
    \   'around': {'maxSize': 500},
    \   'matcher_fuzzy': {
    \     'splitMode': 'word'
    \   },
    \ })
call ddc#custom#patch_filetype([
    \     'c',
    \     'cpp',
    \     'go',
    \     'java',
    \     'vim',
    \     'lua',
    \     'javacript',
    \     'docker',
    \     'dockerfile',
    \     'rust',
    \     'bash',
    \     'sh',
    \   ], 'sources', ['nvim-lsp'],
    \ )
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
    \   'around': {'maxSize': 100},
    \ })
call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter',
    \ 'TextChangedI',
    \ 'TextChangedP',
    \ 'TextChangedT',
    \ 'CmdlineEnter',
    \ 'CmdlineChanged',
    \ ])
call ddc#custom#patch_global('ui', 'pum')

inoremap <silent><expr> <TAB>
    \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
    \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
    \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab>      <Cmd>call pum#map#insert_relative(-1)<CR>

inoremap <C-n>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>      <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>      <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>      <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

let g:signature_help_config = { 'style': "virtual" }

call popup_preview#enable()
call signature_help#enable()
call ddc#enable()
