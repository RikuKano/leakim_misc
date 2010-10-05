#!/bin/sh

export ORIENTATION=`cat /tmp/.orientation`

if [ $ORIENTATION -eq "90" ]; then
        xrandr --auto
        xrandr --output LVDS --rotate inverted 
        echo 180 > /tmp/.orientation
        echo "180" | osd_cat --shadow=2 --align=center \
        --pos=bottom --color=green --delay=2 \
        --font=lucidasanstypewriter-bold-24 \
	--offset 40 &
elif [ $ORIENTATION -eq "180" ]; then
        xrandr --auto
        xrandr --output LVDS --rotate left 
        echo 270 > /tmp/.orientation
        echo "270" | osd_cat --shadow=2 --align=center \
        --pos=bottom --color=green --delay=2 \
        --font=lucidasanstypewriter-bold-24 \
        --offset 40 &
elif [ $ORIENTATION -eq "270" ]; then
        xrandr --output LVDS --rotate normal 
        echo "Normal" | osd_cat --shadow=2 --align=center \
        --pos=bottom --color=green --delay=2 \
        --font=lucidasanstypewriter-bold-24 \
        --offset 40 &
        echo 0 > /tmp/.orientation
else
        xrandr --auto
        xrandr --output LVDS --rotate right 
        echo 90 > /tmp/.orientation
        echo "90" | osd_cat --shadow=2 --align=center \
        --pos=bottom --color=green --delay=2 \
        --font=lucidasanstypewriter-bold-24 \
        --offset 40 &
fi

