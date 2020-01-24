#!/bin/bash

function qr_code_getter() {
    gnome-screenshot --display=${DISPLAY} -a -c \
    | import - | convert - png:- > /tmp/latestqrcode.png
    zbarimg -q --raw /tmp/latestqrcode.png \
    | xclip -r -selection clipboard
    rm /tmp/latestqrcode.png
};

function screenshot_getter() {
    gnome-screenshot \
    --display=${DISPLAY} -a -c |\
    import - | convert - png:- |\
    xclip -selection clipboard -target image/png -i
}
