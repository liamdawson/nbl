#!/usr/bin/env bash

set -eux

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

main() {
  update_macos_settings
  configure_defaults_via_profile
  download_themes
  turn_off_gatekeeper
  sync_library
  install_mas_apps
}

update_macos_settings() {
  # tap-to-click
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

  # scroll direction
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

  # bye press-and-hold
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  # and bye slow key repeat
  defaults write NSGlobalDomain KeyRepeat -int 2
  # and bye long delay to repeat
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  # screensaver security
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # show hidden files
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  # filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  # don't warn when changing filename extensions
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # dock settings
  defaults write com.apple.dock show-recents -bool false
  defaults write com.apple.dock tilesize -int 48
  defaults write com.apple.dock autohide -bool true

  # disable smart typography
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
}

download_themes() {
  test -d ~/w/upstream/dracula-iterm || git clone https://github.com/dracula/iterm.git ~/w/upstream/dracula-iterm
}

turn_off_gatekeeper() {
  if ! [[ "$(spctl --status)" = 'assessments disabled' ]]; then
    sudo spctl --master-disable
  fi
}

sync_library() {
  stow --restow -d "./stowed" -t "${HOME}/Library" macos-user-library
}

install_mas_apps() {
  brew bundle install --file="uses/macos/Brewfile"
}

configure_defaults_via_profile() {
  /usr/bin/profiles -I -F uses/macos/askforpassworddelay.mobileconfig
}

main
