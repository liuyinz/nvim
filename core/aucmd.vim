" File Types

augroup  MyAutoCmd
	autocmd!

	" Reload vim config automatically
	autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml} nested
		\ source $MYVIMRC | redraw

	" Highlight current line only on focused window
	autocmd WinEnter,InsertLeave * if &ft !~# 'denite' | set cursorline | endif
	autocmd WinLeave,InsertEnter * if &ft !~# 'denite' | set nocursorline | endif

	" Term setting
	autocmd TermOpen * IndentLinesDisable
	autocmd TermOpen * setlocal nonumber norelativenumber

	" Automatically set read-only for files being edited elsewhere
	" autocmd SwapExists * nested let v:swapchoice = 'o'

	" Equalize window dimensions when resizing vim window
	autocmd VimResized * tabdo wincmd =

	" Force write shada on leaving nvim
	autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

	" Check if file changed when its window is focus, more eager than 'autoread'
	autocmd FocusGained * checktime

	autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

	" Update filetype on save if empty
	autocmd BufWritePost * nested
		\ if &l:filetype ==# '' || exists('b:ftdetect')
		\ |   unlet! b:ftdetect
		\ |   filetype detect
		\ | endif

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

	" Filetype
	autocmd FileType crontab setlocal nobackup nowritebackup

	autocmd FileType gitcommit setlocal spell

	autocmd FileType gitcommit,qfreplace setlocal nofoldenable

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,jsx,javascript.jsx setlocal backupcopy=yes

	autocmd FileType php
		\ setlocal matchpairs-=<:> iskeyword+=\\ path+=/usr/local/share/pear
	"		\ | setlocal formatoptions=qroct " Correct indent after opening a phpdocblock

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


" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
