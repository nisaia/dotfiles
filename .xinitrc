#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# load Xresources
# xrdb $HOME/.xres/.Xresources

# set <lang> layout
# replace <lang> with your language
#localectl set-x11-keymap <lang>

# nitrogen
# nitrogen --restore &

# feh
#feh --no-fehbg --bg-fill <path>

# dunst
#dunst &

# slstatus
#exec slstatus &

# xautolock
#xautolock -time 5 -locker slock &

# picom
# picom --no-vsync &

# pipewire
#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/pipewire-media-session &

# dwm
#exec dwm

# i3
# exec i3
