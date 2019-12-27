" QuickRun
" https://www.zhihu.com/question/302899664/answer/631709470
" -----------------------------
command! QuickRun call QuickRun()
nnoremap <silent> <leader>r       <Esc>:call QuickRun()<CR>
function! QuickRun()
  exec 'w'
  if &filetype == 'c'
    AsyncRun gcc -g % && ./a.out
  elseif &filetype == 'cpp'
    AsyncRun g++ -g % && ./a.out
  elseif &filetype == 'sh'
    AsyncRun bash %
  elseif &filetype == 'html' || &filetype == 'htmldjango'
    call OpenBrowser(expand("%:p"))
  elseif &filetype == 'javascript'
    AsyncRun node %
  elseif &filetype == 'typescript'
    AsyncRun tsc %
  elseif &filetype == 'markdown'
    MarkdownPreview
  elseif &filetype == 'python'
    if exists('g:asyncrun_python_interpretor')
      exec 'AsyncRun ' . '-raw ' .  g:asyncrun_python_interpretor . ' %'
      return
    endif
    AsyncRun -raw python3 %
  elseif &filetype == 'rust'
    AsyncRun cargo run
  elseif &filetype == 'tex'
    VimtexCompile
  elseif &filetype == 'java'
    AsyncRun javac % && java %:r
  else
    echo "Not supported filetype:" . " " . &filetype
  endif
endfunction

" Webstorm
command! WebStorm call CallWebStorm()
nnoremap <silent> <leader><leader>  <Esc>:call CallWebStorm()<CR>
" CallWebStorm:
function! CallWebStorm() abort
  let filepath = expand('%:p') . ":" . line(".")
  execute '!ws ' . filepath
endfunction
