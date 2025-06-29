" Note leader s is not taken by split
"map <Leader>r :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>a :call RunLastSpec()<CR>

" set a map leader that and a save shortcut
" Leader is already \
let mapleader = ','
" Don't do below, it messes up window swap!
" nmap <leader>w :w<cr>
"
" Used prefaces
" a - ag/search file contents
" b - 
" c - tags, color
" d - debug
" e == Explore
" f == Fix/Format
" g - Git
" h == history, highlight coverage
" i -
" j == decrement
" k == increment
" l - list commands
" m == marks
" n == next
" o -
" p == previous
" q -
" r - ripgrep
" s - Spelling, split
" t == Search git file names (T == all)
" u -
" v - vertical split
" w -
" x -
" y -
" z -
" , - Copilot
" Space == Clear search highlights
" Tab == Search mappings  comm
" Ctrl + x == Insert mode completion
" * - Search current word

map <leader><space> :noh<cr>
map <leader>e :Explore<cr> 

" Spelling shortcuts - s
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

" git - g
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
nmap <leader>lc :Commands<cr>

" Numbers
nmap <leader>k <C-a>
nmap <leader>j <C-x>

" Color
nmap <leader>ch :ColorToggle <CR>

" Coverage
nmap <leader>hc :HighlightCoverage <CR>
nmap <leader>hco :HighlightCoverageOff <CR>

" Vimspector - d
nnoremap <Leader>ds :call vimspector#Launch()<CR>
" quit
nnoremap <Leader>dq :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dr <Plug>VimspectorRestart
nmap <Leader>dk <Plug>VimspectorStepOut
nmap <Leader>dj <Plug>VimspectorStepInto
nmap <Leader>dl <Plug>VimspectorStepOver

nmap <Leader>du <Plug>VimspectorUpFrame
nmap <Leader>dd <Plug>VimspectorDownFrame

" Copilot - ,
nmap <leader>,e :Copilot enable<CR>
nmap <leader>,d :Copilot disable<CR>
nmap <leader>,s :Copilot status<CR>
nmap <leader>,o :Copilot panel<CR>
nmap <leader>,q <Plug>(copilot-dismiss)
nmap <leader>,n <Plug>(copilot-next)
nmap <leader>,p <Plug>(copilot-previous)
nmap <leader>,q <Plug>(copilot-dismiss)
nmap <leader>,q <Plug>(copilot-dismiss)

" Existing leader mappings
" NerdCommenter - c
" Futitive(Git) - g
