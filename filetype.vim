" File-type Detection
" ------------------------------------------------

if exists('did_load_filetypes')
    finish
endif

augroup filetypedetect
    autocmd BufNewFile,BufRead */playbooks/*.{yml,yaml} setf yaml.ansible
    autocmd BufNewFile,BufRead */inventory/*            setf ansible_hosts
    autocmd BufNewFile,BufRead */templates/*.{yaml,tpl} setf yaml.gotexttmpl
    autocmd BufNewFile,BufRead yarn.lock                setf yaml
    autocmd BufNewFile,BufRead */.kube/config           setf yaml
    autocmd BufNewFile,BufRead *.postman_collection     setf json
    autocmd BufNewFile,BufRead .tern-{project,port}     setf json
    autocmd BufNewFile,BufRead *.lock                   setf json
    autocmd BufNewFile,BufRead *.js.map                 setf json
    autocmd BufNewFile,BufRead .jsbeautifyrc            setf json
    autocmd BufNewFile,BufRead .eslintrc                setf json
    autocmd BufNewFile,BufRead .prettierrc              setf json
    autocmd BufNewFile,BufRead .jscsrc                  setf json
    autocmd BufNewFile,BufRead .babelrc                 setf json
    autocmd BufNewFile,BufRead .watchmanconfig          setf json
    autocmd BufNewFile,BufRead .buckconfig              setf toml
    autocmd BufNewFile,BufRead .flowconfig              setf ini
    autocmd BufNewFile,BufRead *.{feature,story}        setf cucumber
    autocmd BufNewFile,BufRead Jenkinsfile              setf groovy
    autocmd BufNewFile,BufRead Tmuxfile,tmux/config     setf tmux
    autocmd BufNewFile,BufRead Brewfile                 setf ruby
    autocmd BufNewFile,BufRead *.zsh                    setf sh
    autocmd BufNewFile,BufRead *.log                    setf log
    autocmd BufNewFile,BufRead *.cjson                  setf jsonc
    autocmd BufNewFile,BufRead coc-settings.json        setf jsonc
augroup END
