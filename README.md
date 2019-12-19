## Vim

### Motion

- Leader

| Keys    | Description    |
| ------- | -------------- |
| `Space` | LeaderKey      |
| `;`     | LocalLeaderKey |

- Line

| Keys         | Mode | Description             |
| ------------ | ---- | ----------------------- |
| `Ctrl` + `a` | I,C  | move the head of line   |
| `Ctrl` + `e` | I,C  | move the end of line    |
| `Ctrl` + `b` | I,C  | move left               |
| `Ctrl` + `f` | I,C  | move rght               |
| `Ctrl` + `h` | I,C  | BackSpace               |
| `Ctrl` + `d` | I,C  | Delete                  |
| `Ctrl` + `w` | I,C  | delete the whole word   |
| `Ctrl` + `u` | I,C  | delete to the beginning |

- Buffer

| Keys  | Mode  | Description                  |
| ----- | ----- | ---------------------------- |
| `j`   | N,V   | gj                           |
| `k`   | N,V   | gk                           |
| `ml`  | N,X,O | easymotion-move-line         |
| `mf`  | N,X,O | easymotion-move-char         |
| `m/`  | N,X,O | easymotion-move-char-multi   |
| `mw`  | N,X,O | easymotion-move-word-begin   |
| `mww` | N,X,O | easymotion-move-WORD-begin   |
| `me`  | N,X,O | easymotion-move-word-end     |
| `mee` | N,X,O | easymotion-move-WORD-end     |
| `mr`  | N,X,O | easymotion-move-repeat       |
| `mn`  | N,X,O | easymotion-move-match-select |

- Window

| Keys       | Mode | Description      |
| ---------- | ---- | ---------------- |
| `,`        | N    | ChooseWin        |
| `,` + `,`  | N    | prev window      |
| `,` + `g`  | N    | swap window      |
| `,` + `G`  | N    | swap&stay window |
| `,` + `gg` | N    | reswap           |
| `,` + `k`  | N    | tab close        |

### Window & Tab

| Keys             | Mode | Description      |
| ---------------- | ---- | ---------------- |
| `<leader>` + `n` | N    | vertical new     |
| `<leader>` + `h` | N    | horizon split    |
| `<leader>` + `v` | N    | vertical split   |
| `<leader>` + `o` | N    | only win         |
| `<leader>` + `K` | N    | change layout    |
| `<leader>` + `H` | N    | change layout    |
| `<leader>` + `T` | N    | move to next tab |
| `<leader>` + `=` | N    | equal win size   |

### LeaderKey

| Keys              | Mode | Description            |
| ----------------- | ---- | ---------------------- |
| `<leader>` + `w`  | N,V  | write                  |
| `<leader>` + `ww` | N,V  | sudo write             |
| `<Leader>` + `wq` | N    | swrite & quit          |
| `<leader>` + `q`  | N,V  | quit                   |
| `<leader>` + `d`  | N,V  | close buffer           |
| `<Leader>` + `e`  | N    | open defx              |
| `<Leader>` + `a`  | N    | open ranger            |
| `<Leader>` + `f`  | N    | run autoformat         |
| `<Leader>` + `u`  | N    | open mundo             |
| `<Leader>` + `q`  | N    | quit window            |
| `<Leader>` + `r`  | N    | open quickrun          |
| `<Leader>` + `%`  | N    | jump to tag            |
| `<Leader>` + `z`  | N    | dash search            |
| `<Leader>` + `cc` | N    | Comment Toggle         |
| `<Leader>` + `cy` | N    | Comment Yank           |
| `<Leader>` + `ci` | N    | Comment 2Eol           |
| `<Leader>` + `ca` | N    | Comment Append         |
| `<Leader>` + `cs` | N    | Comment Switch         |
| `<Leader>` + `yr` | N    | Yank relative path     |
| `<Leader>` + `ya` | N    | Yank absolute path     |
| `<leader>` + `ss` | N    | substitute             |
| `<leader>` + `st` | N    | subvert                |
| `<leader>` + `cd` | N    | change local dir       |
| `<Leader>` + `ll` | N    | add modeline           |
| `<Leader>` + `cn` | N,V  | change word repeatable |
| `<Leader>` + `cN` | N,V  | change word repeatable |
| `<Leader>` + `t`  | N    | open Goyo              |

### Defx

