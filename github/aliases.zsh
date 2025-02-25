function ssh-setup() {
  if [[ ! -z $SSH_AGENT_PID ]] && ps -p $SSH_AGENT_PID > /dev/null
  then
    echo 'Agent running'
  else
    eval `ssh-agent -s`
    ssh-add
  fi
  set-title 'SSH Enabled'
}

function shellme() {
  ssh-setup
  set-title 'Shell Host'
  kitty +kitten ssh shell
  set-title 'SSH Enabled'
}

function vaultme() {
  ssh-setup
  set-title 'Vault Host'
  kitty +kitten ssh vault
  set-title 'SSH Enabled'
}

function jumpme() {
  ssh-setup
  set-title 'Jump Host'
  kitty +kitten ssh bastion
  set-title 'SSH Enabled'
}

function jumpto() {
  ssh-setup
  set-title 'Jumping'
  kitty +kitten ssh -J bastion -o "StrictHostKeyChecking no" $1
  set-title 'SSH Enabled'
}

alias intune-portal='WEBKIT_DISABLE_DMABUF_RENDERER=1 /opt/microsoft/intune/bin/intune-portal'
