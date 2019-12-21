" Plugin Settings

" Coc.nvim
" -----------------------------
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_global_extensions =[
  \ 'coc-lists', 'coc-marketplace', 'coc-translator','coc-rls',
  \ 'coc-json','coc-yaml','coc-python', 'coc-snippets', 'coc-vimlsp',
  \ 'coc-html', 'coc-css','coc-tsserver', 'coc-vetur', 'coc-emmet',
  \ 'coc-angular', 'coc-svg', 'coc-gitignore','coc-git', 'coc-imselect'
  \]

augroup CocAuto
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc-list
vmap <C-l> <Plug>(coc-snippets-select)
inoremap <silent><expr> <C-l>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#refresh()

nnoremap <silent> <localleader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <localleader>v  :<C-u>CocList vimcommands<cr>

nmap <silent> tt  <Plug>(coc-translator-p)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [g <Plug>(coc-git-prevchunk)
nmap <silent> ]g <Plug>(coc-git-nextchunk)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" fugitive
" -----------------------------
nnoremap <silent> <localleader>gs  :Gstatus<CR>
nnoremap <silent> <localleader>ga  :Gwrite<CR>
nnoremap <silent> <localleader>gq  :Gwq<CR>
nnoremap <silent> <localleader>ge  :Gread<CR>
nnoremap <silent> <localleader>gc  :Gcommit<CR>
nnoremap <silent> <localleader>gd  :Gvdiffsplit<CR>
nnoremap <silent> <localleader>gmt :Gvdiffsplit!<CR>
vnoremap <silent> <localleader>gb  :Gbrowse<CR>
nnoremap <localleader>grb :Grebase<Space>
nnoremap <localleader>grn :Grename<Space>
nnoremap <localleader>gm  :Gmerge<Space>
nnoremap <localleader>grm :Gremove<Space>
nnoremap <localleader>gf  :Gfetch<Space>
nnoremap <localleader>gp  :Gpush<Space>
nnoremap <localleader>gpl :Gpull<Space>

" gv
" ----------------------------
nnoremap <silent> <localleader>gl :GV<CR>
vnoremap <silent> <localleader>gl :GV<CR>
nnoremap <silent> <localleader>glb :GV!<CR>


" Leaderf
" -----------------------------
"  ui
let g:Lf_WindowPosition = 'popup'
" let g:Lf_CursorBlink = 0
let g:Lf_PreviewPopupWidth = 0
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_PopupWidth = &columns * 7/10
let g:Lf_PopupHeight = float2nr(&lines * 0.55)
" let g:Lf_PopupPreviewPosition = 'cursor'
" set
" let g:Lf_PythonVersion = 3
let g:Lf_DefaultMode = 'NameOnly'
" let g:Lf_ShowRelativePath = 1
" let g:Lf_NoChdir = 0
let g:Lf_CacheDirectory= expand('$DATA_PATH')
let g:Lf_UseVersionControlTool = 0
let g:Lf_RecurseSubmodules = 1
let g:Lf_FollowLinks = 1
let g:Lf_ReverseOrder = 0
let g:Lf_HistoryNumber = 100000
" let g:Lf_DelimiterChar = ';'
" let g:Lf_RootMarkers=['.git', '.hg', '.svn']
let g:Lf_WorkingDirectoryMode = 'Af'
let g:Lf_HideHelp = 1
let g:Lf_ShowHidden = 1
let g:Lf_EmptyQuery = 0
let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_DiscardEmptyBuffer = 0
let g:Lf_CommandMap = {
  \ '<Up>'  : ['<C-P>'],
  \ '<Down>': ['<C-N>'],
  \ '<C-L>' : ['<C-Q>'],
  \ '<C-]>' : ['<C-L>'],
  \}
let g:Lf_WildIgnore = {
  \ 'dir': ['.svn','.git','.hg','*.cache'],
  \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
  \}
let g:Lf_MruFileExclude=[]
let g:Lf_MruWildIgnore = {
  \ 'dir': ['.cache','runtime','.git','private/var','var/folders'],
  \ 'file': []
  \}
