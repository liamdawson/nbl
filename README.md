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
mkdir -p ~/.nbl
curl -fsSL https://github.com/liamdawson/nbl/archive/master.tar.gz | tar xz --directory ~/.nbl --strip-components=1
cd ~/.nbl
git remote add origin git@github.com:liamdawson/nbl.git

bash form && bash link
```
