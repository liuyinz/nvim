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
Plug 'dstein64/vim-startuptime'
Plug 'saltdotac/citylights.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-plug'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Yggdroot/LeaderF-marks'
Plug 'voldikss/vim-floaterm'

" edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git', { 'for' : [ 'git', 'gtcmmit', 'gitrebase', 'gitconfig' ] }
Plug 'junegunn/gv.vim'
" Plug 'jreybert/vimagit'
" ui
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'junegunn/limelight.vim', { 'on' : 'Limelight'}
Plug 'junegunn/goyo.vim', { 'on' : 'Goyo'}
" edit
Plug 'simnalamburt/vim-mundo', { 'on' : 'MundoToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-niceblock'
Plug 'romainl/vim-cool'
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/vim-peekaboo'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" motion
Plug 'easymotion/vim-easymotion'
" Plug 'MattesGroeger/vim-bookmarks'
" format
Plug 'Chiel92/vim-autoformat', { 'on' : 'Autoformat'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
" Run
Plug 'skywind3000/asyncrun.vim', { 'on' : [ 'AsyncRun!', 'AsyncRun' ]}
" integration
Plug 'JGShaw/dash.vim'
Plug 'tyru/open-browser.vim'
" " Markdown
" Plug 'iamcco/markdown-preview.nvim', {
"   \'do' : { -> mkdp#util#install() },
"   \'for' : [ 'markdown', 'pandoc.markdown', 'rmd'],
"   \'on' : 'MarkdownPreview'}
" other
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/jsonc.vim', { 'for' : 'jsonc' }
" Snippets
Plug 'honza/vim-snippets'
" html
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
Plug 'mattn/emmet-vim'
" vim
Plug 'rbtnn/vim-vimscript_indentexpr'
Plug 'andymass/vim-matchup'
call plug#end()

" source core/*.vim
for s:path in split(glob($VIM_PATH . '/core/*.vim'), "\n")
  exe 'source ' . s:path
endfor
