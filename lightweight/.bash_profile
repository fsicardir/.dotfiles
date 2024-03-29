#!/usr/bin/env bash

shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize
shopt -s globstar
shopt -s cdspell
shopt -s dirspell

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


for file in ~/.bash/{prompt,exports,aliases,functions,completion,extras}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file;

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    eval "$(ssh-agent)" > /dev/null
    exec startx
fi
