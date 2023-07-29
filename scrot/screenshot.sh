#! /bin/sh

screenshot_name="$(date +%F_%T)-screenshot.png"
screenshots_folder="$HOME/screenshots"

output="$screenshots_folder/$screenshot_name"

if [ ! -d $screenshots_folder ]; then
    mkdir $screenshots_folder
fi

case "$1" in
    "select") scrot "$output" --select --line mode=edge || exit ;;
    "window") scrot "$output" --focused --border || exit ;;
    *) scrot "$output" || exit ;;
esac

echo $screenshot_name

notify-send "Screenshot $screenshot_name taken"