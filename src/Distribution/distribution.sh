#!/bin/bash

## @file distribution.sh
## @author Jens Tirsvad Nielsen
## @version
## @brief Getting OS, version and architecture
## @details
## 
## @par URL
## https://github.com/TirsvadCLI/Linux.Distribution

declare -r TCLI_LINUX_DISTRIBUTION

## @brief string containing name of distribution
declare TCLI_LINUX_DISTRIBUTION_ID

## @brief string containing version of distribution
declare TCLI_LINUX_DISTRIBUTION_RELEASE

## @brief string containing archecture of distribution
declare TCLI_LINUX_DISTRIBUTION_ARCH

if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	TCLI_LINUX_DISTRIBUTION_ID=$NAME
	TCLI_LINUX_DISTRIBUTION_RELEASE=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	TCLI_LINUX_DISTRIBUTION_ID=$(lsb_release -si)
	TCLI_LINUX_DISTRIBUTION_RELEASE=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	TCLI_LINUX_DISTRIBUTION_ID=$DISTRIB_ID
	TCLI_LINUX_DISTRIBUTION_RELEASE=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	TCLI_LINUX_DISTRIBUTION_ID=Debian
	TCLI_LINUX_DISTRIBUTION_RELEASE=$(cat /etc/debian_version)
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	TCLI_LINUX_DISTRIBUTION_ID=$(uname -s)
	TCLI_LINUX_DISTRIBUTION_RELEASE=$(uname -r)
fi

case $(uname -m) in
x86_64)
	TCLI_LINUX_DISTRIBUTION_ARCH=x64  # or AMD64 or Intel64 or whatever
	;;
i*86)
	TCLI_LINUX_DISTRIBUTION_ARCH=x86  # or IA32 or Intel32 or whatever
	;;
*)
	exit 1
	;;
esac
