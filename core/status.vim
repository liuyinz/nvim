let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \ 'left':  [ [ 'mode' ],
  \            [ 'gitbranch' ],
  \            [ 'asyncrun_status' ]],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'filesize' ],
  \            [ 'filetype' ],
  \            [ 'fileformat' ],
  \            [ 'fileencoding' ],
  \            [ 'readonly' ] ]
  \ },
  \ 'inactive': {
  \ 'left':  [ [ 'mode' ],
  \            [ 'gitbranch' ]],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'filesize' ],
  \            [ 'filetype' ],
  \            [ 'fileformat' ],
  \            [ 'fileencoding' ],
  \            [ 'readonly' ]]
  \ },
  \ 'tabline':{
  \ 'left': [['buffers']],
  \ 'right': [['filepath']],
  \ },
  \ 'component': {
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'lineinfo': 'LineInfo',
  \   'filetype': 'FileType',
  \   'fileformat': 'FileFormat',
  \   'fileencoding': 'FileEncoding',
  \   'readonly': 'ReadOnly',
  \   'filesize': 'FileSize',
  \   'filepath': 'FilePath',
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \   'asyncrun_status': 'lightline#asyncrun#status',
  \ },
  \ 'component_type': {'buffers': 'tabsel'},
  \ 'separator': { 'left': "\ue0b8", 'right': "\ue0be"},
  \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0b9"},
  \ 'tabline_separator': { 'left': "", 'right': "" }
  \ }

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#read_only = '[RO]'
let g:lightline#bufferline#unnamed = '[Untitle]'
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#number_map = {
  \ 0: '⓿', 1: '❶', 2: '❷', 3: '❸', 4: '❹',
  \ 5: '❺', 6: '❻', 7: '❼', 8: '❽', 9: '❾'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)

function! s:lightline_is_lean() abort
  return &filetype =~? '\v^man|startify|vim-plug|help|fugitive|GV|git|mundo(diff)?$'
endfunction

function! s:lightline_is_terminal() abort
  return &buftype ==? 'terminal'
endfunction

" winwidth_is_narrow
function! s:winwidth_is_narrow() abort
  return winwidth(0) < 90
endfunction

" LineInfo
function! LineInfo() abort
  return s:lightline_is_lean() ? toupper(&filetype) :
    \ s:lightline_is_terminal() ? toupper(&buftype) :
    \ printf('%d:%d,%d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction

" FileType
function! FileType() abort
  return s:lightline_is_terminal() ||
    \ s:lightline_is_lean() ||
    \ line2byte('$')  == -1 ? '' :
    \ &filetype == '' ? 'no ft' : &filetype
endfunction

" FileFormat
function! FileFormat() abort
  return &fileformat == 'unix' ? '' : &fileformat
endfunction

" FileEncoding
function! FileEncoding() abort
  return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

" Readonly
function! ReadOnly()
  return s:lightline_is_lean() ? '' :
    \ &readonly ? '[RO]' :
    \ &modified ? '[+]' : ''
endfunction

" HumanSize
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

" FileSize
function! FileSize() abort
  return s:lightline_is_lean() ||
    \ s:lightline_is_terminal() ||
    \ line2byte('$') == -1 ?
    \ '' : HumanSize(line2byte('$') + len(getline('$')))
endfunction

" FilePath
function! FilePath()
  let prepath = pathshorten(expand('%:p:~:h:h')) . "/" . expand('%:p:h:t')
  return s:lightline_is_terminal() || expand('%:t') ==# '' ? '' : prepath
endfunction

" " GitInfo
" function! GitInfo() abort
"   let gitbranch=get(g:, 'coc_git_status', '')
"   let gitcount=get(b:, 'coc_git_status', '')
"   let gitinfo = []
"   if empty(gitbranch)
"     let gitbranch=""
"   endif
"   if empty(gitcount)
"     let gitcount=""
"   endif
"   call add(gitinfo,gitbranch)
"   call add(gitinfo,gitcount)
"   return s:lightline_is_lean() ? '' : trim(join(gitinfo,''))
" endfunction

" " CocDiagnostic
" function! CocDiagnostic() abort
"   let info = get(b:, 'coc_diagnostic_info', {})
"   if empty(info) | return '' | endif
"   let msgs = []
"   if get(info, 'error', 0)
"     call add(msgs, 'E' . info['error'])
"   endif
"   if get(info, 'warning', 0)
"     call add(msgs, 'W' . info['warning'])
"   endif
"   return join(msgs, ':')
" endfunction

" function! CocFixes() abort
"   let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
"   return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
" endfunction

" " Diagnostic's feedback
" function! CocUpdateQuickFixes(error, actions) abort
"   let coc_quickfixes = {}
"   try
"     for action in a:actions
"       if action.kind ==? 'quickfix'
"         for change in action.edit.documentChanges
"           for edit in change.edits
"             let start_line = edit.range.start.line + 1
"             let end_line = edit.range.end.line + 1
"             let coc_quickfixes[start_line] = get(coc_quickfixes, start_line, 0) + 1
"             if start_line != end_line
"               let coc_quickfixes[end_line] = get(coc_quickfixes, end_line, 0) + 1
"             endif
"           endfor
"         endfor
"       endif
"     endfor
"   catch
"   endtry
"   if coc_quickfixes != get(b:, 'coc_quickfixes', {})
"     let b:coc_quickfixes = coc_quickfixes
"     call lightline#update()
"   endif
" endfunction

" autocmd  MyAutoCmd User CocStatusChange,CocDiagnosticChange,CocGitStatusChange
"   \   call lightline#update()
"   \|  call CocActionAsync('quickfixes', function('CocUpdateQuickFixes'))
