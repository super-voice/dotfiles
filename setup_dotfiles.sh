#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

if [[ ! -a ~/.zshrc ]]
then
  ln -s $script_dir/zshrc ~/.zshrc
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -s $script_dir/vimrc ~/.vimrc
fi

if [[ ! -a ~/.config/fish/config.fish ]]
then
  mkdir -p ~/.config/fish
  ln -s $script_dir/config.fish ~/.config/fish/config.fish
fi

if [[ ! -a ~/.gitignore_global ]]
then
  ln -s $script_dir/gitignore_global ~/.gitignore_global
fi

if [[ ! -a ~/.tmux.conf ]]
then
  ln -s $script_dir/tmux.conf ~/.tmux.conf
fi

# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

platform=$(uname)

# Naturally, macvim needs to be installed for this to work
#if [[ $platform == *Darwin* ]]
#then
#  # symlinks for mvim
#  if [[ -a ~/bin/mvim ]]
#  then
#    ln -s ~/bin/mvim ~/bin/gvimdiff
#    ln -s ~/bin/mvim ~/bin/vimdiff
#    ln -s ~/bin/mvim ~/bin/vim
#    ln -s ~/bin/mvim ~/bin/gvim
#    ln -s ~/bin/mvim ~/bin/vi
#  else
#    ln -s /usr/local/bin/mvim ~/bin/gvimdiff
#    ln -s /usr/local/bin/mvim ~/bin/vimdiff
#    ln -s /usr/local/bin/mvim ~/bin/vim
#    ln -s /usr/local/bin/mvim ~/bin/gvim
#    ln -s /usr/local/bin/mvim ~/bin/vi
#  fi
#fi

source $script_dir/gitconfig_setup.sh

