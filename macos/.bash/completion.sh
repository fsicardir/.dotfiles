#!/usr/bin/env bash

if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
  . ~/.bash/git-completion.bash
  __git_complete g __git_main
  complete -o bashdefault -o default -o nospace -F _docker d
  . ~/.bash/git-prompt.sh
fi

