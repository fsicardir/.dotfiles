
. ~/bin/panel/panel_colors.sh

cmd_repeat() {
    cmd="$1"
    sleep_time="$2"
    while true; do
        eval "$cmd"
        sleep "$sleep_time"
    done
}

network() {
    p=""
    wifi=""
    ethernet=""
    if wifi | grep on &> /dev/null; then
        wifi=$(nmcli c show --active | grep wifi | cut -d' ' -f1)
        if [ ! -z "$wifi" ]; then
            wifi=" $wifi  |"
        else
            wifi=" %{F$COLOR_RED} %{F$COLOR_SYS_FG}|"
        fi
        p="y"
    fi
    
    ethernet=$(nmcli c show --active | grep ethernet)
    if [ ! -z "$ethernet" ]; then
        ethernet="  |"
        p="y"
    fi

    printf "N%s%s\n" "$wifi" "$ethernet"
}

bluetooth() {
    bt=""
    on=$(hcitool dev | grep -v Devices)
    if [ ! -z "$on" ]; then
        connected=$(hcitool con | grep -v Connections)
        if [ -z "$connected" ]; then
            bt=" %{F$COLOR_RED}%{F$COLOR_SYS_FG} |"
        else
            bt="  |"
        fi
    fi

    printf "L%s\n" "$bt"
}

battery() {
    percentage=$(upower -i `upower -e | grep BAT` | grep percentage | tr -dc [:digit:])
    bat=""
    stat=$(upower -i `upower -e | grep BAT` | grep state)
    if [[ $stat == *\ charging ]]; then
        bat="  |"
    else
        if [ "$percentage" -gt 80 ]; then
            bat="  |"
        elif [ "$percentage" -gt 60 ]; then
            bat="  |"
        elif [ "$percentage" -gt 40 ]; then
            bat="  |"
        elif [ "$percentage" -gt 20 ]; then
            bat="  |"
        else
            bat=" %{F$COLOR_RED} %{F$COLOR_SYS_FG} |"
        fi
    fi

    printf "B%s%s\n" " $percentage%" "$bat"
}

keyboard_layout() {
    layout=$(setxkbmap -query | grep layout | cut -d: -f2 | tr -d [:space:])
    printf "K %s  |\n" "$layout"
}
