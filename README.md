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
        -l      lightweight configuration (for command-line-only environments)
```

For example:

```
git clone --recursive https://github.com/fsicardir/.dotfiles.git
cd .dotfiles
./bootstrap
```

Docker Image
------------

Spawn a comfortably configured debian container.

Build image: `docker build -t debian_custom:latest .`.
Run container: `docker run -it --rm debian_custom:latest`.

Or directly from docker hub: `docker run -it --rm fsicardir/debian_custom:latest`.

Other Useful tweaks
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