let g:Lf_PreviewCode = 0
let g:Lf_PreviewInPopup = 0
let g:Lf_RgConfig = [
  \ "--hidden",
  \ "--follow",
  \ "--trim",
  \ "--smart-case",
  \ "--auto-hybrid-regex",
  \ "--sortr=modified",
  \ "--ignore-file=/Users/ray/.rgignore",
  \ "--colors=path:fg:green",
  \ "--colors=match:fg:red",
  \ "--colors=match:style:bold",
  \ "--colors=line:fg:blue",
  \ "--colors=line:style:bold",
  \ "--colors=column:fg:blue",
  \ "--colors=column:style:bold"
  \ ]
" gtags
" let g:Lf_CtagsFuncOpts = {
"     \ 'c': '--c-kinds=fp',
"     \ 'rust': '--rust-kinds=f',
"     \ }
let g:Lf_Gtagslabel= 'native-pygments'
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_GtagsAcceptDotfiles = 1
let g:Lf_GtagsSkipUnreadable = 1
let g:Lf_GtagsSkipSymlink = ""

nnoremap <silent> <localleader>a :<C-u>Leaderf file ~<cr>
nnoremap <silent> <localleader>w :<C-u>Leaderf file<cr>
nnoremap <silent> <localleader>p :<C-u>Leaderf mru<cr>
nnoremap <silent> <localleader>t :<C-u>Leaderf bufTag --all<cr>
nnoremap <silent> <localleader>f :<C-u>Leaderf function --all<cr>
nnoremap <silent> <localleader>c :<C-u>Leaderf cmdHistory<cr>
nnoremap <silent> <localleader>s :<C-u>Leaderf searchHistory<cr>
nnoremap <silent> <localleader>h :<C-u>Leaderf help --cword<cr>
nnoremap <silent> <localleader>r :<C-u>Leaderf rg<cr>
vmap     <silent> <localleader>r :<C-U><C-R>=printf("Leaderf rg
  \ -F -e %s ", leaderf#Rg#visual())<cr><cr>


" Goyo
" -----------------------------
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

nnoremap <silent> <Leader>t :<C-U>Goyo<CR>

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
  \'defx', 'fzf', 'vista_kind', 'yaml', 'json', 'help']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_faster = 1


" rainbow
" -----------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
  \'guifgs': ['skyblue', 'hotpink', 'seagreen', 'orange'],
  \'operators': '_,_',
  \'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
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
  \}
  \}


" betterwhitespace
" -----------------------------
let g:better_whitespace_ctermcolor='darkred'
let g:better_whitespace_guicolor='darkred'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'qf', 'help','far','git']


" Hipairs
" -----------------------------
" let g:hiPairs_enable_matchParen = 0
" let g:hiPairs_hl_matchPair = {
"     \'term'    : 'underline,bold',
"     \'cterm'   : 'underline,bold',
"     \'ctermfg' : 'NONE',
"     \'ctermbg' : 'NONE',
"     \'gui'     : 'None',
"     \'guifg'   : 'None',
"     \'guibg'   : '#544B64'
"     \}
" let g:hiPairs_hl_unmatchPair = {
"     \'term'    : 'underline,italic',
"     \'cterm'   : 'NONE',
"     \'ctermfg' : '231',
"     \'ctermbg' : '196',
"     \'gui'     : 'None',
"     \'guifg'   : 'None',
"     \'guibg'   : 'None'
"     \}


" vim-mundo
" -----------------------------
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


" vim-choosewin
" -----------------------------
let g:choosewin_statusline_replace = 1
" let g:choosewin_tabline_replace    = 1
" let g:choosewin_label_align = 'center'
" let g:choosewin_label_padding = 3
" let g:choosewin_label_fill = 0
let g:choosewin_label = 'ASDFZXCV'
let g:choosewin_tablabel = 'QWER'
let g:choosewin_overlay_enable = 0
" let g:choosewin_overlay_font_size = 'auto'
" let g:choosewin_overlay_shade = 0
" let g:choosewin_overlay_clear_multibyte = 1
" let g:choosewin_overlay_shade_priority = 100
" let g:choosewin_overlay_label_priority = 101
let g:choosewin_blink_on_land = 1
" let g:choosewin_return_on_single_win = 0

