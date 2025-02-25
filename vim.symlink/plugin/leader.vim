" Note leader s is not taken by split
"map <Leader>r :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>a :call RunLastSpec()<CR>

" set a map leader that and a save shortcut
" Leader is already \
let mapleader = ','
" Don't do below, it messes up window swap!
" nmap <leader>w :w<cr>

map <leader><space> :noh<cr>
map <leader>e :Explore<cr> 

" Spelling shortcuts
" map <leader>ss :setlocal spell!<cr>
map <leader>ss :call ToggleSpell()<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? :call FzfSpell()<cr>
map <leader>s/ :call FzfSpell()<cr>

map <leader>v :vs<cr>
map <leader>s :sp<cr>

map <leader>'' cs"'
map <leader>"" cs'"

" git
map <leader>gs :GFiles?<cr>
map <leader>gb :Git blame<cr>
map <leader>gc :Commits<cr>

map <leader>n :lnext<cr>
map <leader>p :lprev<cr>

map <leader>f :ALEFix<cr>
autocmd FileType cs map <leader>f :OmniSharpCodeFormat<cr>

" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" File search
nmap <leader>t :GFiles<cr>
nmap <leader>T :Files<cr>

nmap <leader>rg :Rg <C-R><C-W><CR>
nmap <Leader>* :AgOnlyContents <C-R><C-W><CR>
nmap <Leader>a :AgOnlyContents <CR>
nmap <Leader>A :Ag <CR>
" map <leader>a :Ack!<Space>

"tags
nmap <leader>ct :Tags<cr>

" Vim Introspection
nmap <leader>m :Marks<cr>
nmap <leader>h :History:<cr>
nmap <leader>c :Commands<cr>

" Numbers
nmap <leader>i <C-a>
nmap <leader>d <C-x>

" Color
nmap <leader>ch :ColorToggle

" Coverage
nmap <leader>hc :HighlightCoverage <CR>
nmap <leader>hco :HighlightCoverageOff <CR>
