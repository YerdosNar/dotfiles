#!/usr/bin/env bash

IMAGE=~/.config/swaylock/arch.png

swaylock \
    --image $IMAGE \
    --effect-blur 2x2 \
    --effect-vignette 0.5:0.5 \
    --clock \
    --indicator \
    --indicator-y-position 200 \
    --indicator-x-position 200 \
    --indicator-radius 100 \
    --indicator-thickness 20 \
    --ring-color 0c79c3 \
    --show-failed-attempts \
    --daemonize
