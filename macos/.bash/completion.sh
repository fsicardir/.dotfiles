#!/usr/bin/env bash

if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
  __git_complete g __git_main
  complete -o bashdefault -o default -o nospace -F _docker d
  . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
fi

