# Nebula

## macOS Prerequisites

```shell
xcode-select --install
# maybe?
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

## Linux Prerequisites

```shell
sudo apt install -y git curl
```

## Installation

```shell
# 1. basic
curl -fsSL https://raw.githubusercontent.com/liamdawson/nbl/master/form | bash

# 2. pull everything
mkdir -p ~/.nbl; curl -fsSL https://github.com/liamdawson/nbl/archive/master.tar.gz | tar xz --directory ~/.nbl

# 3. hack on it
git clone git@github.com:liamdawson/nbl.git && cd nbl && bash form
```
