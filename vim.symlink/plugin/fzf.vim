" fzf
let g:fzf_vim = {}
let g:fzf_history_directory = '~/.local/share/fzf-history'

" Don't search filenames, line numbers or columns
command!      -bang -nargs=* AgOnlyContents                               call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
