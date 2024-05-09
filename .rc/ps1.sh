#!/bin/bash

### Define Color
__BLACK="\[\e[0;30m\]"
__RED="\[\e[0;31m\]"
__GREEN="\[\e[0;32m\]"
__YELLOW="\[\e[0;33m\]"
__BLUE="\[\e[0;34m\]"
__PURPLE="\[\e[0;35m\]"
__CYAN="\[\e[0;36m\]"
__WHITE="\[\e[0;37m\]"
__CLEAR="\[\e[00m\]"

### Define PS1 Configration

# if not exist ~/.ps1, make dir and clone prompts
if [ ! -d ~/.ps1 ]; then
  mkdir ~/.ps1
  curl -o ~/.ps1/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  curl -o ~/.ps1/kube-ps1.sh https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh
fi

# setup git-prompt
source ~/.ps1/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=yes
GIT_PS1_SHOWUNTRACKEDFILES=yes
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_STATESEPARATOR=""
GIT_PS1_SHOWCONFLICTSTATE=yes
GIT_PS1_DESCRIBE_STYLE="branch"

# setup kube-ps1
source ~/.ps1/kube-ps1.sh
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=' '
export KUBE_PS1_NS_COLOR=magenta
export KUBE_PS1_CTX_COLOR=magenta

GIT_PS1='$(__git_ps1 " (%s)")'
K8S_PS1='$(kube_ps1)'
export PS1="${__GREEN}\u${__CLEAR}@${__GREEN}\h${__CLEAR}:${__BLUE}\w${__CLEAR} ${GIT_PS1} ${K8S_PS1}\$ "