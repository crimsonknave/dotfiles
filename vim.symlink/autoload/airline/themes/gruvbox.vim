" MIT License. Copyright (c) 2013-2021 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2 tw=80

scriptencoding utf-8

" Airline themes are generated based on the following concepts:
"   * The section of the status line, valid Airline statusline sections are:
"       * airline_a (left most section)
"       * airline_b (section just to the right of airline_a)
"       * airline_c (section just to the right of airline_b)
"       * airline_x (first section of the right most sections)
"       * airline_y (section just to the right of airline_x)
"       * airline_z (right most section)
"   * The mode of the buffer, as reported by the :mode() function.  Airline
"     converts the values reported by mode() to the following:
"       * normal
"       * insert
"       * replace
"       * visual
"       * inactive
"       * terminal
"       The last one is actually no real mode as returned by mode(), but used by
"       airline to style inactive statuslines (e.g. windows, where the cursor
"       currently does not reside in).
"   * In addition to each section and mode specified above, airline themes
"     can also specify overrides.  Overrides can be provided for the following
"     scenarios:
"       * 'modified'
"       * 'paste'
"
" Airline themes are specified as a global viml dictionary using the above
" sections, modes and overrides as keys to the dictionary.  The name of the
" dictionary is significant and should be specified as:
"   * g:airline#themes#<theme_name>#palette
" where <theme_name> is substituted for the name of the theme.vim file where the
" theme definition resides.  Airline themes should reside somewhere on the
" 'runtimepath' where it will be loaded at vim startup, for example:
"   * autoload/airline/themes/theme_name.vim
"
" For this, the gruvbox.vim, theme, this is defined as
let g:airline#themes#gruvbox#palette = {}

" Keys in the dictionary are composed of the mode, and if specified the
" override.  For example:
"   * g:airline#themes#gruvbox#palette.normal
"       * the colors for a statusline while in normal mode
"   * g:airline#themes#gruvbox#palette.normal_modified
"       * the colors for a statusline while in normal mode when the buffer has
"         been modified
"   * g:airline#themes#gruvbox#palette.visual
"       * the colors for a statusline while in visual mode
"
" Values for each dictionary key is an array of color values that should be
" familiar for colorscheme designers:
"   * [guifg, guibg, ctermfg, ctermbg, opts]
" See "help attr-list" for valid values for the "opt" value.
"
" Each theme must provide an array of such values for each airline section of
" the statusline (airline_a through airline_z).  A convenience function,
" airline#themes#generate_color_map() exists to mirror airline_a/b/c to
" airline_x/y/z, respectively.

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#282828', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#3c3836', 237]     " 60-56-54
let s:gb.dark2       = ['#504945', 239]     " 80-73-69
let s:gb.dark3       = ['#665c54', 241]     " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#928374', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gb.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gb.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gb.light3      = ['#bdae93', 248]     " 189-174-147
let s:gb.light4      = ['#a89984', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

let s:modified = {
      \ 'airline_c': [ s:gb.light1[0], s:gb.neutral_purple[0], s:gb.light1[1], s:gb.neutral_purple[1], ''] ,
      \ }

let s:warning = [ s:gb.dark0[0], s:gb.neutral_orange[0], s:gb.dark0[1], s:gb.neutral_orange[1], 'bold']
let s:error = [ s:gb.dark0[0], s:gb.neutral_red[0], s:gb.dark0[1], s:gb.neutral_red[1], 'bold']
" The gruvbox.vim theme:
let s:airline_a_normal   = [ s:gb.dark0[0] , s:gb.neutral_green[0] , s:gb.dark0[1] , s:gb.neutral_green[1] ]
let s:airline_b_normal   = [ s:gb.light1[0] , s:gb.dark3[0] , s:gb.light1[1] , s:gb.dark3[1] ]
let s:airline_c_normal   = [ s:gb.neutral_blue[0], s:gb.dark0[0] , s:gb.neutral_blue[1] , s:gb.dark0[1] ]
" If not set x = c, y = b, z = a (reverse order)
let g:airline#themes#gruvbox#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
" TODO: Make these actual colors and in a variable so we can set it everywhere
let g:airline#themes#gruvbox#palette.normal.airline_warning = s:warning
let g:airline#themes#gruvbox#palette.normal.airline_error = s:error

" airline#themes#generate_color_map() also uses the values provided as
" parameters to create intermediary groups such as:
"   airline_a_to_airline_b
"   airline_b_to_airline_c
"   etc...

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#gruvbox#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#gruvbox#palette.normal_modified = s:modified


let s:airline_a_insert = [ s:gb.dark0[0],  s:gb.bright_blue[0],  s:gb.dark0[1],  s:gb.bright_blue[1]  ]
let s:airline_b_insert = [ s:gb.light1[0], s:gb.neutral_blue[0], s:gb.light1[1], s:gb.neutral_blue[1]  ]
let s:airline_c_insert = [ s:gb.light1[0], s:gb.faded_blue[0],   s:gb.light1[1], s:gb.faded_blue[1]  ]

let g:airline#themes#gruvbox#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#gruvbox#palette.insert_modified = s:modified
let g:airline#themes#gruvbox#palette.insert_paste = {
      \ 'airline_a': [ s:airline_a_insert[0], s:gb.neutral_yellow[0] , s:airline_a_insert[2], s:gb.neutral_yellow[1], ''     ] ,
      \ }

