#!/bin/bash

## @file distribution.sh
## @author Jens Tirsvad Nielsen
## @version
## @brief This script retrieves the operating system, version, and architecture of a Linux distribution.
## @details
## This script retrieves the operating system, version, and architecture of a Linux distribution. It accurately identifies the distribution using standard system files and commands.
## @par URL
## https://github.com/TirsvadCLI/Linux.Distribution
## @brief Check if the script is being sourced or executed

# Check if the script is being sourced or executed
# If the script is executed, print an error message and exit with an error code.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is intended to be sourced, not executed."
	exit 1
fi

## @brief string for check if script is sourced
declare -g TCLI_LINUX_BASH_DISTRIBUTION=1.0.0

## @brief string containing name of distribution
declare TCLI_LINUX_BASH_DISTRIBUTION_ID

## @brief string containing version of distribution
declare TCLI_LINUX_BASH_DISTRIBUTION_RELEASE

## @brief string containing archecture of distribution
declare TCLI_LINUX_BASH_DISTRIBUTION_ARCH

# This script determines the Linux distribution and its version.
# It sets the following environment variables:
# - TCLI_LINUX_BASH_DISTRIBUTION_ID: The name of the Linux distribution.
# - TCLI_LINUX_BASH_DISTRIBUTION_RELEASE: The version of the Linux distribution.
#
# The script checks for the distribution information in the following order:
# 1. /etc/os-release: Standard file for freedesktop.org and systemd-based systems.
# 2. lsb_release command: Standard command for Linux Standard Base (LSB) compliant distributions.
# 3. /etc/lsb-release: Fallback for some versions of Debian/Ubuntu without the lsb_release command.
# 4. /etc/debian_version: Fallback for older Debian/Ubuntu systems.
# 5. uname command: Fallback for other systems, including BSD.
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	TCLI_LINUX_BASH_DISTRIBUTION_ID=$NAME
	TCLI_LINUX_BASH_DISTRIBUTION_RELEASE=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	TCLI_LINUX_BASH_DISTRIBUTION_ID=$(lsb_release -si)
	TCLI_LINUX_BASH_DISTRIBUTION_RELEASE=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	TCLI_LINUX_BASH_DISTRIBUTION_ID=$DISTRIB_ID
	TCLI_LINUX_BASH_DISTRIBUTION_RELEASE=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	TCLI_LINUX_BASH_DISTRIBUTION_ID=Debian
	TCLI_LINUX_BASH_DISTRIBUTION_RELEASE=$(cat /etc/debian_version)
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	TCLI_LINUX_BASH_DISTRIBUTION_ID=$(uname -s)
	TCLI_LINUX_BASH_DISTRIBUTION_RELEASE=$(uname -r)
fi

# This script determines the architecture of the current machine using the `uname -m` command
# and sets the TCLI_LINUX_BASH_DISTRIBUTION_ARCH variable accordingly.
# Supported architectures:
# - x86_64: AMD64 or Intel64
# - i*86: IA32 or Intel32
# - arm*: ARM
# - riscv64: RISC-V 64-bit
# If the architecture is not recognized, it defaults to the output of `uname -m`.
case $(uname -m) in
x86_64)
	TCLI_LINUX_BASH_DISTRIBUTION_ARCH=x64  # AMD64 or Intel64
	;;
i*86)
	TCLI_LINUX_BASH_DISTRIBUTION_ARCH=x86  # IA32 or Intel32
	;;
arm*)
	TCLI_LINUX_BASH_DISTRIBUTION_ARCH=arm  # ARM
	;;
riscv64)
	TCLI_LINUX_BASH_DISTRIBUTION_ARCH=riscv64  # RISC-V 64-bit
	;;
*)
	TCLI_LINUX_BASH_DISTRIBUTION_ARCH=$(uname -m)
	;;
esac
