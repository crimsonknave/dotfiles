" fzf
let g:fzf_vim = {}

" Don't search filenames, line numbers or columns
command!      -bang -nargs=* AgOnlyContents                               call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
