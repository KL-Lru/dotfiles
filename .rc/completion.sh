#!/bin/bash

### Define completions

# load bash completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# git completion
if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
    # for git aliases
    complete -F __git_wrap__git_main g
fi

# docker completion
if [ -n "$(command -v docker)" ]; then
  source <(docker completion bash)
  # for docker aliases
  complete -F __start_docker d
fi

# kubectl completion
if [ -n "$(command -v kubectl)" ]; then
  source <(kubectl completion bash)
  # for kubectl aliases
  complete -F __start_kubectl k
fi

