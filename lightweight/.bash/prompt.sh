#!/usr/bin/env bash

PS0='\[\e[2 q\]'

# if I'm in tty, just the classic prompt
if [ "$TERM" == "linux" ]; then
    PS1='\[\033[01;32m\]\u@\h\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    return
fi

prompt_len() {
    read -r PS_STRING <<<"$1"
    PS_NO_COLORS=$(sed -E 's:\\\[\\033\[([0-9]*[;m])*\\\]::g' <<<"$PS_STRING")
    EVAL_PS="${PS_NO_COLORS@P}"
    # there must be a couple characters that I'm not counting somewhere |:
    echo $((${#EVAL_PS} - 1))
}

greater_than_screen() {
    len=$(prompt_len "$1")
    [ "$len" -ge "$COLUMNS" ]
    return $?
}

PS2=" ❯ "

if ! type __git_ps1 &>/dev/null && [ -f /usr/share/git/git-prompt.sh ]; then
    . /usr/share/git/git-prompt.sh
fi

prompt_command() {
    local ERROR_CODE="$?"

    local ORANGE_CONTENT="\[\033[1;38;5;235;48;5;214m\]"
    local ORANGE_END="\[\033[38;5;214;48;5;0m\]"
    local GREY_START="\[\033[38;5;0;48;5;239m\]"
    local GREY_CONTENT="\[\033[38;5;15;48;5;239m\]"
    local GREY_END="\[\033[38;5;239;48;5;0m\]"
    local RESET="\[\033[0m\]"

    if type __git_ps1 &>/dev/null; then
        GIT=$(__git_ps1 "[%s \uf126] " | sed -E 's/\$/≣/')
    fi

    local ERROR_FORMAT="\[\033[38;5;9;48;5;0m\]"
    local ERROR_STRING="  ✗ ${ERROR_CODE}\r"
    local ERROR="${ERROR_FORMAT}${ERROR_STRING}${RESET}"

    print_right() {
        len=$(prompt_len "$ERROR")
        printf "%*s" $((COLUMNS + ${#ERROR} - len)) "$ERROR"
    }

    [ -n "${VIRTUAL_ENV}" ] && VENV="(${VIRTUAL_ENV##*/}) " || VENV=""

    PS1="${ORANGE_CONTENT} \u@\h ${RESET}${ORANGE_END}${GREY_START}${GREY_CONTENT} \w ${GIT}${VENV}${GREY_END}${RESET}"

    E=""

    [ "$ERROR_CODE" -ne 0 ] && E="$(print_right)"

    if greater_than_screen "$E$PS1"; then
        # https://unix.stackexchange.com/questions/55930/bash-prompt-with-abbreviated-current-director-including-dot-files
        WD=$(sed -E -e "s:$HOME:~:" -e 's:(\.?[^/])[^/]*/:\1/:g' <<<"$PWD")
        _PS1=$(sed -E "s: \\\\w : $WD :g" <<<"$PS1")
        if greater_than_screen "$E$_PS1"; then
            PS1=$(sed -E "s: \\\\w : \\\\W :g" <<<"$PS1")
        else
            PS1="$_PS1"
        fi
    fi

    if [ $ERROR_CODE -ne 0 ]; then
        ! greater_than_screen "$E$PS1" && PS1="$E$PS1" 
    fi

    if greater_than_screen "$PS1"; then
        PS1="$PS2"
    else
        PS1="$PS1\n$PS2"
    fi

}

PROMPT_COMMAND=prompt_command