| Keys             | Mode | Description                    |
| ---------------- | ---- | ------------------------------ |
| `<Leader>` + `e` | N    | open defx                      |
| `q`              | Defx | exit defx                      |
| `h`              | Defx | Return to the parent directory |
| `l`              | Defx | open file or folder            |
| `n`              | Defx | touch new file or dir          |
| `dd`             | Defx | delete                         |
| `rn`             | Defx | rename                         |
| `cd`             | Defx | cd \\\$HOME                    |
| `sv`             | Defx | Open in vsplit                 |
| `sh`             | Defx | Open in hsplit                 |
| `st`             | Defx | Open in new tab                |
| `tt`             | Defx | toogle tree                    |
| `tr`             | Defx | toogle tree -r                 |
| `zh`             | Defx | show ignore files              |
| `yp`             | Defx | copy the path of file          |
| `space`          | Defx | toggle select                  |
| `v`              | Defx | toggle select all              |
| `Ctrl` + `r`     | Defx | redraw                         |
| `yy`             | Defx | copy                           |
| `mv`             | Defx | move                           |
| `pp`             | Defx | paste                          |

### CoC

| Keys                   | Mode | Description              |
| ---------------------- | ---- | ------------------------ |
| `<localleader>` + `cd` | N    | CocList Diagnostics      |
| `<localleader>` + `km` | N    | CocList maps             |
| `<localleader>` + `vc` | N    | CocList vimcommands      |
| `<localleader>` + `qf` | N    | CocList quickfix         |
| `<localleader>` + `cj` | N    | Cocnext                  |
| `<localleader>` + `ck` | N    | CocPrev                  |
| `Tab`                  | S    | Jump to next snippets    |
| `Shift` + `Tab`        | S    | Jump to prev snippets    |
| `Ctrl` + `j`           | I    | completion down          |
| `Ctrl` + `k`           | I    | completion up            |
| `Ctrl` + `m`           | I,S  | Confirm                  |
| `[` + `d`              | N    | coc-diagnostic-prechunk  |
| `]` + `d`              | N    | coc-diagnostic-nextchunk |
| `[` + `g`              | N    | coc-git-prechunk         |
| `]` + `g`              | N    | coc-git-nextchunk        |
| `gd`                   | N    | jump to definition       |
| `gy`                   | N    | coc-type-definition      |
| `gi`                   | N    | coc-implementation       |
| `gr`                   | N    | coc-references           |
| `gD`                   | N    | coc-declaration          |
| `gl`                   | N    | coc-openlink             |
| `gn`                   | N    | coc-rename               |
| `gs`                   | N    | coc-git-chunkinfo        |
| `gc`                   | N    | coc-git-commit           |
| `gm`                   | N    | coc-codeaction           |

### Git

| Keys                    | Description     |
| ----------------------- | --------------- |
| `<localleader>` + `ga`  | Git add         |
| `<localleader>` + `gb`  | Git browse      |
| `<localleader>` + `gbl` | Git blame       |
| `<localleader>` + `gc`  | Git commits     |
| `<localleader>` + `gd`  | Git diff-staged |
| `<localleader>` + `gmt` | Git mergetool   |
| `<localleader>` + `gf`  | Git fetch       |
| `<localleader>` + `gl`  | GV log-all      |
| `<localleader>` + `glb` | GV log-buffer   |
| `<localleader>` + `gm`  | Git merge       |
| `<localleader>` + `gs`  | Git status      |
| `<localleader>` + `gw`  | save & Git add  |
| `<localleader>` + `gp`  | Git push        |
| `<localleader>` + `gpl` | Git pull        |
| `<localleader>` + `grb` | Git rebase      |
| `<localleader>` + `grm` | Git remove      |
| `<localleader>` + `grn` | Git rename      |

### Abolish

| keys        | mode | description |
| ----------- | ---- | ----------- |
| `crm`       | N    | mixedcase   |
| `crc`       | N    | camelcase   |
| `crs`       | N    | snake_case  |
| `cru`       | N    | upper_case  |
| `cr`-       | N    | dash-case   |
| `cr`.       | N    | dot.case    |
| `cr<space>` | N    | space case  |

### Unimpaired

