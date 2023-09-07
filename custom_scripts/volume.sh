#! /bin/sh

case "$1" in
    "up")
        volume_icon="/home/nico/.config/dunst/icons/volume_up.png"
        pamixer -i 5 || exit ;;
    "down")
        volume_icon="/home/nico/.config/dunst/icons/volume_down.png"
        pamixer -d 5 || exit ;;
    "mute/unmute")
        pamixer -t || exit
        if [ $(pamixer --get-mute) == "true" ]; then
            volume_icon="/home/nico/.config/dunst/icons/volume_mute.png"
        else
            volume_icon="/home/nico/.config/dunst/icons/volume_unmute.png"
        fi
        ;;
    "restore")
        volume_icon="/home/nico/.config/dunst/icons/volume_unmute.png"
        pamixer --set-volume 100 || exit ;;
esac

volume_percentage=$(pamixer --get-volume-human)

# dunst configuration

dunstify -i "$volume_icon" "Volume: $volume_percentage"
