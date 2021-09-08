#!/usr/bin/zsh

disable_touchpad()
{
    local DEVICE="SynPS/2 Synaptics TouchPad"
    local ID="$(xinput list --id-only ${DEVICE})"

    xinput disable $ID
}
enable_touchpad()
{
    local DEVICE="SynPS/2 Synaptics TouchPad"
    local ID="$(xinput list --id-only ${DEVICE})"

    xinput enable $ID
    xinput set-prop $ID "libinput Tapping Enabled" 1
}

if [ "$1" = "enable" -o "$1" = "disable" ];then
    if [ "$1" = "enable" ];then
        enable_touchpad
        TOUCHPAD_MODE="enabled"
        export TOUCHPAD_MODE="enabled"
    else
        disable_touchpad
        TOUCHPAD_MODE="disabled"
        export TOUCHPAD_MODE="disabled"
    fi
elif [ "$1" = "" ];then
    if [ "$TOUCHPAD_MODE" = "enabled" ];then
        disable_touchpad
        TOUCHPAD_MODE="disabled"
        export TOUCHPAD_MODE="disabled"
    elif [ "$TOUCHPAD_MODE" = "disabled" ];then
        enable_touchpad
        TOUCHPAD_MODE="enabled"
        export TOUCHPAD_MODE="enabled"
    fi
else
    echo "$1 is invalid argument for disable_enable_touchpad."
fi
