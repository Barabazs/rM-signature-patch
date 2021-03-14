#!/opt/bin/sh
set -e

if ! command -v opkg &>/dev/null; then
    echo "opkg could not be found"
    echo "Please install it first. https://github.com/toltec-dev/toltec"
    exit 1
fi

if ! command -v perl &>/dev/null; then
    echo "perl could not be found"
    echo "Downloading and installing perl"
    opkg install perl
fi

echo "Attempting to patch signature"
perl -pi -e "s/Sent from my/\0ent from my/" -s "/usr/bin/xochitl"

systemctl restart xochitl
