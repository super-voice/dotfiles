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

if [[ ! -a ~/.ycm_extra_conf.py ]]
then
  ln -s $script_dir/ycm_extra_conf.py ~/.ycm_extra_conf.py
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
mkdir -p $HOME/.go
mkdir -p $HOME/.gems

platform=$(uname)

source $script_dir/gitconfig_setup.sh
source $script_dir/osx_defaults_setup.sh