let g:choosewin_color_label = {
  \'gui': ['#5d4d7a', 'white', 'bold'],
  \'cterm': ['#5d4d7a', 'white', 'bold'] }

let g:choosewin_color_label_current = {
  \'gui':['#C792EA', 'black', 'bold'],
  \'cterm': ['#C792EA', 'black', 'bold'] }

let g:choosewin_color_overlay = {
  \'gui': ['#5d4d7a','#5d4d7a'],
  \'cterm': ['#5d4d7a','#5d4d7a'] }

let g:choosewin_color_overlay_current = {
  \'gui': ['#C792EA','#C792EA'],
  \'cterm': ['#C792EA','#C792EA'] }

let g:choosewin_color_shade = {
  \'gui':[ '', '#292B2E'],
  \'cterm': ['', '#292B2E'] }

let g:choosewin_keymap = {
  \ '0':     '<NOP>',
  \ '[':     '<NOP>',
  \ ']':     '<NOP>',
  \ '$':     '<NOP>',
  \ 'k':     'tab_close',
  \ ';':     '<NOP>',
  \ ',':     'previous',
  \ 'g':     'swap',
  \ 'G':     'swap_stay',
  \ "\<CR>": 'win_land',
  \ }

nmap <silent><nowait> , <Plug>(choosewin)


" vim-easymotion
" -----------------------------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_prompt = 'Jump>>{n} '
let g:EasyMotion_keys = 'fjdkslaurieowpqgh'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_space_jump_first = 1
" map m <Plug>(easymotion-prefix)
" move to line,word begin,word end
nmap <silent> ml    <Plug>(easymotion-overwin-line)
vmap <silent> ml    <Plug>(easymotion-bd-jk)
omap <silent> ml    <Plug>(easymotion-bd-jk)
map  <silent> mw    <Plug>(easymotion-bd-w)
map  <silent> mmw   <Plug>(easymotion-bd-W)
map  <silent> me    <Plug>(easymotion-bd-e)
map  <silent> mme   <Plug>(easymotion-bd-E)
" imap <silent> <C-l> <Esc>mw
" move to {char}
map   mf    <Plug>(easymotion-bd-f)
map   mt    <Plug>(easymotion-bd-t)
map   mr    <Plug>(easymotion-repeat)
map   mn    <Plug>(easymotion-bd-n)
map   m/    <Plug>(easymotion-bd-fn)


" Dash
" -----------------------------
let g:dash_activate = 1
let g:dash_map = {
  \ 'vim' : ['neovim','vim']
  \ }

nmap <silent> gz <Plug>DashSearch
vmap <silent> gz <Plug>DashVisual
nmap <silent> gzz <Plug>DashGlobalSearch


" vim-bookmarks
" -----------------------------
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save_file = expand($DATA_PATH . '/bookmarks')
let g:bookmark_highlight_lines = 1
let g:bookmark_show_warning = 0
let g:bookmark_show_toggle_warning = 0
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 0
let g:bookmark_disable_ctrlp = 1
let g:bookmark_manage_per_buffer = 1

