#!/usr/bin/env bash

STATUS=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$STATUS" = "yes" ]; then
    DEVICE=$(bluetoothctl info | grep "Name:" | awk '{print substr($0,7)}')
    if [ -n "$DEVICE" ]; then
        echo "    $DEVICE"
    else
        echo "    On"
    fi
else
    echo "    Off"
fi

