#!/bin/bash

## @file
## @author Jens Tirsvad Nielsen
## @version
## @brief Getting OS, version and architecture
## @details
## 
## @par URL
## https://github.com/TirsvadCLI/Linux.Distribution @n


## @brief string containing name of distribution
declare TIRSVADCLI_LINUX_DISTRIBUTION_ID

## @brief string containing version of distribution
declare TIRSVADCLI_LINUX_DISTRIBUTION_RELEASE

## @brief string containing archecture of distribution
declare TIRSVADCLI_LINUX_DISTRIBUTION_ARCH

if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	TIRSVADCLI_LINUX_DISTRIBUTION_ID=$NAME
	TIRSVADCLI_LINUX_DISTRIBUTION_RELEASE=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	TIRSVADCLI_LINUX_DISTRIBUTION_ID=$(lsb_release -si)
	TIRSVADCLI_LINUX_DISTRIBUTION_RELEASE=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	TIRSVADCLI_LINUX_DISTRIBUTION_ID=$DISTRIB_ID
	TIRSVADCLI_LINUX_DISTRIBUTION_RELEASE=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	TIRSVADCLI_LINUX_DISTRIBUTION_ID=Debian
	TIRSVADCLI_LINUX_DISTRIBUTION_RELEASE=$(cat /etc/debian_version)
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	TIRSVADCLI_LINUX_DISTRIBUTION_ID=$(uname -s)
	TIRSVADCLI_LINUX_DISTRIBUTION_RELEASE=$(uname -r)
fi

case $(uname -m) in
x86_64)
	TIRSVADCLI_LINUX_DISTRIBUTION_ARCH=x64  # or AMD64 or Intel64 or whatever
	;;
i*86)
	TIRSVADCLI_LINUX_DISTRIBUTION_ARCH=x86  # or IA32 or Intel32 or whatever
	;;
*)
	exit 1
	;;
esac
