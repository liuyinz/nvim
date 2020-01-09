" File Types

augroup  MyAutoCmd
  autocmd!

  " Reload vim config automatically
  autocmd BufWritePost $VIM_PATH/{*.vim,*.json} nested
    \ source $MYVIMRC | redraw

  " Highlight current line only on focused window
  autocmd WinEnter,InsertLeave * set cursorline
  autocmd WinLeave,InsertEnter * set nocursorline

  " Equalize window dimensions when resizing vim window
  autocmd VimResized * tabdo wincmd =

  " Force write shada on leaving nvim
  autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

  " Check if file changed when its window is focus, more eager than 'autoread'
  autocmd FocusGained * checktime

  autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

  " Reload Vim script automatically if setlocal autoread
  autocmd BufWritePost,FileWritePost *.vim nested
    \ if &l:autoread > 0 | source <afile> |
    \   echo 'source '.bufname('%') |
    \ endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if &ft !~# 'commit' && ! &diff &&
    \      line("'\"") >= 1 && line("'\"") <= line("$")
    \|   execute 'normal! g`"zvzz'
    \| endif
augroup END


" filetypeset
augroup FileTypeSet
  autocmd!

  " Update filetype on save if empty
  autocmd BufWritePost * nested
    \ if &l:filetype ==# '' || exists('b:ftdetect')
    \ |   unlet! b:ftdetect
    \ |   filetype detect
    \ | endif

  autocmd FileType crontab setlocal nobackup nowritebackup
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit,qfreplace setlocal nofoldenable

  " https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
  autocmd FileType css,javascript,jsx,javascript.jsx setlocal backupcopy=yes

  autocmd FileType php
    \ setlocal matchpairs-=<:> iskeyword+=\\ path+=/usr/local/share/pear
  "   \ | setlocal formatoptions=qroct " Correct indent after opening a phpdocblock

  autocmd FileType python
    \ setlocal foldmethod=indent expandtab smarttab nosmartindent
    \ | setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
    \ | setlocal matchpairs-=<:>

  autocmd FileType zsh setlocal shiftwidth=4 foldenable foldmethod=marker
  autocmd FileType html setlocal path+=./;/ shiftwidth=2 foldenable foldmethod=indent

  autocmd FileType markdown
    \ setlocal expandtab nospell conceallevel=0
    \ | setlocal autoindent formatoptions=tcroqn2 comments=n:>

  autocmd FileType apache setlocal path+=./;/
  autocmd FileType cam setlocal nonumber synmaxcol=10000
  autocmd FileType yaml,json setlocal shiftwidth=2
  autocmd FileType yaml.docker-compose setlocal expandtab
  autocmd FileType json setlocal conceallevel=0
  autocmd FileType go setlocal matchpairs-=<:> matchpairs-=(:)
augroup END

" QuickRun
" https://www.zhihu.com/question/302899664/answer/631709470
" -----------------------------
command! QuickRun call QuickRun()
nnoremap <silent> <leader>r   <Esc>:call QuickRun()<CR>
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
    AsyncRun -raw python3 %
  elseif &filetype == 'rust'
    AsyncRun cargo run
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