nmap  mm   <Plug>BookmarkToggle
nmap  ma   <Plug>BookmarkShowAll
nmap  mi   <Plug>BookmarkAnnotate
nmap  mc   <Plug>BookmarkClearAll
nmap  ]m   <Plug>BookmarkNext
nmap  [m   <Plug>BookmarkPrev


" Autoformat
" -----------------------------
" let g:autoformat_verbosemode=1
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
let g:formatdef_shfmt       = '"shfmt -i 4 -ci"'
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


" autopairs
" -----------------------------
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let AutoPairsShortcutFastWrap=''
let AutoPairsShortcutToggle=''
let g:AutoPairsFlyMode = 0

au FileType html let b:AutoPairs = AutoPairsDefine({'<':'>','<!--' : '-->'})
au FileType python let b:AutoPairs = AutoPairsDefine({
  \ '```':'```',
  \ '"""':'"""',
  \ "'''":"'''"
  \ })


" Asyncrun
" -----------------------------
let g:asyncrun_open = 8
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'


" Vim-Markdown
" -----------------------------
" let g:vim_markdown_no_default_key_mappings = 0
" let g:vim_markdown_edit_url_in = 'vsplit'
" let g:vim_markdown_folding_disabled = 0
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_folding_level = 6
" let g:vim_markdown_override_foldtext = 0
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_emphasis_multiline = 0
" let g:vim_markdown_conceal = 0
" let g:tex_conceal = ""
" let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_follow_anchor = 0
" let g:vim_markdown_anchorexpr = ""
" let g:vim_markdown_math = 1
" let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_json_frontmatter = 1
" let g:vim_markdown_strikethrough = 1
" let g:vim_markdown_no_extensions_in_markdown = 0
" let g:vim_markdown_autowrite = 1
" let g:vim_markdown_auto_insert_bullets = 0
" let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_fenced_languages = [
"   \ 'c++=cpp',
"   \ 'csharp=cs',
"   \ 'viml=vim',
"   \ 'bash=sh',
"   \ 'ini=dosini',
"   \ 'js=javascript',
"   \ 'json=javascript',
"   \ 'docker=Dockerfile',
"   \ 'makefile=make',
"   \ 'py=python'
"   \ ]
"
" nmap <localleader>mb  <Plug>Markdown_OpenUrlUnderCursor
" nmap <localleader>me  <Plug>Markdown_EditUrlUnderCursor
" nmap <localleader>md  :<C-u>HeaderDecrease<CR>
" nmap <localleader>mi  :<C-u>HeaderIncrease<CR>
" nmap <localleader>mf  :<C-u>TableFormat<CR>
" nmap <localleader>mt  :<C-u>Toc<CR>
" nmap <localleader>ms  :<C-u>SetexToAtx<CR>

" markdown-preview.nvim
" -----------------------------
let g:mkdp_echo_preview_url = 1
let g:mkdp_page_title = '「${name}」'
let g:mkdp_markdown_css = '/home/ray/.npm-global/lib/node_modules/markdown.css/dest/github/markdown.css'
let g:mkdp_highlight_css = '/home/ray/.npm-global/lib/node_modules/highlight.js/styles/dark.css'
let g:mkdp_preview_options = {
  \ 'mkit': {},
  \ 'katex': {},
  \ 'uml': {},
  \ 'maid': {},
  \ 'disable_sync_scroll': 0,
  \ 'sync_scroll_type': 'middle',
  \ 'hide_yaml_meta': 1
  \ }
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_open_ip = ''
" let g:mkdp_browser = ''0
" let g:mkdp_browserfunc = ''
" let g:mkdp_port = ''


" Ranger
" -----------------------------
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>a :Ranger<CR>
nnoremap <leader>A :RangerCurrentFileExistingOrNewTab<CR>


" vim-easy-align
" -----------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" niceblock
" -----------------------------
xmap I  <Plug>(niceblock-I)
xmap A  <Plug>(niceblock-A)

" Language
" ---------------

let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0

let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.root', 'package.json', '.git','.git/','.vscode/']
let g:rooter_use_lcd = 1

" echodoc
" -----------------------------
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'float'

" vim-snippets
" -----------------------------
let g:ultisnips_python_style = "google"
let g:ultisnips_author='liuyinz'
let g:ultisnips_python_triple_quoting_style = "single"
let g:ultisnips_javascript = {
  \ 'keyword-spacing': 'always',
  \ 'semi': 'never',
  \ 'space-before-function-paren': 'always',
  \ }

" Polyglot
" -----------------------------
let g:polyglot_disabled = []
let g:python_highlight_all = 1
