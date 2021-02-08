#!/usr/bin/env bash

server() {
    python3 -m http.server --cgi "$1"
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
    zathura "$1" &>/dev/null &
}
