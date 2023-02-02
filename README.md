# Linux Distribution
Getting linux distribution information as Name and Version

## Add it as submodule to your git project
mkdir <submodule folder>
cd <submodule folder>
git submodule add git@github.com:TirsvadCLI/Linux.Distribution.git
git submodule init
git submodule update

## How to use
In your script file

    . <submodule folder>/src/Distribution/distribution.sh
