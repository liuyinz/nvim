" Nice Fold
" Behaviors:
" - Improve folds performance after modification
" - Set a nice pattern for collapsed folds
" -----------------------------
if exists('g:loaded_nicefold')
    finish
endif
let g:loaded_nicefold = 1

" Fast fold
" Credits: https://github.com/Shougo/shougo-s-github
augroup plugin_fastfold
    autocmd!
    autocmd TextChangedI,TextChanged *
      \  if &l:foldenable && &l:foldmethod !=# 'manual'
      \|   let b:foldmethod_save = &l:foldmethod
      \|   let &l:foldmethod = 'manual'
      \| endif

    autocmd BufWritePost *
      \  if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save')
      \|   let &l:foldmethod = b:foldmethod_save
      \|   execute 'normal! zx'
      \| endif
augroup END

if has('folding')
    set foldtext=FoldText()
endif

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
    " Get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = ' ' . foldSize . ' lines '
    let foldLevelStr = repeat('+--', v:foldlevel)
    let lineCount = line('$')
    let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
    let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction


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
