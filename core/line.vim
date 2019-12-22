let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \ 'left':  [ [ 'mode', 'paste' ],
  \            [ 'gitbranch' ] ] ,
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'filesize' ],
  \            [ 'filetype' ],
  \            [ 'readonly' ],
  \            [ 'fileformat' ],
  \            [ 'fileencoding' ] ]
  \ },
  \ 'component': {
  \},
  \ 'component_function': {
  \ 'lineinfo': 'LineInfo',
  \ 'filetype': 'FileType',
  \ 'gitbranch': 'Gitbranch',
  \ 'fileformat': 'FileFormat',
  \ 'fileencoding': 'FileEncoding',
  \ 'readonly': 'ReadOnly',
  \ 'filesize': 'FileSize',
  \ },
  \ }

function! s:lightline_is_lean() abort
  return &filetype =~? '\v^defx|help|fugitive|mundo(diff)?$'
endfunction

function! s:lightline_is_plain() abort
  return &buftype ==? 'terminal'
endfunction

" LineInfo:
function! LineInfo() abort
  return s:lightline_is_lean() ? toupper(&filetype) :
    \ s:lightline_is_plain() ? toupper(&buftype) :
    \ printf('☰ %d:%d %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction

" FileType:
function! FileType() abort
  return s:lightline_is_plain() || s:lightline_is_lean() ? '' : &filetype
endfunction

" Gitbranch:
function! Gitbranch() abort
  return s:lightline_is_lean() ? '' : fugitive#head()
endfunction

" FileFormat:
function! FileFormat() abort
  return &fileformat == 'unix' ? '' : &fileformat
endfunction

" FileEncoding:
function! FileEncoding() abort
  return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

" Readonly:
function! ReadOnly()
  return s:lightline_is_lean() ? '' :
    \ &readonly ? '' :
    \ &modified ? '[+]' : ''
endfunction

function! HumanSize(bytes) abort
  let l:bytes = a:bytes
  let l:sizes = ['B', 'K', 'M', 'G']
  let l:i = 0
  while l:bytes >= 1024
    let l:bytes = l:bytes / 1024.0
    let l:i += 1
  endwhile
  return printf('%.1f%s', l:bytes, l:sizes[l:i])
endfunction

" FileSize:
function! FileSize() abort
  return s:lightline_is_lean() ? '' :
    \ HumanSize(line2byte('$') + len(getline('$')))
endfunction

function! Name_modified()
  let filename = expand('%:t') !=# '' ? expand('%:p:h') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
