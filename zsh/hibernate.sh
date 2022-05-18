#!/bin/sh -eux

toggle_wakeup() {
    retval=0
    
    case "$1" in
        "enabled" )
            echo "Disable wakeup by events from USB hubs"
            echo "e.g. Mouse movement, keyboard input"
            for ev in "$(cat /proc/acpi/wakeup | grep enabled | cut --delimiter=\  --fields=1)"
            do
                echo "$ev" | sudo tee /proc/acpi/wakeup > /dev/null \
                    && echo "Written: $ev"
            done
            ;;
        "disabled" )
            echo "Doing nothing..."
            ;;
        * )
            retval=1
            ;;
    esac

    return $retval
}

toggle_wakeup "enabled"
systemctl hibernate
