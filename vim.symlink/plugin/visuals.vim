set background=dark
let g:python_hightlight_all = 1
" silent! color jellybeans
function! SetColorScheme ()
  colorscheme gruvbox
  " Override some of the gruvbox highlights as they don't make sense to me
  " and/or shared a color (warnings and search were both yellow)
  hi! link ALEWarning GruvboxOrangeUnderline
  hi! link ALEWarningSign GruvboxOrangeSign
  hi! link ALEVirtualTextWarning GruvboxOrange
  hi! link Search GruvboxAquaUnderline
  hi! link CurSearch GruvboxGreenUnderline
  hi! link IncSearch GruvboxGreenUnderline
  " Funcions and strings were bot the same green, which was weird
  hi! link Function GruvboxBlue
endfunction
autocmd vimenter * ++nested call SetColorScheme()
" colorscheme gruvbox

" Highlighting warnings and errors doesn't work for omnisharp without this
let g:gruvbox_guisp_fallback = 'bg'

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
" set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif

" set command bar height
set cmdheight=1

" let g:colorizer_auto_filetype = "html,css,markdown,vim"
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
