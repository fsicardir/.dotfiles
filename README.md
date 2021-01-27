.dotfiles
=========

Configuration files for my GNU/Linux boxes.

Bootstrap
---------

Easily deploy on any machine.

```
$ ./bootstrap -h
Usage:
        ./bootstrap [options]
Options:
        -h      displays this message
        -r      fetch from remote repo
        -b      full build (YouCompleteMe)
        -d      change destination (default is $HOME)
        -l      light configuration (no X environments)
```

Useful tweaks
----------------------

### Keyboard configuration

Set these variables in `/etc/default/keyboard`:

```
XKBLAYOUT="latam"
XKBOPTIONS="caps:escape"
```

### Lock on suspend

Create this file: `/etc/systemd/system/lock.service` and then run `systemctl enable lock`

```
[Unit]
Description=Lock the screen on resume from suspend
Before=suspend.target

[Service]
User=fransic
Environment=XDG_SEAT_PATH="/org/freedesktop/DisplayManager/Seat0"
ExecStart=/usr/bin/dm-tool lock

[Install]
WantedBy=suspend.target
```
