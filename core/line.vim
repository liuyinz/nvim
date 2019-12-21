let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'gitbranch','ro_hide', 'modified' ] ] ,
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fugi','fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'ro_hide': 'ReadonlyHide',
  \   'fugi':'fugitive#statusline'
  \ },
  \ }




" ReadonlyHide:
function! ReadonlyHide() abort
  return &readonly && &filetype !~# '\v(help|vimfile)' ? 'RO' : ''
endfunction
