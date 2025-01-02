[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<br />
<div align="center">
    <a href="https://github.com/TirsvadCLI/Linux.Distribution">
        <img src="images/logo.png" alt="Logo" width="80" height="80">
    </a>
</div>

# Linux Distribution Script
This script retrieves the operating system, version, and architecture of a Linux distribution. It accurately identifies the distribution using standard system files and commands, ensuring broad compatibility across various Linux systems.

## Getting Started

### Clone the Repository

```bash
git clone git@github.com:TirsvadCLI/Linux.Distribution.git
```

### Download the Script Directly
Alternatively, you can download the script directly with:

```bash
curl -L https://github.com/TirsvadCLI/Linux.Distribution/tarball/master | tar xz --strip-components=2 --wildcards '*/src/*' -C ./
```



## Script Description

The script primarily checks for the presence of /etc/os-release, a standard file in many Linux distributions that contains identification data for the operating system.
If /etc/os-release is not found, the script will attempt to use the lsb_release command if it is available. It also checks other files such as /etc/lsb-release and /etc/debian_version for compatibility with various distributions like Debian and Ubuntu.
As a last resort, the script defaults to using uname commands to ensure it can retrieve the necessary information across different systems.

## Variables
The script sets the following environment variables:

- `TCLI_LINUX_DISTRIBUTION_ID`: A string containing the name of the distribution.
- `TCLI_LINUX_DISTRIBUTION_RELEASE`: A string containing the version of the distribution.
- `TCLI_LINUX_DISTRIBUTION_ARCH`: A string containing the architecture of the distribution.

    Can return folling values
    - `x64`: AMD64 or Intel64
    - `x86`: IA32 or Intel32
    - `arm`: ARM and combatible variants
    - `riscv64`: RISC-V 64-bit
    - $(uname -m) for all others arch

## Examples

```bash
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
```

## Testing

To create a Docker image for testing, use the following command:
```bash
docker build -t linux-distro-ubuntu-test .
```

To run the test in the Docker image, execute:
```bash
docker run --rm -it  linux-distro-ubuntu-test:latest
./test_distribution.sh
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/TirsvadCLI/Linux.Distribution?style=for-the-badge

[contributors-url]: https://github.com/TirsvadCLI/Linux.Distribution/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/TirsvadCLI/Linux.Distribution?style=for-the-badge

[forks-url]: https://github.com/TirsvadCLI/Linux.Distribution/network/members

[stars-shield]: https://img.shields.io/github/stars/TirsvadCLI/Linux.Distribution?style=for-the-badge

[stars-url]: https://github.com/TirsvadCLI/Linux.Distribution/stargazers

[issues-shield]: https://img.shields.io/github/issues/TirsvadCLI/Linux.Distribution?style=for-the-badge

[issues-url]: https://github.com/TirsvadCLI/Linux.Distribution/issues

[license-shield]: https://img.shields.io/github/license/TirsvadCLI/Linux.Distribution?style=for-the-badge

[license-url]: https://github.com/TirsvadCLI/Linux.Distribution/blob/master/LICENSE

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555

[linkedin-url]: https://www.linkedin.com/in/jens-tirsvad-nielsen-13b795b9/