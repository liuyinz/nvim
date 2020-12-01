" logging
"-----------------------------
" set verbose=8

" General Settings
" ----------------------------
if has('termguicolors')
  set termguicolors
endif

if exists('&pumblend')
  set pumblend=5
endif

if has('conceal')
  set conceallevel=3
  set concealcursor=niv
endif

if has('nvim')
  set shada='300,<50,@100,s10,h
endif

if has('mac')
  let g:clipboard = {
    \ 'name': 'macOS-clipboard',
    \ 'copy': {
    \    '+': 'pbcopy',
    \    '*': 'pbcopy',
    \  },
    \ 'paste': {
    \    '+': 'pbpaste',
    \    '*': 'pbpaste',
    \ },
    \ 'cache_enabled': 0,
    \ }
endif

if has('clipboard')
  set clipboard=unnamed
endif


" Editor UI Appearance
"-----------------------------
set number
set relativenumber
set signcolumn=yes
set laststatus=2
set cmdheight=2
set cmdwinheight=5
set display=lastline
set noshowmode
set shortmess=acIF
set scrolloff=0
set noruler
set title
set showtabline=2
set pumheight=25
set helpheight=12
set previewheight=12
set diffopt=internal,filler,vertical,context:0
" set statusline=-
" set fillchars+=vert:\|

" Behavior
"-----------------------------
set autochdir
set packpath=
set linebreak
set breakindent
set showbreak=--->
set nostartofline
set whichwrap+=h,l,<,>,[,],~
set splitbelow splitright
set switchbuf=vsplit,useopen,usetab
set completeopt=menu,preview,noinsert
set nospell
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1
scriptencoding utf-8

" File
"-----------------------------
set nobackup
set noswapfile
set undofile
set autoread
set autowrite
set hidden
set confirm
set history=2000
set bsdir=buffer
set mouse=a
set fileformat=unix
set fileformats=unix,dos
set verbosefile=$DATA_PATH/log

" Tabs and Indents
"-----------------------------
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set shiftround

" Timing
"-----------------------------
set timeout ttimeout
set timeoutlen=400
set ttimeoutlen=10
set updatetime=100

" Searching
"-----------------------------
set ignorecase
set smartcase
set infercase
set incsearch
set hlsearch
set wrapscan
set showmatch
set matchpairs+=<:>
set matchtime=1
set cpoptions-=m

if executable('rg')
  set grepprg=rg\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" Wildmenu
"-----------------------------
" set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set wildignorecase
set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
set wildignore+=application/vendor/**,**/vendor/,ckeditor/**,media/vendor/**
set wildignore+=__pycache__,*.egg-info,.pytest_cache


" Internal Plugin Settings  {{{
"-----------------------------
" PHP {{{
let g:PHP_removeCRwhenUnix = 0

"
" Python {{{
let g:python_highlight_all = 1

"
" Vim {{{
let g:vimsyntax_noerror = 1
let g:vim_indent_cont = &shiftwidth

"
" Bash {{{
let g:is_bash = 1

"
" Java {{{
let g:java_highlight_functions = 'style'
let g:java_highlight_all = 1
let g:java_highlight_debug = 1
let g:java_allow_cpp_keywords = 1
let g:java_space_errors = 1
let g:java_highlight_functions = 1

"
" JavaScript {{{
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

"
" Ruby {{{
let g:ruby_no_expensive = 1

"
" Folding {{{
let g:vimsyn_folding = 'af'
let g:tex_fold_enabled = 1
let g:xml_syntax_folding = 1
let g:php_folding = 2
let g:php_phpdoc_folding = 1
let g:perl_fold = 1


" Window and Buffer
"-------------------------------------
" Write & quit
nnoremap <silent> <Leader>w  :write<CR>
nnoremap <silent> <Leader>q  :quit!<CR>
nnoremap <silent> <Leader>wq :wq<CR>
nnoremap <silent> <leader>ww :SudoWrite<CR>
" Buffer
nnoremap <silent> <leader>d   :<C-u>bdelete!<CR>
" Close all other buffer
nnoremap <silent> <leader>ob  :<c-u>up <bar> %bd <bar> e#<cr>
" Close all other windows
nnoremap <silent> <leader>ow  :<C-u>only<CR>
" Split winsows
nnoremap <silent> <leader>n  :<C-u>vnew<CR>
nnoremap <silent> <leader>h  :<C-u>split<CR>
nnoremap <silent> <leader>v  :<C-u>vsplit<CR>
nnoremap <silent> <leader>K  <C-w>K
nnoremap <silent> <leader>L  <C-w>L
nnoremap <silent> <leader>T  <C-w>T
nnoremap <silent> <leader>=  <C-w>=


" Insert & command
"-------------------------------------
" Emacs style
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-d> <Del>

" Selection || newline
" inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : "\<Esc>o"
" inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<Esc>O"


" Terminal
"-------------------------------------
" Start an external command with a single bang
nnoremap <localleader><localleader> :!
nnoremap <silent> <leader>t :vsplit term://zsh<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

augroup TermSet
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * startinsert
augroup END


" Normal mode
"-------------------------------------
"smart move
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" qq to record, Q to replay
nnoremap Q @q
nnoremap Y y$
nnoremap D d$
nnoremap U <C-r>

" Use tab for indenting
xnoremap > >gv|
xnoremap < <gv
nmap >>  >>_
nmap <<  <<_

" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Quick substitute within selected area
xnoremap ss :s//g<Left><Left>
xnoremap st :Subvert//g<Left><Left>
nnoremap <leader>ss :%s//g<Left><Left>
nnoremap <leader>st :%Subvert//g<Left><Left>

" Change current word in a repeatable manner
nnoremap <leader>cn *``cgn
nnoremap <leader>cN *``cgN
vnoremap <expr> <leader>cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> <leader>cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Append modeline to EOF
nnoremap <silent> <Leader>ll :call <SID>append_modeline()<CR>
function! s:append_modeline()
  let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
    \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
  call append(line('$'), l:modeline)
endfunction

" nnoremap <leader>yr
"     \:let @+=expand("%")<CR>:echo 'Relative path copied to clipboard.'<CR>
" nnoremap <leader>ya
"     \:let @+=expand("%:p")<CR>:echo 'Absolute path copied to clipboard.'<CR>
" cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" nnoremap <leader>cp yap<S-}>p
" nnoremap <leader>a =ip

" C-r: Easier search and replace
" xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>
"     \:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
"
" Returns visually selected text
" function! s:get_selection(cmdtype) "{{{
"     let temp = @s
"     normal! gv"sy
"     let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
"     let @s = temp
" endfunction


" Duplicate lines
" nnoremap <Leader>d m`YP``
" vnoremap <Leader>d YPgv

" " Session management shortcutsSession management shortcuts
" nmap <silent> <Leader>se :<C-u>execute 'SessionSave' fnamemodify(resolve(getcwd()), ':p:gs?/?_?')<CR>
" nmap <silent> <Leader>os :<C-u>execute 'source '.g:session_directory.'/'.fnamemodify(resolve(getcwd()), ':p:gs?/?_?').'.vim'<CR>

" xnoremap p  "0p
" nnoremap x "_x
"

"vim: set ts=4 sw=4 tw=78 et :
