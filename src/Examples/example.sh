#!/bin/bash

declare -r PATH_ROOT=$(realpath $(dirname "$0"))
declare -r PATH_VENDOR="$PATH_ROOT/Vendor"
declare -r PATH_VENDOR_LINUX_DISTRIBUTION="$PATH_VENDOR/Linux.Distribution"

# Create the Vendor directory if it doesn't exist
[[ -d "$PATH_VENDOR_LINUX_DISTRIBUTION" ]] || mkdir -p "$PATH_VENDOR_LINUX_DISTRIBUTION"


cd "$PATH_VENDOR_LINUX_DISTRIBUTION"
# Download and extract the contents from GitHub into the Vendor directory
curl -L https://github.com/TirsvadCLI/Linux.Distribution/tarball/master | tar xzf - --strip-components=2 --wildcards '*/src/*'
. "$PATH_VENDOR_LINUX_DISTRIBUTION/Distribution/distribution.sh"
cd "$PATH_ROOT"

echo "Distribution = $TCLI_LINUX_DISTRIBUTION_ID"
echo "Release = $TCLI_LINUX_DISTRIBUTION_RELEASE"
echo "Arch = $TCLI_LINUX_DISTRIBUTION_ARCH"
