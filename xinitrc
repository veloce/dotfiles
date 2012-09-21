#!/bin/sh

xrdb -merge $HOME/.Xresources
#xmodmap $HOME/.Xmodmap

# redshift
redshift &

exec ck-launch-session xmonad
