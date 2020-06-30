shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize
shopt -s globstar
shopt -s cdspell
shopt -s dirspell

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f /etc/profile.d/bash_completion.sh ]; then
    . /etc/profile.d/bash_completion.sh
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

for file in ~/.bash/.{bash_prompt,exports,aliases,functions,extras}; do
	[ -r "$file" ] && [ -f "$file" ] && \. "$file"
done
unset file;

if __load_completion git &>/dev/null; then
    complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
fi

eval "$(pyenv init - &>/dev/null)"
eval "$(pyenv virtualenv-init - &>/dev/null)"