| keys     | mode | descriptioN                               |
| -------- | ---- | ----------------------------------------- |
| `[a`     | N    | :previous                                 |
| `]a`     | N    | :Next                                     |
| `[a`     | N    | :first                                    |
| `]a`     | N    | :last                                     |
| `[b`     | N    | :bprevious                                |
| `]b`     | N    | :bNext                                    |
| `[b`     | N    | :bfirst                                   |
| `]b`     | N    | :blast                                    |
| `[l`     | N    | :lprevious                                |
| `]l`     | N    | :lNext                                    |
| `[l`     | N    | :lfirst                                   |
| `]l`     | N    | :llast                                    |
| `[<c-l>` | N    | :lpfile                                   |
| `]<c-l>` | N    | :lNfile                                   |
| `[q`     | N    | :cprevious                                |
| `]q`     | N    | :cNext                                    |
| `[q`     | N    | :cfirst                                   |
| `]q`     | N    | :clast                                    |
| `[<c-q>` | N    | :cpfile                                   |
| `]<c-q>` | N    | :cNfile                                   |
| `[t`     | N    | :tprevious                                |
| `]t`     | N    | :tNext                                    |
| `[t`     | N    | :tfirst                                   |
| `]t`     | N    | :tlast                                    |
| `[<c-t>` | N    | :ptprevious                               |
| `]<c-t>` | N    | :ptNext                                   |
| `>p`     | N    | Paste after linewise, increasing indent.  |
| `>P`     | N    | Paste before linewise, increasing indent. |
| `<p`     | N    | Paste after linewise, decreasing indent.  |
| `<P`     | N    | Paste before linewise, decreasing indent. |
| `=p`     | N    | Paste after linewise, reindenting.        |
| `=P`     | N    | Paste before linewise, reindenting.       |
| `[x`     | N,V  | XML encode.                               |
| `[xx`    | N    | XML encode.                               |
| `]x`     | N,V  | XML decode.                               |
| `]xx`    | N    | XML decode.                               |
| `[u`     | N,V  | URL encode.                               |
| `[uu`    | N    | URL encode.                               |
| `]u`     | N,V  | URL decode.                               |
| `]uu`    | N    | URL decode.                               |
| `[y`     | N,V  | C String encode.                          |
| `[yy`    | N    | C String encode.                          |
| `]y`     | N,V  | C String decode.                          |
| `]yy`    | N    | C String decode.                          |

### Mundo

| Keys   | Description                             |
| ------ | --------------------------------------- |
| `?`    | Help-mundo                              |
| `j/k`  | Next/Prev undo state                    |
| `J/K`  | Next/Prev write state                   |
| `i`    | Toggle 'inline diff' mode               |
| `/`    | Find changes that match string          |
| `n/N`  | Next/Prev undo that matches search      |
| `P`    | Play current state to selected undo     |
| `d`    | Vert diff of undo with current state    |
| `p`    | Diff of selected undo and current state |
| `r`    | Diff of selected undo and prior undo    |
| `q`    | Quit!                                   |
| `<cr>` | Revert to selected state                |

### Fold

| Keys | Mode | Description         |
| ---- | ---- | ------------------- |
| `za` | N    | toggle fold {count} |
| `zm` | N    | close one level     |
| `zr` | N    | open one level      |
| `zM` | N    | close all level     |
| `zR` | N    | open all level      |

### Indent

| Keys | Mode | Description            |
| ---- | ---- | ---------------------- |
| `>>` | N    | indent line {count}    |
| `<<` | N    | de-indent line {count} |
| `>`  | V    | indent                 |
| `<`  | V    | de-indent              |

### Bookmark

| Keys  | Mode | Description        |
| ----- | ---- | ------------------ |
| `ma`  | N    | show Bookmark      |
| `mm`  | N    | Toggle Bookmark    |
| `mi`  | N    | Annotate Bookmark  |
| `mj`  | N    | Next Bookmark      |
| `mk`  | N    | prev Bookmark      |
| `mc`  | N    | Clear Bookmark     |
| `mcc` | N    | clear all Bookmark |

### Function

| Keys         | Mode | Description          |
| ------------ | ---- | -------------------- |
| `Ctrl` + `p` | C    | command history up   |
| `Ctrl` + `n` | C    | command history down |
| `*`          | N    | Match                |
| `#`          | N    | match reverse        |
| `/`          | N    | search               |
| `?`          | N    | search reverse       |
| `ga`         | N,V  | EasyAlign            |
| `gb`         | N,V  | Open Browser         |
| `gf`         | N,V  | Open Filepath        |
| `gF`         | N,V  | Open Filepath:line   |
| `ss`         | X    | substitute           |
| `st`         | X    | subvert              |
| `gz`         | N,V  | Dash search cword    |
| `gzz`        | N    | Dash search cword g  |

