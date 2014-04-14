#!/bin/sh

# compose key
# /usr/share/X11/xkb/rules/base.lst
setxkbmap -option compose:lwin

# switch between layouts
setxkbmap -layout "us" -variant "altgr-intl"

# kill X with ctrl-alt-backspace sequence
setxkbmap -option terminate:ctrl_alt_bksp

xmodmap $HOME/.Xmodmap &&

xrdb $HOME/.Xresources

pulseaudio --start

# redshift &

urxvtd -q -o -f

xset r rate 250 45

exec xmonad
