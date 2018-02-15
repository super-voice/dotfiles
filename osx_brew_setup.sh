#!/usr/bin/env bash

# install homebrew first
if [[ -z "$(which brew)" ]]; then
  echo "Homebrew is not detected, install Homebrew first"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is detected"
fi

# install brew's necessary components, errors is expected
brew install $(< brew_list) || :