## LeaderF

| Keys         | Description                            |
| ------------ | -------------------------------------- |
| <C-C>, <ESC> | quit from LeaderF                      |
| <C-R>        | switch fuzzy and regex                 |
| <C-F>        | switch : full path and name only       |
| <Tab>        | switch to normal mode                  |
| <C-V>        | paste from clipboard                   |
| <C-U>        | clear the prompt                       |
| <C-J>, <C-K> | navigate the result list               |
| <CR>,<C-M>   | open the file under cursor or selected |
| <C-L>        | open in vertical split window          |
| <C-X>        | open in horizontal split window        |
| <C-T>        | open in new tabpage                    |
| <C-S>        | select multiple files                  |
| <C-A>        | select all files                       |
| <C-Q>        | clear all selections                   |
| <C-P>        | preview the result                     |

## Ranger

| Keys      | Mode | Description                      |
| --------- | ---- | -------------------------------- |
| `q`       | N    | quit                             |
| `Q`       | N    | quit all                         |
| `~`       | N    | change viewmode                  |
| `]`       | N    | move parent 1                    |
| `[`       | N    | move parent -1                   |
| `=`       | N    | chmod                            |
| `i`       | N    | display file fully               |
| `?`       | N    | help                             |
| `:`       | N    | console                          |
| `od`      | N    | new dir                          |
| `of`      | N    | new file                         |
| `dd`      | N    | delete                           |
| `rn`      | N    | rename                           |
| `op`      | N    | open with                        |
| `Mp`      | N    | permisson line                   |
| `zh`      | N    | toggle hidden                    |
| `gh`      | N    | cd ~                             |
| `g/`      | N    | cd /                             |
| `cd`      | N    | :cd%space                        |
| `tn`      | N    | tab_new                          |
| `tc`      | N    | tab_close                        |
| `Tab`     | N    | tab_move 1                       |
| `yp`      | N    | yank path                        |
| `yd`      | N    | yank dir                         |
| `yn`      | N    | yank name                        |
| `y.`      | N    | yank name_without_extension      |
| `yy`      | N    | copy                             |
| `ya`      | N    | copy mode=add                    |
| `yr`      | N    | copy mode=remove                 |
| `yt`      | N    | copy mode=toggle                 |
| `pp`      | N    | paste                            |
| `po`      | N    | paste overwrite=True             |
| `pP`      | N    | paste append=True                |
| `pO`      | N    | paste overwrite=True append=True |
| `pl`      | N    | paste_symlink relative=False     |
| `pL`      | N    | paste_symlink relative=True      |
| `phl`     | N    | paste_hardlink                   |
| `pht`     | N    | paste_hardlinked_subtree         |
| `pd`      | N    | console paste dest=              |
| `xx`      | N    | cut                              |
| `ux`      | N    | uncut                            |
| `xa`      | N    | cut mode=add                     |
| `xr`      | N    | cut mode=remove                  |
| `xt`      | N    | cut mode=toggle                  |
| `f`       | N    | find                             |
| `/`       | N    | search                           |
| `n`       | N    | next                             |
| `N`       | N    | prev                             |
| `Space`   | N    | mark_toggle                      |
| `v`       | N    | mark_reverse                     |
| `uv`      | N    | quit all                         |
| `V`       | N    | toggle_visual_mode               |
| `'<any>`  | N    | enter_bookmark %any              |
| `m<any>`  | N    | set_bookmark %any                |
| `um<any>` | N    | unset_bookmark %any              |

### language

- Markdown

| Keys                   | Mode | Description          |
| ---------------------- | ---- | -------------------- |
| `<localleader>` + `mb` | N    | Open url undercursor |
| `<localleader>` + `me` | N    | Edit url undercursor |
| `<localleader>` + `md` | N    | Header decrease      |
| `<localleader>` + `mi` | N    | Header increase      |
| `<localleader>` + `mf` | N    | Table format         |
| `<localleader>` + `mt` | N    | Toc                  |
| `<localleader>` + `mp` | N    | Preview markdown     |
| `<localleader>` + `ms` | N    | Setex to atx         |

- Python

| Keys                   | Mode | Description   |
| ---------------------- | ---- | ------------- |
| `<localleader>` + `ds` | N    | Add docstring |
| `<localleader>` + `zb` | N    | Add shebang   |

### TextObj

