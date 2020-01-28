# Nebula

[Misc notes](./MISC.md)

## Windows Prerequisites

* [Boxstarter](https://boxstarter.org/)

`Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/liamdawson/nbl/master/win/boxstarter.ps1 -DisableReboots`

## macOS Prerequisites

```shell
# maybe?
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

## Linux Prerequisites

```shell
sudo apt install -y git curl
```

## Shared manual setup

```shell
echo -e "[include]\n  path = .synced/.gitconfig" >> ~/.gitconfig
```

## Installation

```shell
mkdir -p ~/.nbl
curl -fsSL https://github.com/liamdawson/nbl/archive/master.tar.gz | tar xz --directory ~/.nbl --strip-components=1
cd ~/.nbl
git init
git remote add origin git@github.com:liamdawson/nbl.git

bash form && bash link
```
