alias reload!='. ~/.zshrc'

alias sshc='ssh-copy-id -i ~/.ssh/id_rsa.pub'
alias ssh='TERM=xterm-256color ssh'
alias sshig='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias sshcig='ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='eval $(thefuck $(fc -ln -1))'
alias bah='eval $(thefuck $(fc -ln -1))'
alias grr='eval $(thefuck $(fc -ln -1))'
alias grrr='eval $(thefuck $(fc -ln -1))'
alias grrrr='eval $(thefuck $(fc -ln -1))'
alias phrasing='eval $(thefuck $(fc -ln -1))'
alias YUNO='eval $(thefuck $(fc -ln -1))'

alias fucking='sudo'
alias please='sudo'
alias yolo='sudo'

function set-title() {
  echo -ne "\033]0;$1\007"
}

alias psgrep='ps -ef |grep'

alias ack='ag'
alias cat='bat'
