#!/bin/sh

current=`setxkbmap -print | grep xkb_symbols | awk -F"+" '{print $2}'`

if [ "$current" = "us" ]; then
    setxkbmap -layout us -variant intl
else
    setxkbmap -layout us
fi
