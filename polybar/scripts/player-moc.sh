#!/bin/sh

if [ "$(mocp -Q %state)" != "STOP" ];then
    SONG=$(mocp -Q %song)
        
    if [ -n "$SONG" ]; then
        echo "$(mocp -Q %artist) - $SONG ($(mocp -Q %album))"
    else
        basename "$(mocp -Q %file)"
    fi
else
    echo ""
fi
