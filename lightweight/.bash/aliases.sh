#!/usr/bin/env bash

# allow using sudo on aliases
alias sudo='sudo '

if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ip='ip --color=auto'
fi

alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias g="git"

alias d='docker'
alias dcompose='docker-compose'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low "$([ $? = 0 ] && echo Alert || echo Error)" "$(history | tail -n1 | cut -f2 | sed -e '\''s/[&|;]*\s*alert$//'\'')"'

alias py='python3'

alias untar="tar xzf"

alias ipp="dig +short myip.opendns.com @resolver1.opendns.com"

alias java11="export JAVA_HOME=/usr/lib/jvm/jdk-11.0.2"
alias java8="export JAVA_HOME=/usr/lib/jvm/java-8-oracle"

alias bt="bluetooth"
alias btctl="bluetoothctl"

# Casual ssh
alias sshc="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

alias curl='curl -w"\n" '
