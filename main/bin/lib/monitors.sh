
primary_monitor() {
    xrandr | grep -E "eDP.* connected" | cut -d' ' -f1
}

secondary_monitor() {
    xrandr | grep -E "HDMI.* connected" | cut -d' ' -f1
}

monitor_dim() {
    d="\1"
    case $2 in
        width)
            d="\1"
            ;;
        height)
            d="\2"
            ;;
        offset_x)
            d="\3"
            ;;
        offset_y)
            d="\4"
            ;;
    esac
    xrandr | grep "$1" | sed -E "s/.* ([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+).*/$d/"
}

monitor_configuration() {
    primary=$(primary_monitor)
    secondary=$(secondary_monitor)

    xrandr --output "$primary" --auto --primary --pos 0x0 

    if [[ -z "$secondary" ]]; then
        bspc monitor "^1" -n "$primary"
        for d in 6 7 8 9 0; do
            bspc desktop $d -m "$primary"
        done
        bspc monitor "$primary" -o 1 2 3 4 5 6 7 8 9 0
    else
        xrandr --output "$secondary" --auto --above "$primary"
        for d in 6 7 8 9 0; do
            bspc desktop $d -m "$secondary"
        done
    fi
    bspc wm -O "$primary" "$secondary"
    while (bspc desktop Desktop -r &>/dev/null);do :; done
}

