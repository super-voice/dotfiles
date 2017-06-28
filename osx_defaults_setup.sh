#!/usr/bin/env bash

# this part comes from
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

# this part comes from
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Disable local Time Machine snapshots
sudo tmutil disablelocal

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0
# Remove the sleep image file to save disk space
sudo rm -f /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"
defaults write com.apple.CrashReporter DialogType -string "developer"

# Disable Crash Reporter
#launchctl unload -w /System/Library/LaunchAgents/com.apple.ReportCrash.plist
#sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
