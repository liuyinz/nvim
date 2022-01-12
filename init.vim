" Disable pre-bundled plugins
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_gzip              = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_2html_plugin      = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
" let g:loaded_shada_autoload    = 1

" Set main configuration directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $DATA_PATH = stdpath('data')

if has('vim_starting')
  if &runtimepath !~# $VIM_PATH
    set runtimepath^=$VIM_PATH
  endif

  " Ensure data directories
  for s:path in [
      \ $DATA_PATH,
      \ $DATA_PATH . '/plugs',
      \ $DATA_PATH . '/bookmarks',
      \ ]
    if ! isdirectory(s:path)
      call mkdir(s:path, 'p')
    endif
  endfor

  " install vim-plug
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " set host
  let g:python3_host_prog = '/usr/local/bin/python3'
  let g:ruby_host_prog = '/usr/local/opt/ruby/bin/ruby'

  " Release keymappings prefixes, evict entirely for use of plug-ins.
  nnoremap <Space>  <Nop>
  xnoremap <Space>  <Nop>
  nnoremap ;        <Nop>
  xnoremap ;        <Nop>
  " Initialize base requirements
  let g:mapleader=';'
  let g:maplocalleader="\<Space>"
endif

call plug#begin($DATA_PATH . '/plugs')

" Basic
Plug 'junegunn/vim-plug'
Plug 'dstein64/vim-startuptime'
Plug 'saltdotac/citylights.vim'
Plug 'voldikss/vim-floaterm'

" edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
" ui
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'junegunn/limelight.vim', { 'on' : 'Limelight'}
Plug 'junegunn/goyo.vim', { 'on' : 'Goyo'}
" edit
Plug 'simnalamburt/vim-mundo', { 'on' : 'MundoToggle'}
Plug 'scrooloose/nerdcommenter'
" format
Plug 'Chiel92/vim-autoformat', { 'on' : 'Autoformat'}
Plug 'junegunn/vim-easy-align'
" vim
call plug#end()


" Plug setting
" ----------------------------------------------------------
" theme
" -----------------------------
colorscheme citylights

" Floaterm
" -----------------------------
let g:floaterm_rootmarkers=['.git','.hg','.vscode']
let g:floaterm_gitcommit='floaterm'
" let g:floaterm_winblend=10

nnoremap   <silent>   <leader>gb
  \ :FloatermNew --height=0.99 --width=0.99 --name=Ranger --autoclose=2 ranger<CR>
nnoremap   <silent>   <leader>gg
  \ :FloatermNew --height=0.99 --width=0.99 --name=LazyGit --autoclose=2 lazygit<CR>

nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

nnoremap   <silent>   <F2>    :FloatermNew<CR>
tnoremap   <silent>   <F2>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F4>    :FloatermPrev<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F5>    :FloatermNext<CR>
tnoremap   <silent>   <F5>    <C-\><C-n>:FloatermNext<CR>

function! StartFloatermSilently() abort
  FloatermNew
  FloatermHide
  stopinsert
  wincmd o
endfunction
autocmd VimEnter * call StartFloatermSilently()

" Goyo
" -----------------------------
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

" nnoremap <silent> <Leader>g :<C-U>Goyo<CR>

" s:goyo_enter()
" Disable visual candy in Goyo mode
function! s:goyo_enter()
  if has('gui_running')
    " Gui fullscreen
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    " Hide tmux status
    silent !tmux set status off
  endif
  " Activate Limelight
  Limelight
endfunction

" s:goyo_leave()
" Enable visuals when leaving Goyo mode
function! s:goyo_leave()
  if has('gui_running')
    " Gui exit fullscreen
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    " Show tmux status
    silent !tmux set status on
  endif
  " De-activate Limelight
  Limelight!
endfunction


" Indentline
" -----------------------------
let g:indentline_enabled = 1
let g:indentLine_setConceal = 1
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 2
let g:indentLine_setColors  =  1
let g:indentline_char='¦'
let g:indentLine_color_gui = '#544B64'
let g:indentLine_fileTypeExclude = [
  \'man', 'floaterm', 'yaml', 'json', 'help','startify']
let g:indentLine_bufTypeExclude = ['help', 'terminal','startify']
let g:indentLine_faster = 1

autocmd TermOpen * IndentLinesDisable

