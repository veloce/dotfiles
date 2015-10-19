#!/usr/bin/env bash

xrdb $HOME/.dotfiles/Xresources
redshift-gtk &

urxvtd -q -o -f
