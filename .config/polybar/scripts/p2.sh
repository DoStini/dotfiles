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

TRIMMED=$(python playerctl.py 2 "$SONG")

echo "$PLAYER_SYMBOL $TRIMMED" 