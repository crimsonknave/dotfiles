set background=dark
" silent! color jellybeans
autocmd vimenter * ++nested colorscheme gruvbox

" For airline
" Search in https://www.nerdfonts.com/cheat-sheet
let g:airline_theme="gruvbox_dark"
function! AirlineCustomizations ()
  let g:airline_symbols.readonly = ""
  let g:airline_symbols.whitespace = ""
  let g:airline_symbols.maxlinenr = ""
  let g:airline_symbols.linenr = ""
  let g:airline_symbols.colnr = ""
  let g:airline_symbols.branch = ""
  let g:airline_symbols.notexists = " "
  let g:airline_symbols.dirty = ""
  let g:airline_symbols.crypt = "󰪪"
  " Left/right is not the direction they face, but the side they are used on?
  let g:airline_right_sep = ""
  let g:airline_right_alt_sep = ""
  let g:airline_left_sep = ""
  let g:airline_left_alt_sep = ""
  echo "custom"
endfunction
autocmd User AirlineAfterInit call AirlineCustomizations()

" 256 colors
set t_Co=256

" set command bar height
set cmdheight=1


