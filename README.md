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
This script retrieves the operating system, version, and architecture of a Linux distribution. It accurately identifies the distribution using standard system files and commands.

## Getting Started

Clone the script
```bash
git clone git@github.com:TirsvadCLI/Linux.Distribution.git
```

or

Download the bare script

```bash
curl -L https://github.com/TirsvadCLI/Linux.Distribution/tarball/master | tar xz --strip-components=2 --wildcards '*/src/*' -C ./
```


## Script Description

- The script checks for the presence of `/etc/os-release`, which is a standard file in many Linux distributions that contains identification data for the OS.
- If that file doesn't exist, the script falls back to using the `lsb_release` command if available.
- It also considers other files such as `/etc/lsb-release` and `/etc/debian_version` for compatibility with various distributions like Debian and Ubuntu.
- Finally, it defaults to `uname` commands to ensure broad compatibility across different systems.

## Variables

- `TCLI_LINUX_DISTRIBUTION_ID`: A string containing the name of the distribution.
- `TCLI_LINUX_DISTRIBUTION_RELEASE`: A string containing the version of the distribution.
- `TCLI_LINUX_DISTRIBUTION_ARCH`: A string containing the architecture of the distribution.

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