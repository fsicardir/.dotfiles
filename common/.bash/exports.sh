#!/usr/bin/env bash

export EDITOR='vim'

export PYTHONIOENCODING='UTF-8'

export HISTSIZE=-1
export HISTFILESIZE="${HISTSIZE}"
export HISTTIMEFORMAT='%FT%T%t'
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export GIT_PS1_SHOWSTASHSTATE="true"

export LESS="-FRX"

export PASSWORD_STORE_GENERATED_LENGTH=24

PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/jdk-11.0.2"
PATH="$PATH:$JAVA_HOME"

export M2_HOME="/opt/apache-maven-3.5.2"
PATH="$PATH:$M2_HOME"
export MAVEN_OPTS="-Xms256m -Xmx512m"

PATH="$PATH:$HOME/.cargo/bin"

PATH="$PATH:$HOME/.pyenv/bin"
export PIPENV_VENV_IN_PROJECT=1
