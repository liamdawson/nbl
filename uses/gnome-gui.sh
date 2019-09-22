#!/usr/bin/env bash

# arc-darker theme
dconf write /org/gnome/desktop/interface/gtk-theme "'Arc-Darker'"
# use capslock as esc
dconf write /org/gnome/desktop/input-sources/xkb-options "['terminate:ctrl_alt_bksp', 'caps:escape']"

dconf write /org/gnome/desktop/interface/show-battery-percentage true

