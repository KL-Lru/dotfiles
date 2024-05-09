#!/bin/bash

### Define Editor Configration

# set default editor
if [ -n "$(command -v nvim)" ]; then
  export EDITOR="nvim"
elif [ -n "$(command -v vim)" ]; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi
