
keyboard_configuration() {
    setxkbmap latam
    setxkbmap -option caps:escape
}

get_current_layout() {
    setxkbmap -query | grep layout | cut -d: -f2 | tr -d [:space:]
}
