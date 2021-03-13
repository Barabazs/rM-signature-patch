#!/opt/bin/sh
set -e

if ! command -v perl &>/dev/null; then
    echo "perl could not be found"
    echo "Downloading and installing perl"
    opkg install perl
fi
perl -pi -e "s/Sent from my/\0ent from my/" -s "/usr/bin/xochitl"

systemctl restart xochitl
