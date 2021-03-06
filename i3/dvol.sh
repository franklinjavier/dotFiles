#!/bin/bash

#Customize this stuff
IF="Master"
SECS="2"

BG="#43464f"
FG="#9ab8c2"
WIDTH="250"
WIDTH_BAR=$(($WIDTH - 150))
WINDOW_WIDTH=$(xdpyinfo | awk '$1 ~ /dimensions/ {split($2,arr,"x"); print int(arr[1])}')
WINDOW_HEIGHT=$(xdpyinfo | awk '$1 ~ /dimensions/ {split($2,arr,"x"); print int(arr[2])}')
XPOS=$((($WINDOW_WIDTH / 2) - ($WIDTH / 2)))
YPOS=$(($WINDOW_HEIGHT / 2))

ICON_VOL=~/.dzen2/thayer/vol-hi.xbm
ICON_VOL_MUTE=~/.dzen2/thayer/vol-mute.xbm
ICON=$ICON_VOL

#Probably do not customize
PIPE="/tmp/dvolpipe"

err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: dvol [option] [argument] [interface]"
  echo
  echo "Options:"
  echo "     -i, --increase - increase volume by \`argument'"
  echo "     -d, --decrease - decrease volume by \`argument'"
  echo "     -t, --toggle   - toggle mute on and off"
  echo "     -h, --help     - display this"
  echo
  echo "The interface could be specified by the interface"
  echo "parameter. If it is not specified, the IF var will be"
  echo "used."
  exit
}

#Argument Parsing
case "$1" in
  '-i'|'--increase')
    [ -z "$2" ] && err "No argument specified for increase."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%+"
    ;;
  '-d'|'--decrease')
    [ -z "$2" ] && err "No argument specified for decrease."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%-"
    ;;
  '-t'|'--toggle')
    AMIXARG="toggle"
    ;;
  ''|'-h'|'--help')
    usage
    ;;
  *)
    err "Unrecognized option \`$1', see dvol --help"
    ;;
esac

# Optional interface parameter:
if [ $AMIXARG == "toggle" ]; then
    IF=${2:-$IF}
else
    IF=${3:-$IF}
fi


#Actual volume changing (readability low)
AMIXOUT="$(amixer set "$IF" "$AMIXARG" | tail -n 1)"
MUTE="$(cut -d '[' -f 4 <<<"$AMIXOUT")"
if [ "$MUTE" = "off]" ]; then
  ICON=$ICON_VOL_MUTE
else
  ICON=$ICON_VOL
fi

VOL="$(cut -d '[' -f 2 <<<"$AMIXOUT" | sed 's/%.*//g')"

#Using named pipe to determine whether previous call still exists
#Also prevents multiple volume bar instances
if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw $WIDTH -x "$XPOS" -y "$YPOS" -w "$WIDTH" -bg "$BG" -fg "$FG" < "$PIPE"; rm -f "$PIPE") &
fi

#Feed the pipe!
(echo "$VOL" | gdbar -l "$IF ^i(${ICON}) " -fg "$FG" -bg "$BG" -w $WIDTH_BAR ; sleep "$SECS") > "$PIPE"
