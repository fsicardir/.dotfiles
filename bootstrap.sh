#!/usr/bin/env bash

print_error() {
    printf "Usage:\n\t%s" "$0 [-l]"
}

bootstrap() {
    rsync --exclude ".git" \
        --exclude ".gitmodules" \
        --exclude ".gitignore" \
        --exclude "README.md" \
        --exclude "bootstrap.sh" \
        -avh "./" ~
    source ~/.bash_profile
}

if [ $# -eq 0 ]; then
    git pull origin master
    git submodule update --init --recursive
elif [ $# -gt 1 ] || { [ $# -eq 1 ] && [ "$1" != "-l" ]; }; then
    print_error
    exit 1
fi

pushd "$(dirname "${BASH_SOURCE}")"
bootstrap
popd
