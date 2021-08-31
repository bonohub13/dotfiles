#!/usr/bin/sh

alarm() {
    file="$HOME/Music/Baby_Metal/Road of Resistance/1 - 01 - BABYMETAL - Road of Resistance.flac"
    mplayer "$file" & \
        notify-send '!! WAKE UP! Time to work!'

    return 0
}

alarm
