#!/usr/bin/env bash
set -e

xochitl='/usr/bin/xochitl'

use_xxd() {
    tmpfile='/tmp/signature.xochitl.tmp'
    guilty=$(printf "Sent from my" | xxd -p)
    absolve=$(printf "\0ent from my" | xxd -p)
    echo "Attempting to patch signature"
    xxd -p "$xochitl" | sed "s/$guilty/$absolve/" | xxd -p -r >"$tmpfile"
    chmod +x "$tmpfile" && mv "$tmpfile" "$xochitl"
}

use_perl() {
    if ! command -v perl &>/dev/null; then
        echo "perl could not be found"
        if ! command -v opkg &>/dev/null; then
            echo "opkg could not be found"
            echo "Please install it first. https://github.com/toltec-dev/toltec"
            exit 1
        fi
        echo "Downloading and installing perl"
        opkg install perl
    fi
    echo "Attempting to patch signature"
    perl -pi -e "s/Sent from my/\0ent from my/" -s "$xochitl"
}

if command -v xxd &>/dev/null; then
    use_xxd
else
    use_perl
fi

systemctl restart xochitl
