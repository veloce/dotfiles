#!/bin/sh

setxkbmap -layout us -variant euro

# compose key
setxkbmap -option compose:prsc

# kill X with ctrl-alt-backspace sequence
setxkbmap -option terminate:ctrl_alt_bksp

xmodmap $HOME/.Xmodmap &&

xrdb -merge $HOME/.Xresources

# redshift
redshift &

exec xmonad
