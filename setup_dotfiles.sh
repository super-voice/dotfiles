#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

if [[ ! -a ~/.zpreztorc ]]
then
  ln -s $script_dir/zpreztorc ~/.zpreztorc
fi

if [[ ! -a ~/.zshrc ]]
then
  ln -s $script_dir/zshrc ~/.zshrc
fi

if [[ ! -a ~/.zprezto ]]
then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "$HOME"/.zprezto/runcoms/^README.md(.N);
  do
    ln -s "$rcfile" "$HOME/.${rcfile:t}"
  done
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -s $script_dir/vimrc ~/.vimrc
fi

if [[ ! -a ~/.oh-my-fish ]]
then
  git clone git://github.com/bpinto/oh-my-fish.git "$HOME/.oh-my-fish"
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

mkdir -p $HOME/bin
mkdir -p $HOME/.local/go
mkdir -p $HOME/.local/gems

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

