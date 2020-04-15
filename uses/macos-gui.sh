#!/usr/bin/env bash

set -eux

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

main() {
  update_macos_settings
  configure_defaults_via_profile
  download_themes
  ## guess I have to get used to it? :/
  # turn_off_gatekeeper
  sync_library
  install_mas_apps
}

update_macos_settings() {
  # tap-to-click
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  # scroll direction
  # defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  # disable smart typography
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
  # filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  # always use expanded file dialogs
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
  # Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
  # don't terminate inactive apps
  defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

  # Save to disk (not to iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  # show hidden files
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  # don't warn when changing filename extensions
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  # show Finder path bar
  defaults write com.apple.finder ShowPathbar -bool true
  # keep folders on top when sorting by file name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # don't .DS_Store on removable/network locations
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # dock settings
  defaults write com.apple.dock show-recents -bool false
  defaults write com.apple.dock tilesize -int 48
  defaults write com.apple.dock autohide -bool true
  
  # textedit plain text
  defaults write com.apple.TextEdit RichText -int 0

  # disable resume windows system-wide
  defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

  defaults write com.apple.screencapture type -string "png"
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
