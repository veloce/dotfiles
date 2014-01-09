#!/usr/bin/bash
# Default acpi script that takes an entry for all actions

# to use, you need that in /etc/acpi/events/anything:
# event=.*
# action=/path/to/this/file.sh %e

case "$1" in
  # video/brightnessdown) /home/veloce/.dotfiles/scripts/mac-brightness down;;
  # video/brightnessup) /home/veloce/.dotfiles/scripts/mac-brightness up;;
  button/volumedown) amixer set Master 5-;;
  button/volumeup) amixer set Master 5+;;
  button/mute) amixer set Master toggle;;
  # cd/play) ;;
  # cd/next) ;;
  # cd/prev) ;;
  *) logger "ACPI group/action undefined: $1 / $2";;
esac
