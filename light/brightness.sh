#! /bin/sh

case "$1" in
    "up") light -A 10 || exit ;;
    "down") light -U 10 || exit ;;
    "restore") light -S 100 || exit ;;
esac

brightness_percentage=$(light -G | cut -d '.' -f 1)

#dunst configuration

brightness_icon="/home/nico/.config/dunst/icons/brightness.png"
dunstify -i "$brightness_icon" "Brightness: $brightness_percentage%"