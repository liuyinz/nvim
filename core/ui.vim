" UI

" Theme
" -----------------------------
function! Has_Color(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

if Has_Color('space_vim_theme')
    colorscheme space_vim_theme
endif

" Highlignt
" -----------------------------
" term
let g:terminal_color_0  = '#292b2e'
let g:terminal_color_1  = '#ff5b82'
let g:terminal_color_2  = '#47d7a0'
let g:terminal_color_3  = '#e7e562'
let g:terminal_color_4  = '#5db3ee'
let g:terminal_color_5  = '#da6cda'
let g:terminal_color_6  = '#56e8ea'
let g:terminal_color_7  = '#ececec'
let g:terminal_color_8  = '#423f38'
let g:terminal_color_9  = '#ff5b82'
let g:terminal_color_10 = '#47d7a0'
let g:terminal_color_11 = '#e7e562'
let g:terminal_color_12 = '#5db3ee'
let g:terminal_color_13 = '#da6cda'
let g:terminal_color_14 = '#56e8ea'
let g:terminal_color_15 = '#ececec'

" Coc-git gitter signcolumn
highlight GutterAdd         gui=bold guifg=#67b11d guibg=#292b2e
highlight GutterChange      gui=bold guifg=#e18254 guibg=#292b2e
highlight GutterDelete      gui=bold guifg=#f2241f guibg=#292b2e
highlight GutterChangeDelet gui=bold guifg=#ce537a guibg=#292b2e

" repo coc-highlight
highlight CocHighlightText guifg=None guibg=#544B64

" repo: vim-scripts/xml.vim
highlight MatchTag guifg=None guibg=#544B64

" vimdiff color
highlight DiffAdd    guifg=none    guibg=#4B5634 gui=none
highlight DiffDelete guifg=#ab464b guibg=#ab464b gui=none
highlight DiffChange guibg=#3e3a45 guifg=none    gui=none
highlight DiffText   guibg=#675d78 guifg=none    gui=bold

" Defx-git
hi Defx_git_Ignored   guifg=NONE
hi Defx_git_Unknown   guifg=NONE
hi Defx_git_Untracked guifg=#C65378
hi Defx_git_Renamed   guifg=#00ff7f
hi Defx_git_Modified  guifg=#00ff7f
hi Defx_git_Unmerged  guifg=#5298D5
hi Defx_git_Deleted   guifg=#FF0000
hi Defx_git_Staged    guifg=#e6e666

" Leaderf-popupp
highlight def link Lf_hl_popup_window Pmenu
highlight def link Lf_hl_popup_cwd    Lf_hl_popup_category
highlight def link Lf_hl_help         Comment
highlight def link Lf_hl_helpCmd      Identifier

highlight def Lf_hl_popup_cursor       guifg=#14212b guibg=#C65378 gui=NONE
highlight def Lf_hl_popup_inputText    guifg=#ecebf0 guibg=#34323E gui=bold
highlight def Lf_hl_popup_blank        guifg=NONE    guibg=#34323E gui=NONE
highlight def Lf_hl_popup_prompt       guifg=#C65378 guibg=NONE    gui=bold
highlight def Lf_hl_popup_lineInfo     guifg=#353129 guibg=#dce6da gui=bold
highlight def Lf_hl_popup_total        guifg=#f2ebc7 guibg=#6e7476 gui=bold
highlight def Lf_hl_popup_spin         guifg=#e6e666 guibg=NONE    gui=NONE
highlight def Lf_hl_popup_normalMode   guifg=#333300 guibg=#99C27C gui=bold
highlight def Lf_hl_popup_inputMode    guifg=#003333 guibg=#65B0ED gui=bold
highlight def Lf_hl_popup_nameOnlyMode guifg=#14212b guibg=#C65378 gui=bold
highlight def Lf_hl_popup_fullPathMode guifg=#14212b guibg=#C65378 gui=bold
highlight def Lf_hl_popup_fuzzyMode    guifg=#14212b guibg=#C65378 gui=bold
highlight def Lf_hl_popup_regexMode    guifg=#14212b guibg=#e6e666 gui=bold
highlight def Lf_hl_popup_category     guifg=#f2ebc7 guibg=#6e7476 gui=bold

highlight def Lf_hl_match       guifg=#00ff7f guibg=NONE gui=bold
highlight def Lf_hl_match0      guifg=#00ff7f guibg=NONE gui=bold
highlight def Lf_hl_match1      guifg=#43b9f0 guibg=NONE gui=bold
highlight def Lf_hl_match2      guifg=#e6e666 guibg=NONE gui=bold
highlight def Lf_hl_match3      guifg=#3ff5d1 guibg=NONE gui=bold
highlight def Lf_hl_match4      guifg=#FF0000 guibg=NONE gui=bold
highlight def Lf_hl_matchRefine guifg=Magenta guibg=NONE gui=bold
highlight def Lf_hl_cursorline         guifg=#C65378 guibg=#212026 gui=bold
highlight def Lf_hl_selection          guifg=Black   guibg=#a5eb84 gui=NONE
