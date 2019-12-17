" Disable pre-bundled plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_rrhelper = 1
let g:loaded_shada_plugin = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:netrw_nogx = 1

" Set main configuration directory, and where cache is stored.
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $DATA_PATH = expand('~/.cache'.'/nvim')

if has('vim_starting')
    if &runtimepath !~# $VIM_PATH
        set runtimepath^=$VIM_PATH
    endif

    " Ensure data directories
    for s:path in [
      \ $DATA_PATH,
      \ $DATA_PATH . '/undo',
      \ $DATA_PATH . '/sessions',
      \ $DATA_PATH . '/plugged',
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
    nnoremap ,        <Nop>
    xnoremap ,        <Nop>
    nnoremap ;        <Nop>
    xnoremap ;        <Nop>
    " Initialize base requirements
    let g:mapleader="\<Space>"
    let g:maplocalleader=';'

endif

call plug#begin($DATA_PATH . '/plugged')

" Basic
Plug 'junegunn/vim-plug'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
" tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-surround'
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git', { 'for' : [ 'git', 'gtcmmit', 'gitrebase', 'gitconfig' ] }
Plug 'junegunn/gv.vim'
" ui
Plug 'liuchengxu/space-vim-theme'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'albertomontesg/lightline-asyncrun'
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
Plug 'editorconfig/editorconfig-vim'
" Plug 'mg979/vim-visual-multi'
" Plug 'brooth/far.vim'
" motion
Plug 't9md/vim-choosewin'
Plug 'easymotion/vim-easymotion'
Plug 'MattesGroeger/vim-bookmarks'
" file
Plug 'Yggdroot/LeaderF', { 'do' : './install.sh'}
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim', { 'on' : [ 'Ranger' ,'RangerCurrentFileExistingOrNewTab']}
Plug 'airblade/vim-rooter'
" format
Plug 'Chiel92/vim-autoformat', { 'on' : 'Autoformat'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
" Run
Plug 'skywind3000/asyncrun.vim', { 'on' : [ 'AsyncRun!', 'AsyncRun' ]}
Plug 'carlosrocha/vim-chrome-devtools', { 'do': 'npm install && npm run build' }
" integration
Plug 'ybian/smartim'
Plug 'JGShaw/dash.vim'
Plug 'tyru/open-browser.vim'
" Lang
Plug 'honza/vim-snippets'
Plug 'sbdchd/vim-shebang', { 'on' : 'ShebangInsert'}
""JS,TS
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim', { 'for' : 'tsx'}
Plug 'peitalin/vim-jsx-typescript', { 'for' : 'tsx'}
""Python
Plug 'heavenshell/vim-pydocstring', { 'for' : 'python' }
" Plug 'vim-python/python-syntax', { 'for' : 'python'}
""Markdown
" Plug 'godlygeek/tabular', { 'for' : 'markdown'}
" Plug 'plasticboy/vim-markdown', { 'for' : 'markdown'}
Plug 'iamcco/markdown-preview.nvim', {
  \'do' : { -> mkdp#util#install() },
  \'for' : [ 'markdown', 'pandoc.markdown', 'rmd'],
  \'on' : 'MarkdownPreview'}
""Html,Xml
" Plug 'amadeus/vim-xml', { 'for' : 'xml' }
" Plug 'othree/html5.vim', { 'for' : 'html'}
Plug 'Valloric/MatchTagAlways', { 'for' : ['html', 'xml', 'xhtml', 'jinja' ]}
""other
" Plug 'MTDL9/vim-log-highlighting', { 'for' : 'log' }
" Plug 'cespare/vim-toml', { 'for' : 'toml'}
Plug 'neoclide/jsonc.vim', { 'for' : 'jsonc' }
Plug 'sheerun/vim-polyglot'

call plug#end()

" source core/*.vim
for s:path in split(glob($VIM_PATH . '/core/*.vim'), "\n")
    exe 'source ' . s:path
endfor
