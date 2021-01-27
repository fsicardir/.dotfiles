.dotfiles
=========

Configuration files for my daily driver.

Usage
-----

```
$ ./bootstrap --help
Usage:
        ./bootstrap [options]
Options:
        -h      displays this message
        -r      fetch from remote repo
        -b      full build (YouCompleteMe)
        -d      change destination (default is $HOME)
```

Keyboard configuration
----------------------

Set these variables in /etc/default/keyboard:

```
XKBLAYOUT="latam"
XKBOPTIONS="caps:escape"
```