| Keys  | Mode   | Description                             |
| ----- | ------ | --------------------------------------- |
| `aF`  | Python | textobject                              |
| `iF`  | Python | textobject                              |
| `sa`  | N      | operatore-surround prefix               |
| `sd`  | N      | operatore-surround prefix               |
| `sr`  | N      | operatore-surround prefix               |
| `saa` | N      | operatore-surround textobj-multiblock-i |
| `sdd` | N      | operatore-surround textobj-multiblock-a |
| `srr` | N      | operatore-surround textobj-multiblock-a |

### Surround

    * = ( ) { } [ ] < > b B r a  " ' ` t
    # = ( ) { } [ ] < > b B r a  " ' ` <..>
    @ = (n)jklh | {i,a}{w,W,p}
    % = { f,F,<C-f> }  + func_name <cr>

| Keys   | Mode | Description                                          |
| ------ | ---- | ---------------------------------------------------- |
| `ds*`  | N    | delete surrounding                                   |
| `cs*#` | N    | change surrounding                                   |
| `ys@#` | N    | add surrounding for @                                |
| `yss#` | N    | add surrounding for whole line                       |
| `ys@%` | N    | wrap @ with func:func(@),func( @ ),(func @)          |
| `yss%` | N    | wrap whole line with func                            |
| `yS`   | N    | same with ys but indent and place one line           |
| `ySS`  | N    | same with yss but indent and place one line          |
| `S#`   | V    | Wrap selection:v,V(indent oneline),<C-v>(every line) |

### EasyAlign

    @ = {2,3,...,-2,-,* | **} + {<Space>, =, :, ., |, &, #, ,, | <regex><C-x> }

| Keys    | Mode |
| ------- | ---- |
| `gaip@` | N    |
| `gaap@` | N    |
| `ga@`   | V    |

| Keys      | Option           | Values                                         |
| --------- | ---------------- | ---------------------------------------------- |
| `<cr>`    | alignment        | left,right,center                              |
| `CTRL-F`  | filter           | Input string ([gv]/.\*/?)                      |
| `CTRL-I`  | indentation      | shallow, deep, none, keep                      |
| `CTRL-L`  | left_margin      | Input number or string                         |
| `CTRL-R`  | right_margin     | Input number or string                         |
| `CTRL-D`  | delimiter_align  | left, center, right                            |
| `CTRL-U`  | ignore_unmatched | 0, 1                                           |
| `CTRL-G`  | ignore_groups    | ['String'], ['Comment'], ['String', 'Comment'] |
| `CTRL-A`  | align            | Input string (/[lrc]+\*{0,2}/)                 |
| `<Left>`  | stick_to_left    | { 'stick_to_left': 1, 'left_margin': 0 }       |
| `<Right>` | stick_to_left    | { 'stick_to_left': 0, 'left_margin': 1 }       |
| `<Down>`  | \*\_margin       | { 'left_margin': 0, 'right_margin': 0 }        |

### Far

    x, v_x   Exclude item under the cursor.
    i, v_i   Include item under the cursor.
    t, v_t   Toggle item exclusion under the cursor.
    X        Exclude all items.
    I        Include all items.
    T        Toggle exclusion for all items.
    <CR>     Jump to the source code of the item under the cursor.
    p        Open preview window (if not) and scroll to the item under the cursor.
    P        Close preview window.
    CTRL-K   Scroll preview window up (if open).
    CTRL-J   Scroll preview window down (if open).
    zo       Expand node under the cursor.
    zc       Collapse node under the cursor.
    za       Toggle node expanding under the cursor.
    zr       Expand all nodes.
    zm       Collapse all nodes.
    zA       Toggle exclusion for all nodes.

## Tmux

| Keys             | Description             |
| ---------------- | ----------------------- |
| `Ctrl` + `space` | PREFIX                  |
| `Ctrl` + `e`     | edit conf               |
| `Ctrl` + `r`     | reload conf             |
| `Ctrl` + `s`     | toggle statusbar        |
| `Space`          | change Window           |
| `,`              | split window vertical   |
| `.`              | split window horizontal |
| `i`              | select-pane left        |
| `j`              | select-pane down        |
| `k`              | select-pane up          |
| `l`              | select-pane right       |
| `[`              | swap-pane -D            |
| `]`              | swap-pane -dD           |
| `x`              | kill-pane               |
| `X`              | kill-pane -all          |
| `c`              | new-window              |
| `q`              | kill-window             |
| `r`              | rename-window           |
| `Q`              | kill-session            |
