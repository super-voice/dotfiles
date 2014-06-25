#!/bin/sh

# Borrowed from 
# https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0
# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false
# Finder: Always open everything in Finder's list view. This is important.
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Borrowed from https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
#defaults write NSGlobalDomain AppleShowAllExtensions -bool true

