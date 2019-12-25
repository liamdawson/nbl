#!/usr/bin/env bash

set -eu

cd "$( dirname "${BASH_SOURCE[0]}" )"

# arc-darker theme
dconf write /org/gnome/desktop/interface/gtk-theme "'Arc-Darker'"
# use capslock as esc
dconf write /org/gnome/desktop/input-sources/xkb-options "['terminate:ctrl_alt_bksp', 'caps:escape']"

dconf write /org/gnome/desktop/interface/show-battery-percentage true

# touchpad scroll direction
dconf write /org/gnome/desktop/peripherals/touchpad/natural-scroll false

(
  cd ../dconf || exit

  dconf load /com/gexperts/Tilix/ < tilix.dconf
)
