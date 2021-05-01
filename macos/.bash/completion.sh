#!/usr/bin/env bash

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  __git_complete g __git_main
  complete -o bashdefault -o default -o nospace -F _docker d
fi


