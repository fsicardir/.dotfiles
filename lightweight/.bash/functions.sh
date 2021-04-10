#!/usr/bin/env bash

server() {
    python3 -m http.server --cgi "$@"
}

print_colors() {
    for c in {0..255}; do
        tput setab $c
        echo -n "$c "
    done
    tput sgr0
    echo
}

z() {
    zathura "$@" &>/dev/null &
}

