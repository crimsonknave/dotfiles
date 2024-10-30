set spl=en,programming
set nospell
" set spf=wordlist
" TODO: Need to just run this in install/update
" But, below isn't working either
" call DirtytalkUpdate()

function! ToggleSpell()
  setlocal spell!
endfunction

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