" rainbow
" -----------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
  \'guifgs': ['skyblue', 'hotpink', 'seagreen', 'orange'],
  \'operators': '_,_',
  \'parentheses': [
  \   'start=/(/ end=/)/ fold',
  \   'start=/\[/ end=/\]/ fold',
  \   'start=/{/ end=/}/ fold'
  \   ],
  \'separately': {
  \    '*': {},
  \    'tex': {
  \        'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \    },
  \    'lisp': {
  \        'guifgs': ['skyblue', 'hotpink', 'seagreen', 'orange', 'darkorchid3'],
  \    },
  \    'vim': {
  \        'parentheses': [
  \           'start=/(/ end=/)/',
  \           'start=/\[/ end=/\]/',
  \           'start=/{/ end=/}/ fold',
  \           'start=/(/ end=/)/ containedin=vimFuncBody',
  \           'start=/\[/ end=/\]/ containedin=vimFuncBody',
  \           'start=/{/ end=/}/ fold containedin=vimFuncBody'
  \       ],
  \    },
  \    'html': {
  \        'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \    },
  \    'css': 0,
  \    'floaterm': 0,
  \   }
  \}


" vim-mundo
" -----------------------------
let g:mundo_prefer_python3 = 1
let g:mundo_width = 40
let g:mundo_preview_height = 20
let g:mundo_right = 0
let g:mundo_verbose_graph =0
let g:mundo_auto_preview_delay= 50
let g:mundo_playback_delay = 200
let g:mundo_mirror_graph = 0

nnoremap <silent> <leader>u :MundoToggle<CR>


" Nerdcommenter
" -----------------------------
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDUsePlaceHolders = 0
let g:NERDMenuMode = 0
let g:NERDBlockComIgnoreEmpty = 0
let g:NERDCompactSexyComs = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultNesting = 0
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDCustomDelimiters = {
  \ 'json': { 'left': '//' },
  \ 'yaml': { 'left': '#' },
  \}

nmap <leader>cc  <plug>NERDCommenterToggle
xmap <leader>cc  <plug>NERDCommenterToggle
nmap <leader>cy  <plug>NERDCommenterYank
xmap <leader>cy  <plug>NERDCommenterYank
nmap <leader>ce  <plug>NERDCommenterToEOL
nmap <leader>ca  <plug>NERDCommenterAppend


" Autoformat
" -----------------------------
" let g:autoformat_verbosemode=1
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
let g:formatdef_shfmt       = '"shfmt -i 2 -ci"'
let g:formatdef_isblack     = '"isort - | black -l 79 -q -"'
let g:formatters_python     = ['isblack']
let g:formatters_sh         = ['shfmt']
let g:formatters_zsh        = ['shfmt']
let g:formatters_html       = ['prettier']
let g:formatters_json       = ['prettier']
let g:formatters_yaml       = ['prettier']
let g:formatters_toml       = ['prettier']
let g:formatters_css        = ['prettier']
let g:formatters_scss       = ['prettier']
let g:formatters_less       = ['prettier']
let g:formatters_javascript = ['prettier']
let g:formatters_typescript = ['prettier']
let g:formatters_markdown   = ['prettier']

" au BufWrite * :Autoformat
nnoremap <leader>f :Autoformat<cr>
vmap     <leader>f :Autoformat<cr>

" vim-easy-align
" -----------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Lightline
" ----------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \ 'left':  [ [ 'mode', 'paste' ],
  \            [ 'gitbranch' ],
  \            [ 'filepath', 'readonly' ]],
  \ 'right': [ [ 'filesize', 'lineinfo' ],
  \            [ 'filetype' ],
  \            [ 'fileencoding', 'fileformat' ] ],
  \ },
  \ 'inactive': {
  \ 'left':  [ [ 'mode', 'paste' ],
  \            [ 'gitbranch' ],
  \            [ 'filepath', 'readonly' ] ],
  \ 'right': [ [ 'filesize', 'lineinfo' ],
  \            [ 'filetype' ],
  \            [ 'fileencoding', 'fileformat' ] ],
  \ },
  \ 'tabline':{
  \ 'left': [['buffers']],
  \ 'right': [['tabindex']],
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
  \   'tabindex': 'TabIndex',
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \ },
  \ 'component_type': {'buffers': 'tabsel'},
  \ 'separator': { 'left': "\ue0b8", 'right': "\ue0be"},
  \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0b9"},
  \ 'tabline_separator': { 'left': "", 'right': "" },
  \ 'tabline_subseparator': { 'left': "", 'right': "" }
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
  let l:prepath = pathshorten(expand('%:p:~:h:h')) . "/" . expand('%:p:h:t')
  return s:lightline_is_lean() || expand('%:t') ==# '' ? '' : l:prepath
endfunction

" TabIndex
function! TabIndex()
  let l:index = tabpagenr() . "/" . tabpagenr('$')
  return tabpagenr('$') < 2 ? '' : l:index
endfunction


" system
"----------------------------------------------------------
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
" source core/*.vim


" File Types
"----------------------------------------------------------

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
  autocmd FileType javascript  setlocal shiftwidth=4
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
  " autocmd FileType yaml,json setlocal shiftwidth=4
  autocmd FileType yaml.docker-compose setlocal expandtab
  autocmd FileType json setlocal conceallevel=0
  autocmd FileType go setlocal matchpairs-=<:> matchpairs-=(:)
augroup END
