call signature_help#enable()
let g:signature_help_config = {'style': "virtual"}

call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter',
    \ 'TextChangedI',
    \ 'TextChangedP',
    \ 'TextChangedT',
    \ 'CmdlineEnter',
    \ 'CmdlineChanged',
    \ ])
call ddc#custom#patch_global('ui', 'pum')

call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
    \   '_': {
    \       'ignoreCase': v:true,
    \       'matchers': ['matcher_head', 'matcher_length'],
    \       'sorters': ['sorter_rank'],
    \       'converters': ['converter_remove_overlap'],
    \   },
    \   'around': {'mark': 'A'},
    \   'nvim-lsp': {
    \       'mark': 'lsp',
    \       'forceCompletionPattern': '\.\w*|:\w*|->\w*',
    \       'dup': 'force',
    \   },
    \   'zsh': {
    \       'mark': 'zsh',
    \       'isVolatile': v:true,
    \       'forceCompletionPattern': '\S/\S*',
    \   }
    \ })
call ddc#custom#patch_global('sourceParams', {
    \   'around': {'maxSize': 500},
    \   'nvim-lsp': {
    \       'kindLabels': {'Class': 'c'}
    \   }
    \ })

call ddc#custom#patch_filetype([
    \   'lua',
    \   'vim',
    \   'rust',
    \   'go',
    \   'python',
    \   'c',
    \   'cpp',
    \   'dockerfile',
    \   'cmake',
    \   'sh',
    \   'bash',
    \   'tex',
    \   'plaintex',
    \ ], 'sources', ['nvim-lsp'])
call ddc#custom#patch_filetype('zsh', 'sources', ['zsh'])

inoremap <silent><expr> <TAB>
    \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
    \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
    \ '<TAB>' : ddc#map#manual_complete()

inoremap <S-Tab>    <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>      <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>      <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>      <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

call ddc#enable()
