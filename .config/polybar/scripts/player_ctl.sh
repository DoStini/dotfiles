#!/bin/sh

PLAYER=$(playerctl metadata --format '{{playerName}'})

PLAYER_SYMBOL=""

if [ -z $PLAYER ]
then
    echo ""
    exit
elif [ $PLAYER == "spotify" ]
then
    PLAYER_SYMBOL="%{F#1db954}%{F-}"
elif [ $PLAYER == "firefox" ]
then
    PLAYER_SYMBOL="%{F#ff0000}%{F-}"
else
    echo ""
    exit
fi

SONG=$(playerctl metadata --format '{{title}}, {{artist}}')

TRIMMED=$(python ~/.config/polybar/scripts/playerctl.py 2 "$SONG")

PREVIOUS_BUTTON=""
SKIP_BUTTON=""
PLAY_PAUSE_BUTTON=""

if [ $(playerctl status) == "Playing" ]
then
    PLAY_PAUSE_BUTTON=""
else
    PLAY_PAUSE_BUTTON=""
fi

PREV_BTN_ACT="%{A1:playerctl previous:}$PREVIOUS_BUTTON%{A}"
PLAY_PAUSE_BTN_ACT="%{A1:playerctl play-pause:}$PLAY_PAUSE_BUTTON%{A}"
SKIP_BTN_ACT="%{A1:playerctl next:}$SKIP_BUTTON%{A}"

echo "%{T4}$PLAYER_SYMBOL%{T-} $TRIMMED $PREV_BTN_ACT $PLAY_PAUSE_BTN_ACT $SKIP_BTN_ACT"