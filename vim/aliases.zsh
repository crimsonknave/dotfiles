function vims() {
  if [[ -z $1 ]]; then
    session="Session.vim"
  else
    session="$1"
  fi
  if [[ -f $session ]]; then
    vim -S "$session" -c "echom 'Session restored from $session'"
  else
    vim -c "echom 'No session file found: $session'"
  fi
}
