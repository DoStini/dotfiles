intern=eDP-1
extern=HDMI-1-1

if xrandr | grep "$extern disconnected"; then
    echo "Disconnected"
    xrandr --output "$extern" --off
else
    echo "Connected"
    xrandr --output "$extern" --auto --right-of "$intern"
fi
