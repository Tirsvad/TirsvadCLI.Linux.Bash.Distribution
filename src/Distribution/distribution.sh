#!/bin/bash

# DISTRIBUTION_ID = OS name
# DISTRIBUTION_RELEASE = OS version

if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    DISTRIBUTION_ID=$NAME
    DISTRIBUTION_RELEASE=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    DISTRIBUTION_ID=$(lsb_release -si)
    DISTRIBUTION_RELEASE=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    DISTRIBUTION_ID=$DISTRIB_ID
    DISTRIBUTION_RELEASE=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    DISTRIBUTION_ID=Debian
    DISTRIBUTION_RELEASE=$(cat /etc/debian_version)
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    DISTRIBUTION_ID=$(uname -s)
    DISTRIBUTION_RELEASE=$(uname -r)
fi

case $(uname -m) in
x86_64)
    ARCH=x64  # or AMD64 or Intel64 or whatever
    ;;
i*86)
    ARCH=x86  # or IA32 or Intel32 or whatever
    ;;
*)
    # leave ARCH as-is
    ;;
esac
