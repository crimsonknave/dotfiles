" vim-airline theme for Gruvbox <https://github.com/morhetz/gruvbox>
"
" Based off the default dark theme, but with Gruvbox colors.
" Provides a more colorful, but also noisier theme than the
" airline theme included with Gruvbox.
"
" Author:  crimsonknave (based on work by morhetz)
" License: MIT License

let g:airline#themes#gruvbox_dark#palette = {}

let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]
let s:gb.dark0       = ['#282828', 235]
let s:gb.dark0_soft  = ['#32302f', 236]
let s:gb.dark2       = ['#504945', 239]
let s:gb.dark3       = ['#665c54', 241]

let s:gb.light1      = ['#ebdbb2', 223]
let s:gb.light4      = ['#a89984', 246]

let s:gb.bright_blue    = ['#83a598', 109]
let s:gb.bright_purple  = ['#d3869b', 175]

let s:gb.neutral_red    = ['#cc241d', 124]
let s:gb.neutral_green  = ['#98971a', 106]
let s:gb.neutral_yellow = ['#d79921', 172]
let s:gb.neutral_blue   = ['#458588', 66]
let s:gb.neutral_purple = ['#b16286', 132]
let s:gb.neutral_aqua   = ['#689d6a', 72]
let s:gb.neutral_orange = ['#d65d0e', 166]

let s:gb.faded_red      = ['#9d0006', 88]
let s:gb.faded_yellow   = ['#b57614', 136]
let s:gb.faded_blue     = ['#076678', 24]
let s:gb.faded_purple   = ['#8f3f71', 96]
let s:gb.faded_orange   = ['#af3a03', 130]

" Grabbed from the apprentice theme
function! s:color_list(fg, bg, style) abort
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1], a:style]
endfunction


let s:modified = {
      \ 'airline_c': s:color_list(s:gb.light1, s:gb.neutral_purple, ''),
      \ }

let s:warning = s:color_list(s:gb.dark0, s:gb.neutral_orange, 'bold')
let s:error = s:color_list(s:gb.dark0, s:gb.neutral_red, 'bold')

let s:airline_a_normal   = s:color_list(s:gb.dark0, s:gb.neutral_green, '')
let s:airline_b_normal   = s:color_list(s:gb.light1, s:gb.dark3, '')
let s:airline_c_normal   = s:color_list(s:gb.neutral_blue, s:gb.dark0, '')
let g:airline#themes#gruvbox_dark#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#gruvbox_dark#palette.normal_modified = s:modified
let g:airline#themes#gruvbox_dark#palette.normal.airline_warning = s:warning
let g:airline#themes#gruvbox_dark#palette.normal.airline_error = s:error

let s:airline_a_insert = s:color_list(s:gb.dark0,  s:gb.bright_blue, '')
let s:airline_b_insert = s:color_list(s:gb.light1, s:gb.neutral_blue, '')
let s:airline_c_insert = s:color_list(s:gb.light1, s:gb.faded_blue, '')
let g:airline#themes#gruvbox_dark#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#gruvbox_dark#palette.insert_modified = s:modified
let g:airline#themes#gruvbox_dark#palette.insert.airline_warning = s:warning
let g:airline#themes#gruvbox_dark#palette.insert.airline_error = s:error
let g:airline#themes#gruvbox_dark#palette.insert_paste = {
      \ 'airline_a': s:color_list(s:airline_a_insert, s:gb.neutral_yellow, ''),
      \ }

let g:airline#themes#gruvbox_dark#palette.terminal = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

let g:airline#themes#gruvbox_dark#palette.replace = copy(g:airline#themes#gruvbox_dark#palette.insert)
let g:airline#themes#gruvbox_dark#palette.replace.airline_a = s:color_list(s:airline_b_insert, s:gb.neutral_red, '')
let g:airline#themes#gruvbox_dark#palette.replace_modified = s:modified
let g:airline#themes#gruvbox_dark#palette.insert.airline_warning = s:warning
let g:airline#themes#gruvbox_dark#palette.insert.airline_error = s:error


let s:airline_a_visual = s:color_list(s:gb.dark0, s:gb.faded_yellow, '')
let s:airline_b_visual = s:color_list(s:gb.dark0, s:gb.faded_orange, '')
let s:airline_c_visual = s:color_list(s:gb.light1, s:gb.faded_red, '')
let g:airline#themes#gruvbox_dark#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#gruvbox_dark#palette.visual_modified = s:modified
let g:airline#themes#gruvbox_dark#palette.visual.airline_warning = s:warning
let g:airline#themes#gruvbox_dark#palette.visual.airline_error = s:error


let s:airline_a_inactive = s:color_list(s:gb.dark2, s:gb.dark0_hard, '')
let s:airline_b_inactive = s:color_list(s:gb.dark2, s:gb.dark0, '')
let s:airline_c_inactive = s:color_list(s:gb.light4, s:gb.dark0_soft, '')
let g:airline#themes#gruvbox_dark#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#gruvbox_dark#palette.inactive_modified = {
      \ 'airline_c': s:color_list(s:gb.bright_purple, '', ''),
      \ }

" For commandline mode, we use the colors from normal mode, except the mode
" indicator should be colored differently, e.g. light green
let s:airline_a_commandline = s:color_list(s:gb.dark0, s:gb.neutral_aqua, '')
let s:airline_b_commandline = s:color_list(s:gb.light1, s:gb.dark3, '')
let s:airline_c_commandline = s:color_list(s:gb.neutral_blue, s:gb.dark0, '')
let g:airline#themes#gruvbox_dark#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)

let g:airline#themes#gruvbox_dark#palette.commandline.airline_warning = s:warning
let g:airline#themes#gruvbox_dark#palette.commandline.airline_error = s:error

let g:airline#themes#gruvbox_dark#palette.accents = {
      \ 'red': s:color_list(s:gb.neutral_red, '', ''),
      \ }

if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#gruvbox_dark#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ s:color_list(s:gb.light1, s:gb.faded_purple, '')
        \ s:color_list(s:gb.light1, s:gb.faded_blue, '')
        \ s:color_list(s:gb.faded_purple, s:gb.light1, '')
endif
