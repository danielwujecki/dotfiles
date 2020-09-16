userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

xmodmap -e 'remove Lock = Caps_Lock'
xmodmap -e 'keysym Caps_Lock = Escape'

xbacklight -set 50
xset dpms 300 300 300
xrandr --output default --mode 1920x1080 --dpi 96
exec i3 > $HOME/.i3.log 2>&1