let g:airline#themes#gruvbox#palette.terminal = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

let g:airline#themes#gruvbox#palette.replace = copy(g:airline#themes#gruvbox#palette.insert)
let g:airline#themes#gruvbox#palette.replace.airline_a = [ s:airline_b_insert[0]   , s:gb.neutral_red[0] , s:airline_b_insert[2] , s:gb.neutral_red[1]     , ''     ]
let g:airline#themes#gruvbox#palette.replace_modified = s:modified


let s:airline_a_visual = [ s:gb.dark0[0] , s:gb.faded_yellow[0] , s:gb.dark0[1] , s:gb.faded_yellow[1] ]
let s:airline_b_visual = [ s:gb.dark0[0] , s:gb.faded_orange[0] , s:gb.dark0[1] , s:gb.faded_orange[1] ]
let s:airline_c_visual = [ s:gb.light1[0] , s:gb.faded_red[0] , 15  , s:gb.faded_red[1]  ]
let g:airline#themes#gruvbox#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#gruvbox#palette.visual_modified = s:modified


let s:airline_a_inactive = [ s:gb.dark2[0] , s:gb.dark0_hard[0] , s:gb.dark2[1] , s:gb.dark0_hard[1] , '' ]
let s:airline_b_inactive = [ s:gb.dark2[0] , s:gb.dark0[0] , s:gb.dark2[1] , s:gb.dark0[1] , '' ]
let s:airline_c_inactive = [ s:gb.light4[0] , s:gb.dark0_soft[0] , s:gb.light4[1] , s:gb.dark0_soft[1] , '' ]
let g:airline#themes#gruvbox#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#gruvbox#palette.inactive_modified = {
      \ 'airline_c': [ s:gb.bright_purple[0] , '' , s:gb.bright_purple[1] , '' , '' ] ,
      \ }

" For commandline mode, we use the colors from normal mode, except the mode
" indicator should be colored differently, e.g. light green
let s:airline_a_commandline = [ s:gb.dark0[0] , s:gb.neutral_aqua[0] , s:gb.dark0[1]  , s:gb.neutral_aqua[1] ]
let s:airline_b_commandline = [ s:gb.light1[0] , s:gb.dark3[0] , s:gb.light1[1] , s:gb.dark3[1] ]
let s:airline_c_commandline = [ s:gb.neutral_blue[0] , s:gb.dark0[0] , s:gb.neutral_blue[1]  , s:gb.dark0[1] ]
let g:airline#themes#gruvbox#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#gruvbox#palette.accents = {
      \ 'red': [ s:gb.neutral_red[0] , '' , s:gb.neutral_red[1] , ''  ]
      \ }


" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded if the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#gruvbox#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ s:gb.light1[0] , s:gb.faded_purple[0] , s:gb.light1[1] , s:gb.faded_purple[1]  , ''     ],
        \ [ s:gb.light1[0] , s:gb.faded_blue[0] , s:gb.light1[1] , s:gb.faded_blue[1]  , ''     ],
        \ [ s:gb.faded_purple[0] , s:gb.light1[0] , s:gb.faded_purple[1]  , s:gb.light1[1], 'bold' ])
endif
